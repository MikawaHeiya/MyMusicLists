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
    public class NewMusicViewDialog : LinearLayout
    {
        public NewMusicViewDialog(Context context) :
            base(context)
        {
            Initialize(context);
        }

        public NewMusicViewDialog(Context context, IAttributeSet attrs) :
            base(context, attrs)
        {
            Initialize(context);
        }

        public NewMusicViewDialog(Context context, IAttributeSet attrs, int defStyle) :
            base(context, attrs, defStyle)
        {
            Initialize(context);
        }

        public EditText NameInput { get; private set; }
        public EditText RuleInput { get; private set; }

        private void Initialize(Context context)
        {
            LayoutInflater.From(context).Inflate(Resource.Layout.new_music_view_layout, this);

            NameInput = FindViewById<EditText>(Resource.Id.NewMusicViewNameInput);
            RuleInput = FindViewById<EditText>(Resource.Id.NewMusicViewRuleInput);
        }
    }
}