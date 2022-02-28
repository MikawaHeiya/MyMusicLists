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
    [Activity(Label = "MusicListActivity", Theme = "@style/AppTheme")]
    public class MusicListActivity : Activity, Services.MusicPlay.IControlPaneUI
    {
        public bool IsView { get; private set; } = false;
        public string Rule { get { if (IsView) { return (MusicList as Music.MusicView).Rule; } return null; } }
        public Music.MusicSet MusicList { get; private set; }
        public Services.MusicPlay.MusicPlayConnection MusicPlayConnection { get; private set; }
        public Services.MusicPlay.ControlPaneNotificationRecevier NotificationRecevier { get; private set; }

        public ImageView ReturnButton { get; private set; }
        public ImageView MusicListCover { get; private set; }
        public TextView MusicListTitle { get; private set; }
        public TextView MusicListDetail { get; private set; }
        public SearchView SearchBox { get; private set; }
        public ListView MusicsLayout { get; private set; }
        public LinearLayout ControlPane { get; private set; }
        public ImageView ControlPaneCover { get; private set; }
        public TextView ControlPaneTitle { get; private set; }
        public FloatingActionButton ControlPreviousButton { get; private set; }
        public FloatingActionButton ControlPlayButton { get; private set; }
        public FloatingActionButton ControlNextButton { get; private set; }

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            SetContentView(Resource.Layout.activity_music_list);

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

            IsView = Intent.Extras.GetBoolean("IsView");

            var title = Intent.Extras.GetString("MusicListName");
            if (title != null)
            {
                if (IsView)
                {
                    MusicList = Sources.Application.MusicViews[title];
                }
                else
                {
                    MusicList = Sources.Application.MusicSets[title];
                }
            }

            if (MusicList.Musics.Count > 0)
            {
                MusicListCover.SetImageBitmap(MusicList.Musics[0].Cover);
            }
            MusicListTitle.Text = title;
            MusicListDetail.Text = IsView ? $"共{MusicList.Musics.Count}首音乐\n{Rule}" : $"共{MusicList.Musics.Count}首音乐";

            UpdateMusicsLayout(MusicList.Musics);
        }

        protected override void OnResume()
        {
            base.OnResume();

            UpdateControlPaneUI();
            Sources.Application.UpdateMusicList(this, IsView, MusicListTitle.Text);
        }

        private void InitializeUIComponents()
        {
            ReturnButton = FindViewById<ImageView>(Resource.Id.MusicListReturnButton);
            ReturnButton.Click += (sender, args) =>
            {
                OnBackPressed();
            };

            MusicListCover = FindViewById<ImageView>(Resource.Id.MusicListCover);

            MusicListTitle = FindViewById<TextView>(Resource.Id.MusicListTitle);
            MusicListDetail = FindViewById<TextView>(Resource.Id.MusicListDetail);

            SearchBox = FindViewById<SearchView>(Resource.Id.MusicListSearch);
            SearchBox.QueryTextChange += (sender, args) =>
            {
                var query = args.NewText;

                if (string.IsNullOrWhiteSpace(query))
                {
                    UpdateMusicsLayout(MusicList.Musics);
                }
                else
                {
                    var musics = new List<Music.Music>();

                    foreach (var music in MusicList.Musics)
                    {
                        if (music.Title.Contains(query) ||
                        Extra.Utility.LinkStrings(music.Artists, "", "", ",").Contains(query) ||
                        music.Album.Contains(query))
                        {
                            musics.Add(music);
                        }
                    }

                    UpdateMusicsLayout(musics);
                }
            };

            MusicsLayout = FindViewById<ListView>(Resource.Id.MusicListMusicsLayout);
            MusicsLayout.ItemClick += (sender, args) =>
            {
                var music = ((sender as ListView).Adapter as Adapters.MusicAdapter)[args.Position];
                MusicPlayConnection.Binder.Service.Play(MusicList, MusicList.Musics.IndexOf(music));
                UpdateControlPaneUI();
            };

            MusicsLayout.ItemLongClick += (sender, args) =>
            {
                if (MusicList.Name != Resources.GetString(Resource.String.application_set_all_musics_name))
                {
                    if (IsView)
                    {
                        var dialog = new Android.App.AlertDialog.Builder(this)
                        .SetTitle("消息")
                        .SetMessage("无法删除查询中的音乐");

                        dialog.Show();
                    }
                    else
                    {
                        var music = ((sender as ListView).Adapter as Adapters.MusicAdapter)[args.Position];

                        var dialog = new Android.App.AlertDialog.Builder(this)
                        .SetTitle($"是否删除音乐 {music.Title}")
                        .SetPositiveButton("确定", (sender, args) =>
                        {
                            if (IsView)
                            {
                                Sources.Application.MusicViews[MusicList.Name].Musics.Remove(music);
                            }
                            else
                            {
                                Sources.Application.MusicSets[MusicList.Name].Musics.Remove(music);
                            }

                            GetMusicSet().Updated = true;
                            MusicList = GetMusicSet();
                            UpdateMusicsLayout(MusicList.Musics);
                        });
                        dialog.Show();
                    }
                }
                else
                {
                    var dialog = new Android.App.AlertDialog.Builder(this)
                    .SetTitle("消息")
                    .SetMessage($"无法删除{MusicList.Name}中的音乐");

                    dialog.Show();
                }
            };

            ControlPane = FindViewById<LinearLayout>(Resource.Id.MusicListControlPane);
            ControlPane.Click += (sender, args) =>
            {
                var intent = new Intent(this, typeof(MusicActivity));
                StartActivity(intent);
            };

            ControlPaneCover = FindViewById<ImageView>(Resource.Id.MusicListControlPaneCover);
            ControlPaneTitle = FindViewById<TextView>(Resource.Id.MusicListControlPaneTitle);
            ControlPreviousButton = FindViewById<FloatingActionButton>(Resource.Id.MusicListControlPanePreviousButton);
            ControlPlayButton = FindViewById<FloatingActionButton>(Resource.Id.MusicListControlPanePlayButton);
            ControlNextButton = FindViewById<FloatingActionButton>(Resource.Id.MusicListControlPaneNextButton);

            ControlPreviousButton.Click += (sender, args) =>
            {
                MusicPlayConnection.Binder.Service.PlayPrevious();
                UpdateControlPaneUI();
            };
            ControlPlayButton.Click += (sender, args) =>
            {
                MusicPlayConnection.Binder.Service.SwitchIsPlaying();
                UpdateControlPaneUI();
            };
            ControlNextButton.Click += (sender, args) =>
            {
                MusicPlayConnection.Binder.Service.PlayNext();
                UpdateControlPaneUI();
            };
        }

        private Music.MusicSet GetMusicSet()
        {
            return IsView ? Sources.Application.MusicViews[MusicList.Name] : Sources.Application.MusicSets[MusicList.Name];
        }

        private void UpdateMusicsLayout(List<Music.Music> musics)
        {
            if (MusicsLayout == null)
            {
                return;
            }

            MusicsLayout.Adapter = new Adapters.MusicAdapter(this, musics);
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

            ControlPaneCover.SetImageBitmap(MusicPlayConnection.Binder.Service.CurrentPlayMusic.Cover);
            ControlPaneTitle.Text = MusicPlayConnection.Binder.Service.CurrentPlayMusic.Title;
            ControlPlayButton.SetImageResource(
                MusicPlayConnection.Binder.Service.IsPlaying ? Resource.Drawable.music_play_icon : Resource.Drawable.music_pause_icon);
        }
    }
}