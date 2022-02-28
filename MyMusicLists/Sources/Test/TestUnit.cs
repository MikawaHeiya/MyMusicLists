using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyMusicLists.Sources.Test
{
    class TestUnit
    {
        public static void LogMusicsInfo(ImageView imageView)
        {
            string path = "/storage/emulated/0/Music/坂上なち - DEDICATE TO YOU.mp3";

            var tagFile = TagLib.File.Create(path);
            Log.Debug("Test", $"Title: {tagFile.Tag.Title}\nArtist: {tagFile.Tag.Performers[0]}\nAlbum: {tagFile.Tag.Album}\n");
            if (tagFile.Tag.Pictures.Length > 0)
            {
                var picture = tagFile.Tag.Pictures[0];
                var bytes = new byte[picture.Data.Count];
                picture.Data.CopyTo(bytes, 0);
                var bitmap = Android.Graphics.BitmapFactory.DecodeByteArray(bytes, 0, bytes.Length);
                imageView.SetImageBitmap(bitmap);
            }
        }

        public static void AnalyseJson(Context context)
        {
            var path = context.Resources.GetString(Resource.String.application_external_files_path) + "/MusicLists/sets/测试歌单.json";

            var jsonString = new System.IO.StreamReader(path).ReadToEnd();
            var jsonObject = Newtonsoft.Json.Linq.JObject.Parse(jsonString);
            Log.Debug("test", Extra.Utility.LinkStrings(jsonObject.SelectToken("musics").ToObject<string[]>(), "", "", ","));
        }

        public static void LogAllMusicLists()
        {
            var tag = "test";
            foreach (var pair in Sources.Application.MusicSets)
            {

                Log.Debug(tag, $"Set: {pair.Key}");
                foreach (var music in pair.Value.Musics)
                {
                    Log.Debug(tag, music.ToString());
                }
            }

            foreach (var pair in Sources.Application.MusicViews)
            {

                Log.Debug(tag, $"View: {pair.Key}");
                foreach (var music in pair.Value.Musics)
                {
                    Log.Debug(tag, music.ToString());
                }
            }
        }
    }
}