package crc649b574cba3e25766a;


public class MusicPlayBinder
	extends android.os.Binder
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("MyMusicLists.Sources.Services.MusicPlay.MusicPlayBinder, MyMusicLists", MusicPlayBinder.class, __md_methods);
	}


	public MusicPlayBinder ()
	{
		super ();
		if (getClass () == MusicPlayBinder.class)
			mono.android.TypeManager.Activate ("MyMusicLists.Sources.Services.MusicPlay.MusicPlayBinder, MyMusicLists", "", this, new java.lang.Object[] {  });
	}

	public MusicPlayBinder (com.mikawaheiya.mymusiclists.MusicPlayService p0)
	{
		super ();
		if (getClass () == MusicPlayBinder.class)
			mono.android.TypeManager.Activate ("MyMusicLists.Sources.Services.MusicPlay.MusicPlayBinder, MyMusicLists", "MyMusicLists.Sources.Services.MusicPlay.MusicPlayService, MyMusicLists", this, new java.lang.Object[] { p0 });
	}

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
