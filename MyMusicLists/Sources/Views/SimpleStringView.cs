using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Util;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MyMusicLists.Sources.Views
{
    public class SimpleStringView : RelativeLayout
    {
        public SimpleStringView(Context context) :
            base(context)
        {
            Initialize(context);
        }

        public SimpleStringView(Context context, IAttributeSet attrs) :
            base(context, attrs)
        {
            Initialize(context);
        }

        public SimpleStringView(Context context, IAttributeSet attrs, int defStyle) :
            base(context, attrs, defStyle)
        {
            Initialize(context);
        }

        public TextView SimpleStringText { get; private set; }
        public ImageView DeleteButton { get; private set; }
        public string Text { get { return SimpleStringText.Text; } set { SimpleStringText.Text = value; } }

        private void Initialize(Context context)
        {
            LayoutInflater.From(context).Inflate(Resource.Layout.simple_string_view_layout, this);

            SimpleStringText = FindViewById<TextView>(Resource.Id.SimplestringText);
            DeleteButton = FindViewById<ImageView>(Resource.Id.SimpleStringDeleteButton);
        }
    }
}