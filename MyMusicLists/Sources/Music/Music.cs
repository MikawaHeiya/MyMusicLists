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

namespace MyMusicLists.Sources.Music
{
    public class Music
    {
        public string Title { get; private set; }
        public string Album { get; private set; }
        public string[] Artists { get; private set; }
        public Android.Graphics.Bitmap Cover { get; private set; }
        public string Path { get; private set; }

        public Music(string title, string album, string[] artists, Android.Graphics.Bitmap cover, string path)
        {
            Title = title;
            Album = album;
            Artists = artists;
            Cover = cover;
            Path = path;
        }

        public override string ToString()
        {
            return $"{{\"title\": \"{Title}\", \"album\": \"{Album}\", \"artists\": {Extra.Utility.LinkStrings(Artists, "[", "]", ",")}, \"path\": \"{Path}\"}}";
        }

        public override bool Equals(object obj)
        {
            if (obj is Music)
            {
                var another = obj as Music;
                return Path == another.Path;
            }

            return false;
        }

        public override int GetHashCode()
        {
            return Path.GetHashCode();
        }

        static public bool operator==(Music left, Music right)
        {
            return left.Path == right.Path;
        }

        static public bool operator!=(Music left, Music right)
        {
            return left.Path != right.Path;
        }
    }
}