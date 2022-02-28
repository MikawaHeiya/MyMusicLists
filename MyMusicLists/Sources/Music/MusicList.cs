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
    public class MusicList
    {
        public List<Music> Musics { get; private set; }
        public bool Updated { set; get; } = false;

        public MusicList(List<Music> musics)
        {
            Musics = musics;
        }

        public Music this[int position]
        {
            get { return Musics[position]; }
        }

        public static MusicList operator+(MusicList left, MusicList right)
        {
            var musics = new List<Music>(left.Musics);
            foreach (var music in right.Musics)
            {
                if (musics.Contains(music))
                {
                    continue;
                }
                musics.Add(music);
            }

            return new MusicList(musics);
        }

        public static MusicList operator-(MusicList left, MusicList right)
        {
            var musics = new List<Music>(left.Musics);
            foreach (var music in right.Musics)
            {
                if (musics.Contains(music))
                {
                    musics.Remove(music);
                }
            }

            return new MusicList(musics);
        }

        public static MusicList operator*(MusicList left, MusicList right)
        {
            var musics = new List<Music>();
            foreach (var music in left.Musics)
            {
                if (right.Musics.Contains(music))
                {
                    musics.Add(music);
                }
            }

            return new MusicList(musics);
        }

        public MusicList Complement(MusicList allMusics)
        {
            return allMusics - this;
        }
    }
}