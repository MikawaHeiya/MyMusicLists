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
using System.IO;

namespace MyMusicLists.Sources.Activities
{
    [Activity(Label = "ConfigActivity", Theme = "@style/AppTheme")]
    public class ConfigActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            SetContentView(Resource.Layout.activity_config);
            // Create your application here

            InitializeUIComponents();

            UpdatePathLayout();
        }

        protected override void OnDestroy()
        {
            Sources.Application.UpdateConfig(this);

            base.OnDestroy();
        }

        public ImageView ReturnButton { get; private set; }
        public ImageView AddButton { get; private set; }
        public LinearLayout PathLayout { get; private set; }
        public Spinner FrequencySpinner { get; private set; }
        public Button UpdateButton { get; private set; }

        public const int FOLDER_CHOOSE_REQUEST_CODE = 2;

        private void InitializeUIComponents()
        {
            ReturnButton = FindViewById<ImageView>(Resource.Id.ConfigReturnButton);
            ReturnButton.Click += (sender, args) =>
            {
                base.OnBackPressed();
            };

            AddButton = FindViewById<ImageView>(Resource.Id.ConfigAddPathButton);
            
            /*
            AddButton.Click += (sender, args) =>
            {
                var intent = new Intent();
                intent.SetAction(Intent.ActionGetContent);

                StartActivityForResult(intent, FOLDER_CHOOSE_REQUEST_CODE);
            };*/

            
            AddButton.Click += async (sender, args) =>
            {
                var path = await Xamarin.Essentials.FilePicker.PickAsync();
                if (path != null && Directory.Exists(path.FullPath))
                {
                    Sources.Application.MusicCollectPaths.Add(path.FullPath);
                    UpdatePathLayout();
                }
            };

            PathLayout = FindViewById<LinearLayout>(Resource.Id.ConfigMusicCollectPathsLayout);

            FrequencySpinner = FindViewById<Spinner>(Resource.Id.ConfigUpdateFrequencySpinner);
            FrequencySpinner.ItemSelected += (sender, args) =>
            {
                Sources.Application.GlobalUpdateFrequency = (Music.MusicViewUpdateFrequency)args.Position;
            };
            FrequencySpinner.SetSelection((int)Sources.Application.GlobalUpdateFrequency);

            UpdateButton = FindViewById<Button>(Resource.Id.ConfigUpdateViewsButton);
            UpdateButton.Click += (sender, args) =>
            {
                var dialog = new Android.App.AlertDialog.Builder(this)
                .SetTitle("确定要更新全部的查询吗？")
                .SetPositiveButton("确定", (sender, args) =>
                {
                    Sources.Application.ReDecodeMusicViews(this);
                    Toast.MakeText(this, "更新完成", ToastLength.Short);
                });
                dialog.Show();
            };
        }

        protected override void OnActivityResult(int requestCode, [GeneratedEnum] Result resultCode, Intent data)
        {
            if (requestCode == FOLDER_CHOOSE_REQUEST_CODE && resultCode == Result.Ok)
            {
                var path = data.Data.Path;

                if (path != null && Directory.Exists(path))
                {
                    Sources.Application.MusicCollectPaths.Add(path);
                    UpdatePathLayout();
                }
            }
        }

        private void UpdatePathLayout()
        {
            PathLayout.RemoveAllViews();

            foreach (var path in Sources.Application.MusicCollectPaths)
            {
                var simpleString = new Views.SimpleStringView(this);
                simpleString.Text = path;
                simpleString.DeleteButton.Click += (sender, args) =>
                {
                    Sources.Application.MusicCollectPaths.Remove(path);
                    UpdatePathLayout();
                };

                PathLayout.AddView(simpleString);
            }
        }
    }
}