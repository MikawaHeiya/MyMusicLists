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
    class MusicListAdapter : BaseAdapter<Music.MusicSet>
    {
        public List<Music.MusicSet> MusicSets { get; private set; }
        public Activity Context { get; private set; }

        public MusicListAdapter(Activity context, List<Music.MusicSet> musicSets) : base()
        {
            Context = context;
            MusicSets = musicSets;
        }

        public override long GetItemId(int position)
        {
            return position;
        }

        public override Music.MusicSet this[int position]
        {
            get { return MusicSets[position]; }
        }

        public override int Count => MusicSets.Count;

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            var item = MusicSets[position];
            var view = convertView;

            if (view == null)
            {
                view = Context.LayoutInflater.Inflate(Resource.Layout.music_list_view_layout, null);
            }

            if (item.Musics.Count > 0)
            {
                view.FindViewById<ImageView>(Resource.Id.music_list_view_cover).SetImageBitmap(item.Musics[0].Cover);
            }
            view.FindViewById<TextView>(Resource.Id.music_list_view_title).Text = item.Name;
            view.FindViewById<TextView>(Resource.Id.music_list_view_detail).Text = $"共{item.Musics.Count}首音乐";

            return view;
        }
    }
}