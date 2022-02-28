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

namespace MyMusicLists.Sources.Views
{
    public class MusicLabelView : LinearLayout
    {
        public Music.Music Music
        {
            get { return music; }
            set
            {
                music = value;
                if (music.Cover != null)
                {
                    cover.SetImageBitmap(music.Cover);
                }

                title.Text = music.Title;
                detail.Text = Extra.Utility.LinkStrings(music.Artists, "", "", ",") + " / " + music.Album;
            }
        }

        private ImageView cover;
        private TextView title;
        private TextView detail;
        private Music.Music music;

        public MusicLabelView(Context context) : base(context)
        {
            Initialize(context);
        }

        public MusicLabelView(Context context, Android.Util.IAttributeSet attributeSet) : base(context, attributeSet)
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
            title.Text = "未知音乐";
            detail.Text = "未知歌手 / 未知专辑";
        }
    }
}