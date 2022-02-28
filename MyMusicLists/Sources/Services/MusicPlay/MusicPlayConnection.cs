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

namespace MyMusicLists.Sources.Services.MusicPlay
{
    public class MusicPlayConnection : Java.Lang.Object, IServiceConnection
    {
        public MusicPlayBinder Binder { get; private set; }
        public bool IsConnected { get { return Binder != null; } }
        public IControlPaneUI ControlPaneUI { get; private set; }

        public MusicPlayConnection(IControlPaneUI controlPaneUI)
        {
            Binder = null;
            ControlPaneUI = controlPaneUI;
        }

        public void OnServiceConnected(ComponentName name, IBinder service)
        {
            Binder = service as MusicPlayBinder;
            ControlPaneUI.UpdateControlPaneUI();
        }

        public void OnServiceDisconnected(ComponentName name)
        {
            Binder = null;
        }
    }
}