using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Android.Util;

namespace MyMusicLists.Sources
{
    class Application
    {
        public static Dictionary<string, Music.MusicSet> MusicSets { get; private set; } = new Dictionary<string, Music.MusicSet>();
        public static Dictionary<string, Music.MusicView> MusicViews { get; private set; } = new Dictionary<string, Music.MusicView>();
        public static List<string> MusicCollectPaths { get; private set; } = new List<string>();
        public static Music.MusicViewUpdateFrequency GlobalUpdateFrequency { get; set; } = Music.MusicViewUpdateFrequency.NoUpdate;
        public static string LastPlayMusicList { get; set; }

        public static bool CheckIfMusicListExist(string name)
        {
            return MusicSets.ContainsKey(name) || MusicViews.ContainsKey(name);
        }

        public static void CreateMusicSet(Context context, string setName)
        {
            var path = context.Resources.GetString(Resource.String.application_external_files_path) + context.Resources.GetString(Resource.String.application_music_lists_sets_relative_path) + "/" + setName + ".json";
            
            if (File.Exists(path))
            {
                return;
            }

            var json = $"{{\"name\": \"{setName}\", \"musics\": []}}";

            var fileStream = new FileStream(path, FileMode.Create);
            var fileWriter = new StreamWriter(fileStream);
            fileWriter.WriteLine(json);
            fileWriter.Close();
            fileStream.Close();

            if (!CheckIfMusicListExist(setName))
            {
                var set = new Music.MusicSet(new List<Music.Music>(), setName);
                set.Updated = true;
                MusicSets.Add(setName, set);
            }
            else
            {
                Log.Debug("test", setName + "exist");
            }
        }

        public static void CreateMusicView(Context context, string viewName, string rule)
        {
            var path = context.Resources.GetString(Resource.String.application_external_files_path) + 
                context.Resources.GetString(Resource.String.application_music_lists_views_relative_path) + "/" + viewName + ".json";

            if (!CheckIfMusicListExist(viewName))
            {
                var view = new Music.MusicView(DecodeMusicViewRule(context, rule).Musics, viewName, rule);
                view.Updated = true;
                MusicViews.Add(viewName, view);
            }
            else
            {
                return;
            }

            if (File.Exists(path))
            {
                return;
            }

            var json = $"{{\"name\": \"{viewName}\", \"rule\": \"{rule}\", \"updateFrequency\": 1, \"musics\": []}}";

            var fileStream = new FileStream(path, FileMode.Create);
            var fileWriter = new StreamWriter(fileStream);
            fileWriter.WriteLine(json);
            fileWriter.Close();
            fileStream.Close();
        }

        public static void DeleteMusicList(Context context, bool isView, string name)
        {
            if (isView)
            {
                var path = context.Resources.GetString(Resource.String.application_external_files_path) + 
                    context.Resources.GetString(Resource.String.application_music_lists_views_relative_path) + "/" + name + ".json";

                if (File.Exists(path))
                {
                    File.Delete(path);
                }

                if (MusicViews.ContainsKey(name))
                {
                    MusicViews.Remove(name);
                }
            }
            else
            {
                var path = context.Resources.GetString(Resource.String.application_external_files_path) +
                    context.Resources.GetString(Resource.String.application_music_lists_sets_relative_path) + "/" + name + ".json";

                if (File.Exists(path))
                {
                    File.Delete(path);
                }

                if (MusicSets.ContainsKey(name))
                {
                    MusicSets.Remove(name);
                }
            }
        }

        public static Music.MusicList DecodeMusicViewRule(Context context, string rule)
        {
            Func<string, int> operatorPriority = (operate) =>
            {
                switch (operate)
                {
                    case "+":
                    case "-":
                        return 1;
                    case "*":
                        return 2;
                    case "!":
                        return 3;
                    case "(":
                    case ")":
                        return 4;
                    default:
                        return -1;
                }
            };

            Func<string, bool> isOperator = (str) =>
            {
                switch (str)
                {
                    case "+":
                    case "-":
                    case "*":
                    case "!":
                    case "(":
                    case ")":
                        return true;
                    default:
                        return false;
                }
            };

            Func<Music.MusicList, Music.MusicList, string, Music.MusicList>
            calculate = (left, right, operate) =>
            {
                switch (operate)
                {
                    case "+":
                        return left + right;
                    case "-":
                        return left - right;
                    case "*":
                        return left * right;
                    case "!":
                        return left.Complement(MusicSets[context.Resources.GetString(Resource.String.application_set_all_musics_name)]);
                    default:
                        return null;
                }
            };

            var inputs = rule.Split(' ');
            var outputStack = new Stack<string>();
            var operatorStack = new Stack<string>();

            foreach (var input in inputs)
            {
                var element = input.Trim();
                Log.Debug("Decode Rule", "convert - element: " + element);
                
                if (string.IsNullOrWhiteSpace(element))
                {
                    continue;
                }

                if (isOperator(element))
                {
                    if (element == ")")
                    {
                        while (operatorStack.Count > 0 && operatorStack.Peek() != "(")
                        {
                            outputStack.Push(operatorStack.Pop());
                        }

                        if (operatorStack.Count > 0 && operatorStack.Peek() == "(")
                        {
                            operatorStack.Pop();
                        }
                    }
                    else
                    {
                        while (operatorStack.Count > 0 && operatorPriority(operatorStack.Peek()) >= operatorPriority(element))
                        {
                            var temp = operatorStack.Peek();
                            if (temp != "(" && temp != ")")
                            {
                                outputStack.Push(operatorStack.Pop());
                            }
                            else
                            {
                                break;
                            }
                        }

                        operatorStack.Push(element);
                    }
                }
                else
                {
                    outputStack.Push(element);
                }
            }

            while (operatorStack.Count > 0)
            {
                outputStack.Push(operatorStack.Pop());
            }

            var resultStack = new Stack<Music.MusicList>();
            var outputList = outputStack.ToList();
            outputList.Reverse();

            foreach (var element in outputList)
            {
                if (isOperator(element))
                {
                    if (element == "!")
                    {
                        var left = resultStack.Pop();
                        resultStack.Push(calculate(left, null, element));
                    }
                    else
                    {
                        var right = resultStack.Pop();
                        var left = resultStack.Pop();
                        resultStack.Push(calculate(left, right, element));
                    }
                }
                else
                {
                    if (MusicSets.ContainsKey(element))
                    {
                        resultStack.Push(MusicSets[element]);
                    }
                    else if (MusicViews.ContainsKey(element))
                    {
                        resultStack.Push(MusicViews[element]);
                    }
                    else
                    {
                        throw new ArgumentException($"规则：{rule} 不合法。");
                    }
                }
            }

            if (resultStack.Count != 1)
            {
                throw new ArgumentException($"规则：{rule} 不合法。");
            }

            return resultStack.Peek();
        }

        public static void CheckDirectories(Context context)
        {
            var storagePath = context.Resources.GetString(Resource.String.application_external_files_path);
            var musicListsPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_relative_path);
            var musicSetsPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_sets_relative_path);
            var musicViewsPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_views_relative_path);

            if (!Directory.Exists(musicListsPath))
            {
                Directory.CreateDirectory(musicListsPath);
                Directory.CreateDirectory(musicSetsPath);
                Directory.CreateDirectory(musicViewsPath);
                CreateMusicSet(context, context.Resources.GetString(Resource.String.application_set_all_musics_name));
            }
            else
            {
                if (!Directory.Exists(musicSetsPath))
                {
                    Directory.CreateDirectory(musicSetsPath);
                    CreateMusicSet(context, context.Resources.GetString(Resource.String.application_set_all_musics_name));
                }

                if (!Directory.Exists(musicViewsPath))
                {
                    Directory.CreateDirectory(musicViewsPath);
                }
            }
        }

        public static void InitializeConfig(Context context)
        {
            var configPath = context.Resources.GetString(Resource.String.application_external_files_path) 
                + "/" + context.Resources.GetString(Resource.String.application_config_relative_path);

            if (File.Exists(configPath))
            {
                var reader = new StreamReader(configPath);
                var jsonObject = Newtonsoft.Json.Linq.JObject.Parse(reader.ReadToEnd());
                reader.Close();

                MusicCollectPaths.AddRange(jsonObject.SelectToken("MusicCollectPaths").ToObject<string[]>());
                GlobalUpdateFrequency = (Music.MusicViewUpdateFrequency)jsonObject.SelectToken("MusicViewUpdateFrequency").ToObject<int>();
                LastPlayMusicList = jsonObject.SelectToken("LastPlayMusicList").ToObject<string>();
            }
            else
            {
                var fileStream = new FileStream(configPath, FileMode.Create);
                var writer = new StreamWriter(fileStream);
                writer.WriteLine("{\"MusicCollectPaths\": [\"/storage/emulated/0/Music\"],\"MusicViewUpdateFrequency\": 1,\"LastPlayMusicList\": null}");
                writer.Close();
                fileStream.Close();

                MusicCollectPaths.Add("/storage/emulated/0/Music");
                GlobalUpdateFrequency = Music.MusicViewUpdateFrequency.UpdateHandly;
                LastPlayMusicList = null;
            }

            var allMusics = MusicSets[context.Resources.GetString(Resource.String.application_set_all_musics_name)];
            foreach (var path in MusicCollectPaths)
            {
                var musicPaths = Directory.GetFiles(path, "*.mp3", SearchOption.AllDirectories);

                foreach (var musicPath in musicPaths)
                {
                    if (!musicPath.EndsWith(".mp3"))
                    {
                        continue;
                    }
                    var tag = TagLib.File.Create(musicPath);

                    Android.Graphics.Bitmap coverBitmap = null;
                    if (tag.Tag.Pictures.Length > 0)
                    {
                        var cover = tag.Tag.Pictures[0];
                        var bytes = new byte[cover.Data.Count];
                        cover.Data.CopyTo(bytes, 0);
                        coverBitmap = Android.Graphics.BitmapFactory.DecodeByteArray(bytes, 0, bytes.Length);
                    }

                    allMusics.Musics.Add(new Music.Music(tag.Tag.Title, tag.Tag.Album, tag.Tag.Performers, coverBitmap, musicPath));
                }
            }
        }

        public static void InitializeMusicLists(Context context)
        {
            var storagePath = context.Resources.GetString(Resource.String.application_external_files_path);
            var musicSetsDirPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_sets_relative_path);
            var musicViewsDirPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_views_relative_path);

            var musicSetsPath = Directory.GetFiles(musicSetsDirPath, "*.json", SearchOption.AllDirectories);
            var musicViewsPath = Directory.GetFiles(musicViewsDirPath, "*.json", SearchOption.AllDirectories);

            Func<string[], List<Music.Music>> decodeMusics = (musicsPath) =>
            {
                var musics = new List<Music.Music>();

                foreach (var musicPath in musicsPath)
                {
                    if (!musicPath.EndsWith(".mp3"))
                    {
                        continue;
                    }
                    var tag = TagLib.File.Create(musicPath);

                    Android.Graphics.Bitmap coverBitmap = null;
                    if (tag.Tag.Pictures.Length > 0)
                    {
                        var cover = tag.Tag.Pictures[0];
                        var bytes = new byte[cover.Data.Count];
                        cover.Data.CopyTo(bytes, 0);
                        coverBitmap = Android.Graphics.BitmapFactory.DecodeByteArray(bytes, 0, bytes.Length);
                    }

                    musics.Add(new Music.Music(tag.Tag.Title, tag.Tag.Album, tag.Tag.Performers, coverBitmap, musicPath));
                }

                return musics;
            };

            foreach (var setPath in musicSetsPath)
            {
                var reader = new StreamReader(setPath);
                var json = Newtonsoft.Json.Linq.JObject.Parse(reader.ReadToEnd());
                reader.Close();

                var setName = json.SelectToken("name").ToObject<string>();
                if (CheckIfMusicListExist(setName))
                {
                    continue;
                }

                var musicsPath = json.SelectToken("musics").ToObject<string[]>();
                var musics = decodeMusics(musicsPath);

                MusicSets.Add(setName, new Music.MusicSet(musics, setName));
            }

            foreach (var viewPath in musicViewsPath)
            {
                var reader = new StreamReader(viewPath);
                var json = Newtonsoft.Json.Linq.JObject.Parse(reader.ReadToEnd());
                reader.Close();

                var viewName = json.SelectToken("name").ToObject<string>();
                if (CheckIfMusicListExist(viewName))
                {
                    continue;
                }

                var musicsPath = json.SelectToken("musics").ToObject<string[]>();
                var rule = json.SelectToken("rule").ToObject<string>();
                var musics = decodeMusics(musicsPath);

                MusicViews.Add(viewName, new Music.MusicView(musics, viewName, rule));
            }
        }

        public static void UpdateConfig(Context context)
        {
            var configPath = context.Resources.GetString(Resource.String.application_external_files_path)
                + "/" + context.Resources.GetString(Resource.String.application_config_relative_path);

            var fileStream = new FileStream(configPath, FileMode.Create);
            var writer = new StreamWriter(fileStream);
            writer.WriteLine($"{{\"MusicCollectPaths\": [{Extra.Utility.LinkStrings(MusicCollectPaths, "\"", "\"", ",")}],\"MusicViewUpdateFrequency\": {(int)GlobalUpdateFrequency},\"LastPlayMusicList\": {($"\"{LastPlayMusicList}\"" ?? "null")}}}");
            writer.Close();
            fileStream.Close();
        }

        public static void UpdateMusicList(Context context, bool isView, string name)
        {
            if (name == context.Resources.GetString(Resource.String.application_set_all_musics_name))
            {
                return;
            }

            var storagePath = context.Resources.GetString(Resource.String.application_external_files_path);
            var musicSetsDirPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_sets_relative_path);
            var musicViewsDirPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_views_relative_path);

            if (isView)
            {
                if (!MusicViews[name].Updated)
                {
                    return;
                }
                MusicViews[name].Updated = false;

                var list = MusicViews[name];

                var fileStream = new FileStream($"{musicViewsDirPath}/{name}.json", FileMode.Create);
                var writer = new StreamWriter(fileStream);

                var datas = new List<string>();
                foreach (var music in list.Musics)
                {
                    datas.Add(music.Path);
                }
                writer.WriteLine($"{{\"name\":\"{name}\", \"rule\": \"{list.Rule}\", \"updateFrequency\":{(int)GlobalUpdateFrequency}, \"musics\":[{Extra.Utility.LinkStrings(datas, "\"", "\"", ",")}]}}");

                writer.Close();
                fileStream.Close();
            }
            else
            {
                if (!MusicSets[name].Updated)
                {
                    return;
                }
                MusicSets[name].Updated = false;

                var list = MusicSets[name];

                var fileStream = new FileStream($"{musicSetsDirPath}/{name}.json", FileMode.Create);
                var writer = new StreamWriter(fileStream);

                var datas = new List<string>();
                foreach (var music in list.Musics)
                {
                    datas.Add(music.Path);
                }
                writer.WriteLine($"{{\"name\":\"{name}\", \"musics\":[{Extra.Utility.LinkStrings(datas, "\"", "\"", ",")}]}}");

                writer.Close();
                fileStream.Close();
            }
        }

        public static void ReDecodeMusicViews(Context context)
        {
            var keys = MusicViews.Keys;
            for (var i = 0; i < keys.Count; ++i)
            {
                var key = keys.ElementAt(i);
                MusicViews[key] = new Music.MusicView(DecodeMusicViewRule(context, MusicViews[key].Rule).Musics, MusicViews[key].Name, MusicViews[key].Rule);
            }
        }

        public static void UpdateMusicLists(Context context)
        {
            var storagePath = context.Resources.GetString(Resource.String.application_external_files_path);
            var musicSetsDirPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_sets_relative_path);
            var musicViewsDirPath = storagePath + context.Resources.GetString(Resource.String.application_music_lists_views_relative_path);

            foreach (var pair in MusicSets)
            {
                if (!pair.Value.Updated)
                {
                    continue;
                }

                var fileStream = new FileStream($"{musicSetsDirPath}/{pair.Key}.json", FileMode.Create);
                var writer = new StreamWriter(fileStream);

                var datas = new List<string>();
                foreach (var music in pair.Value.Musics)
                {
                    datas.Add(music.Path);
                }
                writer.WriteLine($"{{\"name\":\"{pair.Key}\", \"musics\":[{Extra.Utility.LinkStrings(datas, "\"", "\"", ",")}]}}");

                writer.Close();
                fileStream.Close();
            }

            foreach (var pair in MusicViews)
            {
                if (!pair.Value.Updated)
                {
                    continue;
                }

                var fileStream = new FileStream($"{musicViewsDirPath}/{pair.Key}.json", FileMode.Create);
                var writer = new StreamWriter(fileStream);

                var datas = new List<string>();
                foreach (var music in pair.Value.Musics)
                {
                    datas.Add(music.Path);
                }
                writer.WriteLine($"{{\"name\":\"{pair.Key}\", \"rule\":{pair.Value.Rule}, \"updateFrequency\":{(int)GlobalUpdateFrequency}, \"musics\":[{Extra.Utility.LinkStrings(datas, "\"", "\"", ",")}]}}");

                writer.Close();
                fileStream.Close();
            }
        }
    }
}