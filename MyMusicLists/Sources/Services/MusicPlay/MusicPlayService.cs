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
using Android.Media;
using Android.Util;
using Android.Support.V4.App;

namespace MyMusicLists.Sources.Services.MusicPlay
{
    [Service(Name = "com.mikawaheiya.mymusiclists.MusicPlayService")]
    public class MusicPlayService : Service
    {
        public const int SERVICE_RUNNING_NOTIFICATION_ID = 2333;
        public MusicPlayBinder Binder { get; private set; }
        public Notification Notification { get; private set; }
        public RemoteViews NotificationView { get; private set; }
        public NotificationManager Manager { get; private set; }
        public NotificationClickRecevier ClickRecevier { get; private set; } = new NotificationClickRecevier();

        private MediaPlayer mediaPlayer;

        public override void OnCreate()
        {
            Binder = new MusicPlayBinder(this);

            mediaPlayer = new MediaPlayer();
            mediaPlayer.Completion += (sender, args) =>
            {

                if (!Looping)
                {
                    PlayNext();
                }
            };
            mediaPlayer.Prepared += (sender, args) =>
            {
                mediaPlayer.Start();
                Prepared = true;
            };

            var filter = new IntentFilter();
            filter.AddAction(NotificationClickRecevier.NotificationPlayModeButtonClick);
            filter.AddAction(NotificationClickRecevier.NotificationPreviousButtonClick);
            filter.AddAction(NotificationClickRecevier.NotificationPlayButtonClick);
            filter.AddAction(NotificationClickRecevier.NotificationNextButtonClick);
            RegisterReceiver(ClickRecevier, filter);

            NotificationView = new RemoteViews(Resources.GetString(Resource.String.application_parkage_name), Resource.Layout.notification_music_play);

            NotificationView.SetOnClickPendingIntent(Resource.Id.NotificationPlayModeButton, 
                PendingIntent.GetBroadcast(this, 0, new Intent(NotificationClickRecevier.NotificationPlayModeButtonClick), 0));
            NotificationView.SetOnClickPendingIntent(Resource.Id.NotificationPreviousButton, 
                PendingIntent.GetBroadcast(this, 0, new Intent(NotificationClickRecevier.NotificationPreviousButtonClick), 0));
            NotificationView.SetOnClickPendingIntent(Resource.Id.NotificationPlayButton, 
                PendingIntent.GetBroadcast(this, 0, new Intent(NotificationClickRecevier.NotificationPlayButtonClick), 0));
            NotificationView.SetOnClickPendingIntent(Resource.Id.NotificationNextButton, 
                PendingIntent.GetBroadcast(this, 0, new Intent(NotificationClickRecevier.NotificationNextButtonClick), 0));

            var channelID = "com.mikawaheiya.mymusiclists.MusicPlayService";
            var channelName = "Music Play Service";
            var channel = new NotificationChannel(channelID, channelName, NotificationImportance.Default);
            channel.LightColor = Android.Graphics.Color.Blue;
            channel.LockscreenVisibility = NotificationVisibility.Public;
            channel.Importance = NotificationImportance.Min;
            channel.SetSound(null, null);
            channel.SetVibrationPattern(new long[] { 0 });
            Manager = (NotificationManager)GetSystemService(Context.NotificationService);
            Manager.CreateNotificationChannel(channel);

            Notification = new Notification.Builder(this, channelID)
                .SetCustomContentView(NotificationView)
                .SetSmallIcon(Resource.Mipmap.ic_launcher_foreground)
                .SetOnlyAlertOnce(true)
                .Build();

            Manager.Notify(SERVICE_RUNNING_NOTIFICATION_ID, Notification);
        }

        public override IBinder OnBind(Intent intent)
        {
            return Binder;
        }

        public override void OnDestroy()
        {
            mediaPlayer.Release();
            base.OnDestroy();
        }

        public Music.MusicSet CurrentPlayMusicList { get; private set; } = null;
        public int CurrentPlayMusicIndex { get; private set; }
        public Music.Music CurrentPlayMusic { get { return CurrentPlayMusicList.Musics[CurrentPlayMusicIndex]; } }
        public double CurrentPosition 
        { 
            get { return mediaPlayer.CurrentPosition / (double)mediaPlayer.Duration; } 
            set { mediaPlayer.SeekTo((int)(mediaPlayer.Duration * value)); } 
        }
        public bool IsPlaying { get { return mediaPlayer.IsPlaying; } }
        public bool Looping { get { return mediaPlayer.Looping; } set { mediaPlayer.Looping = value; } }
        public bool Prepared { get; private set; } = false;
        public MusicPlayMode PlayMode { get; set; } = MusicPlayMode.ListLoop;

        public void Play(Music.MusicSet musicList, int index)
        {
            if (CurrentPlayMusicList == musicList && CurrentPlayMusicIndex == index)
            {
                return;
            }

            var musicListChanged = CurrentPlayMusicList != musicList;

            CurrentPlayMusicList = musicList;
            CurrentPlayMusicIndex = index;

            Log.Debug("test", "index: " + index);

            if (CurrentPlayMusicList == null)
            {
                return;
            }

            //Notification.LargeIcon = CurrentPlayMusic.Cover;
            
            NotificationView.SetImageViewBitmap(Resource.Id.NotificationCover, CurrentPlayMusic.Cover);
            NotificationView.SetTextViewText(Resource.Id.NotificationTitle, CurrentPlayMusic.Title);
            NotificationView.SetTextViewText(Resource.Id.NotificationDetail, 
                $"{Extra.Utility.LinkStrings(CurrentPlayMusic.Artists, "", "", ",")} / {CurrentPlayMusic.Album}");
            NotificationView.SetImageViewResource(Resource.Id.NotificationPlayButton, Resource.Drawable.music_play_icon);

            Manager.Notify(SERVICE_RUNNING_NOTIFICATION_ID, Notification);

            StartPlayer(CurrentPlayMusic.Path);

            if (musicListChanged)
            {
                Sources.Application.LastPlayMusicList = CurrentPlayMusicList.Name;
                Sources.Application.UpdateConfig(this);
            }
        }

        public void PlayNext()
        {
            if (CurrentPlayMusicList == null)
            {
                return;
            }

            var index = CurrentPlayMusicIndex;
            switch (PlayMode)
            {
                case MusicPlayMode.SingleLoop:
                case MusicPlayMode.ListLoop:
                    index = index + 1 >= CurrentPlayMusicList.Musics.Count ? 0 : index + 1;
                    break;
                case MusicPlayMode.Random:
                    index = new Random(DateTime.Now.Millisecond).Next(0, CurrentPlayMusicList.Musics.Count);
                    break;
                default: break;
            }

            Play(CurrentPlayMusicList, index);
        }

        public void PlayPrevious()
        {
            if (CurrentPlayMusicList == null)
            {
                return;
            }

            var index = CurrentPlayMusicIndex;
            switch (PlayMode)
            {
                case MusicPlayMode.SingleLoop:
                case MusicPlayMode.ListLoop:
                    index = index - 1 >= 0 ? index - 1 : CurrentPlayMusicList.Musics.Count - 1;
                    break;
                case MusicPlayMode.Random:
                    index = new Random(DateTime.Now.Millisecond).Next(0, CurrentPlayMusicList.Musics.Count);
                    break;
                default: break;
            }

            Play(CurrentPlayMusicList, index);
        }

        public void SwitchIsPlaying()
        {
            if (CurrentPlayMusicList == null)
            {
                return;
            }

            if (IsPlaying)
            {
                mediaPlayer.Pause();
                NotificationView.SetImageViewResource(Resource.Id.NotificationPlayButton, Resource.Drawable.music_pause_icon);
                Manager.Notify(SERVICE_RUNNING_NOTIFICATION_ID, Notification);
            }
            else
            {
                mediaPlayer.Start();
                NotificationView.SetImageViewResource(Resource.Id.NotificationPlayButton, Resource.Drawable.music_play_icon);
                Manager.Notify(SERVICE_RUNNING_NOTIFICATION_ID, Notification);
            }
        }

        public MusicPlayMode SwitchPlayMode()
        {
            switch (PlayMode)
            {
                case MusicPlayMode.ListLoop:
                    PlayMode = MusicPlayMode.SingleLoop;
                    NotificationView.SetImageViewResource(Resource.Id.NotificationPlayModeButton, Resource.Drawable.single_loop_icon);
                    Manager.Notify(SERVICE_RUNNING_NOTIFICATION_ID, Notification);
                    return PlayMode;
                case MusicPlayMode.SingleLoop:
                    PlayMode = MusicPlayMode.Random;
                    NotificationView.SetImageViewResource(Resource.Id.NotificationPlayModeButton, Resource.Drawable.random_play_icon);
                    Manager.Notify(SERVICE_RUNNING_NOTIFICATION_ID, Notification);
                    return PlayMode;
                case MusicPlayMode.Random:
                    PlayMode = MusicPlayMode.ListLoop;
                    NotificationView.SetImageViewResource(Resource.Id.NotificationPlayModeButton, Resource.Drawable.list_loop_icon);
                    Manager.Notify(SERVICE_RUNNING_NOTIFICATION_ID, Notification);
                    return PlayMode;
                default: return PlayMode;
            }
        }

        private void StartPlayer(string path)
        {
            Prepared = false;

            mediaPlayer.Reset();
            mediaPlayer.SetDataSource(path);
            mediaPlayer.Prepare();
        }
    }

    public class NotificationClickRecevier : BroadcastReceiver
    {
        public const string NotificationPlayModeButtonClick = "Notification Play Mode Button Clicked";
        public const string NotificationPreviousButtonClick = "Notification Previous Button Clicked";
        public const string NotificationPlayButtonClick = "Notification Play Button Clicked";
        public const string NotificationNextButtonClick = "Notification Next Button Clicked";

        public override void OnReceive(Context context, Intent intent)
        {
            var service = context as MusicPlayService;

            switch (intent.Action)
            {
                case NotificationPlayModeButtonClick:
                    service.SwitchPlayMode();
                    break;
                case NotificationPreviousButtonClick:
                    service.PlayPrevious();
                    break;
                case NotificationPlayButtonClick:
                    service.SwitchIsPlaying();
                    break;
                case NotificationNextButtonClick:
                    service.PlayNext();
                    break;
                default: break;
            }
        }
    }

    public interface IControlPaneUI
    {
        abstract public void UpdateControlPaneUI();
    }

    public class ControlPaneNotificationRecevier : BroadcastReceiver
    {
        public IControlPaneUI ControlPaneUI { get; private set; }

        public ControlPaneNotificationRecevier(IControlPaneUI controlPaneUI)
        {
            ControlPaneUI = controlPaneUI;
        }

        public override void OnReceive(Context context, Intent intent)
        {
            switch (intent.Action)
            {
                case NotificationClickRecevier.NotificationPlayModeButtonClick:
                case NotificationClickRecevier.NotificationPreviousButtonClick:
                case NotificationClickRecevier.NotificationPlayButtonClick:
                case NotificationClickRecevier.NotificationNextButtonClick:
                    ControlPaneUI.UpdateControlPaneUI();
                    break;
                default: break;
            }
        }
    }

    public enum MusicPlayMode
    {
        SingleLoop,
        ListLoop,
        Random
    }
}