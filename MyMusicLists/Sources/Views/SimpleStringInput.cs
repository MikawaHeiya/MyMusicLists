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
    public class SimpleStringInput : LinearLayout
    {
        public SimpleStringInput(Context context) :
            base(context)
        {
            Initialize(context);
        }

        public SimpleStringInput(Context context, IAttributeSet attrs) :
            base(context, attrs)
        {
            Initialize(context);
        }

        public SimpleStringInput(Context context, IAttributeSet attrs, int defStyle) :
            base(context, attrs, defStyle)
        {
            Initialize(context);
        }

        public EditText Edit { get; private set; }

        private void Initialize(Context context)
        {
            LayoutInflater.From(context).Inflate(Resource.Layout.simple_string_input_dialog, this);
            Edit = FindViewById<EditText>(Resource.Id.SimpleStringInputEditText);
        }
    }
}