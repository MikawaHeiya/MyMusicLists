using Android;
using Android.App;
using Android.Content;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.OS;
using Android.Content.PM;
using Android.Util;
using Android.Support.V4.App;
using Android.Support.Design.Widget;
using Android.Support.V7.App;
using System.Threading;
using System.Collections.Generic;

namespace MyMusicLists.Sources.Activities
{
    [Activity(Label = "MusicActivity")]
    public class MusicActivity : Activity, Services.MusicPlay.IControlPaneUI
    {
        public Services.MusicPlay.MusicPlayConnection MusicPlayConnection { get; private set; }
        public Services.MusicPlay.ControlPaneNotificationRecevier NotificationRecevier { get; private set; }
        public Timer MusicTimer { get; private set; }

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            SetContentView(Resource.Layout.activity_music);

            // Create your application here
            MusicPlayConnection = new Services.MusicPlay.MusicPlayConnection(this);
            var intent = new Intent(this, typeof(Services.MusicPlay.MusicPlayService));
            BindService(intent, MusicPlayConnection, Bind.AutoCreate);

            NotificationRecevier = new Services.MusicPlay.ControlPaneNotificationRecevier(this);
            var intentFilter = new IntentFilter();
            intentFilter.AddAction(Services.MusicPlay.NotificationClickRecevier.NotificationPlayModeButtonClick);
            intentFilter.AddAction(Services.MusicPlay.NotificationClickRecevier.NotificationPreviousButtonClick);
            intentFilter.AddAction(Services.MusicPlay.NotificationClickRecevier.NotificationPlayButtonClick);
            intentFilter.AddAction(Services.MusicPlay.NotificationClickRecevier.NotificationNextButtonClick);
            RegisterReceiver(NotificationRecevier, intentFilter);

            InitializeUIComponents();

            MusicTimer = new Timer(new TimerCallback((obj) =>
            {
                if (MusicPlayConnection.Binder.Service.Prepared)
                {
                    PositionBar.Progress = (int)(100 * MusicPlayConnection.Binder.Service.CurrentPosition);
                }
            }), null, Timeout.Infinite, 100);
        }

        protected override void OnResume()
        {
            base.OnResume();

            UpdateControlPaneUI();
        }

        public ImageView ReturnButton { get; private set; }
        public TextView MusicTitle { get; private set; }
        public TextView MusicDetail { get; private set; }
        public ImageView MusicCover { get; private set; }
        public ImageView AddButton { get; private set; }
        public ImageView PlayModeButton { get; private set; }
        public ImageView MenuButton { get; private set; }
        public SeekBar PositionBar { get; private set; }
        public FloatingActionButton PreviousButton { get; private set; }
        public FloatingActionButton PlayButton { get; private set; }
        public FloatingActionButton NextButton { get; private set; }

        private void InitializeUIComponents()
        {
            ReturnButton = FindViewById<ImageView>(Resource.Id.MusicReturnButton);
            ReturnButton.Click += (sender, args) =>
            {
                base.OnBackPressed();
            };

            MusicTitle = FindViewById<TextView>(Resource.Id.MusicTitle);
            MusicDetail = FindViewById<TextView>(Resource.Id.MusicDetail);

            MusicCover = FindViewById<ImageView>(Resource.Id.MusicCover);

            AddButton = FindViewById<ImageView>(Resource.Id.MusicAddButton);
            AddButton.Click += (sender, args) =>
            {
                if (MusicPlayConnection.Binder.Service.CurrentPlayMusicList == null)
                {
                    return;
                }

                var layout = new LinearLayout(this);
                layout.Orientation = Orientation.Vertical;
                var param = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MatchParent, LinearLayout.LayoutParams.WrapContent);
                param.SetMargins(20, 0, 20, 0);
                layout.LayoutParameters = param;

                foreach (var pair in Sources.Application.MusicSets)
                {
                    if (pair.Value.Equals(MusicPlayConnection.Binder.Service.CurrentPlayMusicList) || pair.Value.Name == Resources.GetString(Resource.String.application_set_all_musics_name))
                    {
                        continue;
                    }

                    var setLabel = new Views.MusicListView(this)
                    {
                        Title = pair.Key,
                        MusicList = pair.Value
                    };
                    setLabel.Click += (sender, args) =>
                    {
                        if (Sources.Application.MusicSets[pair.Key].Musics.Contains(MusicPlayConnection.Binder.Service.CurrentPlayMusic))
                        {
                            Toast.MakeText(this, $"{MusicPlayConnection.Binder.Service.CurrentPlayMusic.Title} 已存在", ToastLength.Short);
                            return;
                        }

                        Sources.Application.MusicSets[pair.Key].Updated = true;
                        Sources.Application.MusicSets[pair.Key].Musics.Add(MusicPlayConnection.Binder.Service.CurrentPlayMusic);
                        Sources.Application.UpdateMusicList(this, false, pair.Key);
                    };
                    layout.AddView(setLabel);
                }

                var dialog = new Android.App.AlertDialog.Builder(this)
                .SetTitle("添加至歌单")
                .SetView(layout);

                dialog.Show();
            };

            PlayModeButton = FindViewById<ImageView>(Resource.Id.MusicPlayModeButton);
            PlayModeButton.Click += (sender, args) =>
            {
                MusicPlayConnection.Binder.Service.SwitchPlayMode();
                UpdateControlPaneUI();
            };

            MenuButton = FindViewById<ImageView>(Resource.Id.MusicMenuButton);
            MenuButton.Click += (sender, args) =>
            {
                var music = MusicPlayConnection.Binder.Service.CurrentPlayMusic;

                var dialog = new Android.App.AlertDialog.Builder(this)
                .SetTitle("音乐详情")
                .SetMessage($"标题：{music.Title}\n作者：{Extra.Utility.LinkStrings(music.Artists, "", "", ",")}\n专辑：{music.Album}\n")
                .SetPositiveButton("", (sender, args) =>
                {
                    ((ClipboardManager)GetSystemService(Context.ClipboardService)).PrimaryClip
                    = ClipData.NewPlainText("音乐详情", $"{music.Title} - {Extra.Utility.LinkStrings(music.Artists, "", "", ",")} / {music.Album}");

                    Toast.MakeText(this, "音乐详情已复制到剪贴板", ToastLength.Short);
                });

                dialog.Show();
            };

            PositionBar = FindViewById<SeekBar>(Resource.Id.MusicSeekBar);
            PositionBar.StopTrackingTouch += (sender, args) =>
            {
                if (MusicPlayConnection.Binder.Service.Prepared)
                {
                    MusicPlayConnection.Binder.Service.CurrentPosition = (double)args.SeekBar.Progress / 100;
                }
            };

            PreviousButton = FindViewById<FloatingActionButton>(Resource.Id.MusicControlPanePreviousButton);
            PlayButton = FindViewById<FloatingActionButton>(Resource.Id.MusicControlPanePlayButton);
            NextButton = FindViewById<FloatingActionButton>(Resource.Id.MusicControlPaneNextButton);

            PreviousButton.Click += (sender, args) =>
            {
                MusicPlayConnection.Binder.Service.PlayPrevious();
                UpdateControlPaneUI();
            };
            PlayButton.Click += (sender, args) =>
            {
                MusicPlayConnection.Binder.Service.SwitchIsPlaying();
                UpdateControlPaneUI();
            };
            NextButton.Click += (sender, args) =>
            {
                MusicPlayConnection.Binder.Service.PlayNext();
                UpdateControlPaneUI();
            };
        }

        public void UpdateControlPaneUI()
        {
            if (MusicPlayConnection == null ||
                MusicPlayConnection.Binder == null ||
                MusicPlayConnection.Binder.Service == null ||
                MusicPlayConnection.Binder.Service.CurrentPlayMusicList == null)
            {
                return;
            }

            MusicTimer.Change(0, 100);

            var music = MusicPlayConnection.Binder.Service.CurrentPlayMusic;

            MusicTitle.Text = music.Title;
            MusicDetail.Text = $"{Extra.Utility.LinkStrings(music.Artists, "", "", ",")} / {music.Album}";
            MusicCover.SetImageBitmap(music.Cover);
            PositionBar.Progress = (int)(100 * MusicPlayConnection.Binder.Service.CurrentPosition);
            switch (MusicPlayConnection.Binder.Service.PlayMode)
            {
                case Services.MusicPlay.MusicPlayMode.ListLoop:
                    PlayModeButton.SetImageResource(Resource.Drawable.list_loop_icon);
                    break;
                case Services.MusicPlay.MusicPlayMode.SingleLoop:
                    PlayModeButton.SetImageResource(Resource.Drawable.single_loop_icon);
                    break;
                case Services.MusicPlay.MusicPlayMode.Random:
                    PlayModeButton.SetImageResource(Resource.Drawable.random_play_icon);
                    break;
                default: break;
            }
            PlayButton.SetImageResource(MusicPlayConnection.Binder.Service.IsPlaying ? Resource.Drawable.music_play_icon : Resource.Drawable.music_pause_icon);
        }
    }
}