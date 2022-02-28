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

namespace MyMusicLists.Sources.Adapters
{
    public class MusicAdapter : BaseAdapter<Music.Music>
    {
        public List<Music.Music> Musics { get; private set; }
        public Activity Context { get; private set; }

        public MusicAdapter(Activity context, List<Music.Music> musics) : base()
        {
            Context = context;
            Musics = musics;
        }

        public override long GetItemId(int position)
        {
            return position;
        }

        public override Music.Music this[int position] => Musics[position];

        public override int Count => Musics.Count;

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            var item = Musics[position];
            var view = convertView;

            if (view == null)
            {
                view = Context.LayoutInflater.Inflate(Resource.Layout.music_list_view_layout, null);
            }

            if (item.Cover != null)
            {
                view.FindViewById<ImageView>(Resource.Id.music_list_view_cover).SetImageBitmap(item.Cover);
            }
            view.FindViewById<TextView>(Resource.Id.music_list_view_title).Text = item.Title;
            view.FindViewById<TextView>(Resource.Id.music_list_view_detail).Text = Extra.Utility.LinkStrings(item.Artists, "", "", ",") + " / " + item.Album;

            return view;
        }
    }
}