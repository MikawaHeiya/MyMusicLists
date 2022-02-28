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
    [Activity(Label = "@string/app_name",Theme ="@style/AppTheme",  MainLauncher = true)]
    public class MainActivity : AppCompatActivity, Services.MusicPlay.IControlPaneUI
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            SetContentView(Resource.Layout.activity_main);

            System.Action requestPerssion = () =>
            {
                ActivityCompat.RequestPermissions(
                                    this,
                                    new string[]
                                    {
                                        Manifest.Permission.ReadExternalStorage,
                                        Manifest.Permission.WriteExternalStorage
                                    }, (int)PermissionRequestCode.Storage);
            };

            if (ActivityCompat.ShouldShowRequestPermissionRationale(this, Manifest.Permission.ReadExternalStorage) ||
                ActivityCompat.ShouldShowRequestPermissionRationale(this, Manifest.Permission.WriteExternalStorage))
            {
                Snackbar
                    .Make(
                            FindViewById<RelativeLayout>(Resource.Id.MainLayout),
                            Resource.String.permission_request_storage,
                            Snackbar.LengthIndefinite)
                    .SetAction(Resource.String.OK, delegate { requestPerssion(); });
            }
            else { requestPerssion(); }
        }

        protected override void OnResume()
        {
            base.OnResume();

            UpdateMusicLists();
            UpdateMusicListsUI(CurrentDisplayMusicListType == MusicListType.Set ? MusicSets : MusicViews);
            UpdateControlPaneUI();
        }

        protected override void OnDestroy()
        {
            if (initializeMusicListsThread.IsAlive)
            {
                initializeMusicListsThread.Abort();
            }

            base.OnDestroy();
        }

        private Thread initializeMusicListsThread = null;
        private SynchronizationContext mainThreadSynContext = SynchronizationContext.Current;

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Permission[] grantResults)
        {
            if (requestCode == (int)PermissionRequestCode.Storage)
            {
                if (grantResults.Length == 2 && 
                    grantResults[0] == Permission.Granted &&
                    grantResults[1] == Permission.Granted)
                {
                    //start initialize
                    initializeMusicListsThread = new Thread(new ThreadStart(() =>
                    {
                        try
                        {
                            Sources.Application.CheckDirectories(this);
                            Sources.Application.InitializeMusicLists(this);
                            Sources.Application.InitializeConfig(this);
                            mainThreadSynContext.Post(new SendOrPostCallback((obj) =>
                            {
                                OnInitializeMusicListsFinished(true, null);
                            }), null);
                        }
                        catch (System.Exception ex)
                        {
                            mainThreadSynContext.Post(new SendOrPostCallback((obj) =>
                            {
                                OnInitializeMusicListsFinished(false, ex.Message);
                            }), null);
                        }
                        return;
                    }));
                    initializeMusicListsThread.Start();
                }
            }
            else
            {
                base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
            }
        }

        public Services.MusicPlay.MusicPlayConnection MusicPlayConnection { get; private set; }
        public Services.MusicPlay.ControlPaneNotificationRecevier NotificationRecevier { get; private set; }
        public MusicListType CurrentDisplayMusicListType { get; private set; } = MusicListType.Set;
        public List<Music.MusicSet> MusicSets { get; private set; } = new List<Music.MusicSet>();
        public List<Music.MusicSet> MusicViews { get; private set; } = new List<Music.MusicSet>();

        private void OnInitializeMusicListsFinished(bool success, string message)
        {
            if (success)
            {
                //Test.TestUnit.LogAllMusicLists();
                UpdateMusicLists();

                MusicPlayConnection = new Services.MusicPlay.MusicPlayConnection(this);
                var intent = new Intent(this, typeof(Services.MusicPlay.MusicPlayService));
                BindService(intent, MusicPlayConnection, Bind.AutoCreate);
                //StartForegroundService(intent);

                NotificationRecevier = new Services.MusicPlay.ControlPaneNotificationRecevier(this);
                var intentFilter = new IntentFilter();
                intentFilter.AddAction(Services.MusicPlay.NotificationClickRecevier.NotificationPlayModeButtonClick);
                intentFilter.AddAction(Services.MusicPlay.NotificationClickRecevier.NotificationPreviousButtonClick);
                intentFilter.AddAction(Services.MusicPlay.NotificationClickRecevier.NotificationPlayButtonClick);
                intentFilter.AddAction(Services.MusicPlay.NotificationClickRecevier.NotificationNextButtonClick);
                RegisterReceiver(NotificationRecevier, intentFilter);

                InitializeUIComponents();

                UpdateMusicListsUI(CurrentDisplayMusicListType == MusicListType.Set ? MusicSets : MusicViews);
            }
            else
            {
                //Log.Debug("test", "failed with " + message);
                var alert = new Android.App.AlertDialog.Builder(this)
                    .SetTitle("错误")
                    .SetMessage($"初始化歌单时发生错误，错误信息如下：\n{message}\n请关闭应用后重试，或删除错误的配置文件。")
                    .SetPositiveButton("确定", delegate { });
                alert.Show();
            }
        }

        public TextView MusicSetsButton { get; private set; }
        public TextView MusicViewsButton { get; private set; }
        public ImageView MenuButton { get; private set; }
        public SearchView SearchBox { get; private set; }
        public LinearLayout LastPlayLayout { get; private set; }
        public ListView MusicListsLayout { get; private set; }
        public FloatingActionButton AddButton { get; private set; }
        public LinearLayout ControlPane { get; private set; }
        public FloatingActionButton PreviousButton { get; private set; }
        public FloatingActionButton PlayButton { get; private set; }
        public FloatingActionButton NextButton { get; private set; }
        public ImageView MusicCover { get; private set; }
        public TextView MusicTitle { get; private set; }
        public Music.MusicSet LastPlayMusicList { get; private set; }

        private void InitializeUIComponents()
        {
            MusicSetsButton = FindViewById<TextView>(Resource.Id.MusicSetsButton);
            MusicViewsButton = FindViewById<TextView>(Resource.Id.MusicViewsButton);

            MusicSetsButton.SetTypeface(Android.Graphics.Typeface.DefaultBold, Android.Graphics.TypefaceStyle.Bold);
            MusicSetsButton.Click += (sender, args) =>
            {
                CurrentDisplayMusicListType = MusicListType.Set;
                MusicSetsButton.SetTypeface(Android.Graphics.Typeface.DefaultBold, Android.Graphics.TypefaceStyle.Bold);
                MusicViewsButton.SetTypeface(Android.Graphics.Typeface.Default, Android.Graphics.TypefaceStyle.Normal);
                UpdateMusicListsUI(CurrentDisplayMusicListType == MusicListType.Set ? MusicSets : MusicViews);
            };
            MusicViewsButton.Click += (sender, args) =>
            {
                CurrentDisplayMusicListType = MusicListType.View;
                MusicSetsButton.SetTypeface(Android.Graphics.Typeface.Default, Android.Graphics.TypefaceStyle.Normal);
                MusicViewsButton.SetTypeface(Android.Graphics.Typeface.DefaultBold, Android.Graphics.TypefaceStyle.Bold);
                UpdateMusicListsUI(CurrentDisplayMusicListType == MusicListType.Set ? MusicSets : MusicViews);
            };

            MenuButton = FindViewById<ImageView>(Resource.Id.MainMenuButton);
            MenuButton.Click += (sender, args) =>
            {
                StartActivity(new Intent(this, typeof(ConfigActivity)));
            };

            SearchBox = FindViewById<SearchView>(Resource.Id.SearchBox);
            SearchBox.QueryTextChange += (sender, args) =>
            {
                var query = args.NewText;

                if (string.IsNullOrWhiteSpace(query))
                {
                    UpdateMusicListsUI(CurrentDisplayMusicListType == MusicListType.Set ? MusicSets : MusicViews);
                }
                else
                {
                    var source = CurrentDisplayMusicListType == MusicListType.Set ? MusicSets : MusicViews;
                    var sets = new List<Music.MusicSet>();

                    foreach (var set in source)
                    {
                        if (set.Name.Contains(query))
                        {
                            sets.Add(set);
                        }
                    }

                    UpdateMusicListsUI(sets);
                }
            };

            if (Sources.Application.LastPlayMusicList != null)
            {
                LastPlayMusicList = Sources.Application.MusicSets.ContainsKey(Sources.Application.LastPlayMusicList) ?
                        Sources.Application.MusicSets[Sources.Application.LastPlayMusicList] :
                        Sources.Application.MusicViews[Sources.Application.LastPlayMusicList];
            }
            else
            {
                LastPlayMusicList = null;
            }

            LastPlayLayout = FindViewById<LinearLayout>(Resource.Id.MainLastPlayLayout);
            if (LastPlayMusicList != null)
            {
                var listLabel = new Views.MusicListView(this)
                {
                    Title = Sources.Application.LastPlayMusicList,
                    MusicList = LastPlayMusicList
                };
                listLabel.Click += (sender, args) =>
                {
                    var intent = new Intent(this, typeof(MusicListActivity));
                    intent.PutExtra("MusicListName", LastPlayMusicList.Name);
                    intent.PutExtra("IsView", LastPlayMusicList.IsView);
                    StartActivity(intent);
                };
                LastPlayLayout.AddView(listLabel);
            }

            MusicListsLayout = FindViewById<ListView>(Resource.Id.MainMusicListsLayout);
            MusicListsLayout.ItemClick += (sender, args) =>
            {
                var musicList = ((sender as ListView).Adapter as Adapters.MusicListAdapter)[args.Position];

                var intent = new Intent(this, typeof(MusicListActivity));
                intent.PutExtra("MusicListName", musicList.Name);
                intent.PutExtra("IsView", musicList.IsView);
                StartActivity(intent);
            };
            MusicListsLayout.ItemLongClick += (sender, args) =>
            {
                var musicList = ((sender as ListView).Adapter as Adapters.MusicListAdapter)[args.Position];

                if (musicList.Name == Resources.GetString(Resource.String.application_set_all_musics_name))
                {
                    var dialog = new Android.App.AlertDialog.Builder(this)
                        .SetTitle("消息")
                        .SetMessage("无法删除歌单AllMusics");

                    dialog.Show();
                }
                else
                {
                    var dialog = new Android.App.AlertDialog.Builder(this)
                    .SetTitle($"是否删除歌单 {musicList.Name}")
                    .SetPositiveButton("确定", (sender, args) =>
                    {
                        Sources.Application.DeleteMusicList(this, musicList.IsView, musicList.Name);
                        UpdateMusicLists();
                        UpdateMusicListsUI(CurrentDisplayMusicListType == MusicListType.Set ? MusicSets : MusicViews);
                    });
                    dialog.Show();
                }
            };

            AddButton = FindViewById<FloatingActionButton>(Resource.Id.AddMusicListButton);
            AddButton.Click += (sender, args) =>
            {
                if (CurrentDisplayMusicListType == MusicListType.Set)
                {
                    var edit = new Views.SimpleStringInput(this);
                    var dialog = new Android.App.AlertDialog.Builder(this)
                    .SetTitle("请输入歌单名称")
                    .SetView(edit)
                    .SetPositiveButton("确定", (sender, args) =>
                    {
                        var name = edit.Edit.Text;
                        if (Sources.Application.CheckIfMusicListExist(name))
                        {
                            var alert = new Android.App.AlertDialog.Builder(this)
                                .SetTitle("错误")
                                .SetMessage($"集合或查询 {name} 已存在")
                                .SetPositiveButton("确定", delegate { });
                            alert.Show();
                            return;
                        }
                        if (name.Contains(" ") || name.Contains("(") || name.Contains(")") || name.Contains("+") || name.Contains("-") || name.Contains("*") || name.Contains("!"))
                        {
                            Toast.MakeText(this, "歌单名称不合法", ToastLength.Short);
                        }
                        else
                        {
                            Sources.Application.CreateMusicSet(this, name);
                            UpdateMusicLists();
                            UpdateMusicListsUI(MusicSets);
                        }
                    });
                    dialog.Show();
                }
                else
                {
                    var edit = new Views.NewMusicViewDialog(this);
                    var dialog = new Android.App.AlertDialog.Builder(this)
                    .SetTitle("创建新的查询")
                    .SetView(edit)
                    .SetPositiveButton("确定", (sender, args) =>
                    {
                        var name = edit.NameInput.Text;
                        var rule = edit.RuleInput.Text;
                        if (Sources.Application.CheckIfMusicListExist(name))
                        {
                            var alert = new Android.App.AlertDialog.Builder(this)
                                .SetTitle("错误")
                                .SetMessage($"集合或查询 {name} 已存在")
                                .SetPositiveButton("确定", delegate { });
                            alert.Show();
                            return;
                        }
                        if (name.Contains(" ") || name.Contains("(") || name.Contains(")") || name.Contains("+") || name.Contains("-") || name.Contains("*") || name.Contains("!"))
                        {
                            Toast.MakeText(this, "歌单名称不合法", ToastLength.Short);
                        }
                        else
                        {
                            try
                            {
                                Sources.Application.CreateMusicView(this, name, rule);
                            }
                            catch (System.Exception ex)
                            {
                                var alert = new Android.App.AlertDialog.Builder(this)
                                .SetTitle("错误")
                                .SetMessage($"查询规则 {rule} 不合法")
                                .SetPositiveButton("确定", delegate { });
                                alert.Show();
                                return;
                            }
                            UpdateMusicLists();
                            UpdateMusicListsUI(MusicViews);
                        }
                    });
                    dialog.Show();
                }
            };

            ControlPane = FindViewById<LinearLayout>(Resource.Id.ControlPane);
            ControlPane.Click += (sender, args) =>
            {
                var intent = new Intent(this, typeof(MusicActivity));
                StartActivity(intent);
            };

            PreviousButton = FindViewById<FloatingActionButton>(Resource.Id.ControlPanePreviousButton);
            PlayButton = FindViewById<FloatingActionButton>(Resource.Id.ControlPanePlayButton);
            NextButton = FindViewById<FloatingActionButton>(Resource.Id.ControlPaneNextButton);

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

            MusicCover = FindViewById<ImageView>(Resource.Id.ControlPaneCover);
            MusicTitle = FindViewById<TextView>(Resource.Id.ControlPaneTitle);
        }

        private void UpdateMusicLists()
        {
            MusicSets.Clear();
            MusicViews.Clear();

            foreach (var pair in Sources.Application.MusicSets)
            {
                MusicSets.Add(pair.Value);
            }

            foreach (var pair in Sources.Application.MusicViews)
            {
                MusicViews.Add(pair.Value);
            }
        }

        private void UpdateMusicListsUI(List<Music.MusicSet> sets)
        {
            if (MusicListsLayout == null)
            {
                return;
            }

            MusicListsLayout.Adapter = new Adapters.MusicListAdapter(this, sets);
            MusicListsLayout.SetMinimumHeight(sets.Count * 80);
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

            MusicCover.SetImageBitmap(MusicPlayConnection.Binder.Service.CurrentPlayMusic.Cover);
            MusicTitle.Text = MusicPlayConnection.Binder.Service.CurrentPlayMusic.Title;
            PlayButton.SetImageResource(
                MusicPlayConnection.Binder.Service.IsPlaying ? Resource.Drawable.music_play_icon : Resource.Drawable.music_pause_icon);
        }
    }

    public enum PermissionRequestCode
    {
        Storage = 1
    }

    public enum MusicListType
    {
        Set, View
    }
}