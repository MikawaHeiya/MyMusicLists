package crc640f9927811dc5dabb;


public class SimpleStringView
	extends android.widget.RelativeLayout
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("MyMusicLists.Sources.Views.SimpleStringView, MyMusicLists", SimpleStringView.class, __md_methods);
	}


	public SimpleStringView (android.content.Context p0)
	{
		super (p0);
		if (getClass () == SimpleStringView.class)
			mono.android.TypeManager.Activate ("MyMusicLists.Sources.Views.SimpleStringView, MyMusicLists", "Android.Content.Context, Mono.Android", this, new java.lang.Object[] { p0 });
	}


	public SimpleStringView (android.content.Context p0, android.util.AttributeSet p1)
	{
		super (p0, p1);
		if (getClass () == SimpleStringView.class)
			mono.android.TypeManager.Activate ("MyMusicLists.Sources.Views.SimpleStringView, MyMusicLists", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new java.lang.Object[] { p0, p1 });
	}


	public SimpleStringView (android.content.Context p0, android.util.AttributeSet p1, int p2)
	{
		super (p0, p1, p2);
		if (getClass () == SimpleStringView.class)
			mono.android.TypeManager.Activate ("MyMusicLists.Sources.Views.SimpleStringView, MyMusicLists", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, mscorlib", this, new java.lang.Object[] { p0, p1, p2 });
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
