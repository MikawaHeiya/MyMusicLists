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

namespace MyMusicLists.Sources.Views
{
    public class MusicListView : LinearLayout
    {
        public Music.MusicList MusicList
        {
            get { return musicList; }
            set
            {
                musicList = value;

                if (musicList.Musics.Count > 0)
                {
                    cover.SetImageBitmap(musicList.Musics[0].Cover);
                }

                detail.Text = $"共{musicList.Musics.Count}首音乐";
            }
        }

        public string Title
        {
            get { return title.Text; }
            set { title.Text = value; }
        }

        private ImageView cover;
        private TextView title;
        private TextView detail;
        private Music.MusicList musicList;

        public MusicListView(Context context) : base(context)
        {
            Initialize(context);
        }

        public MusicListView(Context context, IAttributeSet attributeSet) : base(context, attributeSet)
        {
            Initialize(context);
        }

        private void Initialize(Context context)
        {
            LayoutInflater.From(context).Inflate(Resource.Layout.music_list_view_layout, this);

            cover = FindViewById<ImageView>(Resource.Id.music_list_view_cover);
            title = FindViewById<TextView>(Resource.Id.music_list_view_title);
            detail = FindViewById<TextView>(Resource.Id.music_list_view_detail);

            cover.SetImageBitmap(Android.Graphics.BitmapFactory.DecodeResource(context.Resources, Resource.Drawable.default_cover));
            title.Text = "空白歌单";
            detail.Text = "共0首音乐";
        }
    }
}