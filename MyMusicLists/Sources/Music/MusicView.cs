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
    public class MusicView : MusicSet
    {
        public string Rule { get; private set; }
        public override bool IsView { get; protected set; } = true;

        public MusicView(List<Music> musics, string name, string rule) : base(musics, name)
        {
            Rule = rule;
        }
    }

    public enum MusicViewUpdateFrequency
    {
        NoUpdate,
        UpdateHandly,
        UpdateOnInitialize,
        UpdateOnOpen
    }
}