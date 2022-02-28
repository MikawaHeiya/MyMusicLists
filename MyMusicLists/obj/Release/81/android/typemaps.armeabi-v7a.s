	.arch	armv7-a
	.syntax unified
	.eabi_attribute 67, "2.09"	@ Tag_conformance
	.eabi_attribute 6, 10	@ Tag_CPU_arch
	.eabi_attribute 7, 65	@ Tag_CPU_arch_profile
	.eabi_attribute 8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute 9, 2	@ Tag_THUMB_ISA_use
	.fpu	vfpv3-d16
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 15, 1	@ Tag_ABI_PCS_RW_data
	.eabi_attribute 16, 1	@ Tag_ABI_PCS_RO_data
	.eabi_attribute 17, 2	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute 20, 2	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute 38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 14, 0	@ Tag_ABI_PCS_R9_use
	.file	"typemaps.armeabi-v7a.s"

/* map_module_count: START */
	.section	.rodata.map_module_count,"a",%progbits
	.type	map_module_count, %object
	.p2align	2
	.global	map_module_count
map_module_count:
	.size	map_module_count, 4
	.long	10
/* map_module_count: END */

/* java_type_count: START */
	.section	.rodata.java_type_count,"a",%progbits
	.type	java_type_count, %object
	.p2align	2
	.global	java_type_count
java_type_count:
	.size	java_type_count, 4
	.long	408
/* java_type_count: END */

	.include	"typemaps.armeabi-v7a-shared.inc"
	.include	"typemaps.armeabi-v7a-managed.inc"

/* Managed to Java map: START */
	.section	.data.rel.map_modules,"aw",%progbits
	.type	map_modules, %object
	.p2align	2
	.global	map_modules
map_modules:
	/* module_uuid: 0a4e4b16-40de-41b5-8baa-cbc0b6479cbc */
	.byte	0x16, 0x4b, 0x4e, 0x0a, 0xde, 0x40, 0xb5, 0x41, 0x8b, 0xaa, 0xcb, 0xc0, 0xb6, 0x47, 0x9c, 0xbc
	/* entry_count */
	.long	30
	/* duplicate_count */
	.long	4
	/* map */
	.long	module0_managed_to_java
	/* duplicate_map */
	.long	module0_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.v7.AppCompat */
	.long	.L.map_aname.0
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: 76e2561d-efba-4f7c-9fe9-99fc07825537 */
	.byte	0x1d, 0x56, 0xe2, 0x76, 0xba, 0xef, 0x7c, 0x4f, 0x9f, 0xe9, 0x99, 0xfc, 0x07, 0x82, 0x55, 0x37
	/* entry_count */
	.long	3
	/* duplicate_count */
	.long	0
	/* map */
	.long	module1_managed_to_java
	/* duplicate_map */
	.long	0
	/* assembly_name: Xamarin.Android.Support.Core.UI */
	.long	.L.map_aname.1
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: 2334ef35-2944-4c2d-ab57-30d59e00ed7e */
	.byte	0x35, 0xef, 0x34, 0x23, 0x44, 0x29, 0x2d, 0x4c, 0xab, 0x57, 0x30, 0xd5, 0x9e, 0x00, 0xed, 0x7e
	/* entry_count */
	.long	6
	/* duplicate_count */
	.long	0
	/* map */
	.long	module2_managed_to_java
	/* duplicate_map */
	.long	0
	/* assembly_name: Xamarin.Android.Support.Core.Utils */
	.long	.L.map_aname.2
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: 528ff441-593a-48dc-aece-b5f972ae9696 */
	.byte	0x41, 0xf4, 0x8f, 0x52, 0x3a, 0x59, 0xdc, 0x48, 0xae, 0xce, 0xb5, 0xf9, 0x72, 0xae, 0x96, 0x96
	/* entry_count */
	.long	11
	/* duplicate_count */
	.long	4
	/* map */
	.long	module3_managed_to_java
	/* duplicate_map */
	.long	module3_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.Fragment */
	.long	.L.map_aname.3
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: 3a899263-82ce-407d-ab4a-0341d557c9fd */
	.byte	0x63, 0x92, 0x89, 0x3a, 0xce, 0x82, 0x7d, 0x40, 0xab, 0x4a, 0x03, 0x41, 0xd5, 0x57, 0xc9, 0xfd
	/* entry_count */
	.long	16
	/* duplicate_count */
	.long	0
	/* map */
	.long	module4_managed_to_java
	/* duplicate_map */
	.long	0
	/* assembly_name: MyMusicLists */
	.long	.L.map_aname.4
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: 6ddf9d7b-b858-42f4-b09b-0e26be4f7aa8 */
	.byte	0x7b, 0x9d, 0xdf, 0x6d, 0x58, 0xb8, 0xf4, 0x42, 0xb0, 0x9b, 0x0e, 0x26, 0xbe, 0x4f, 0x7a, 0xa8
	/* entry_count */
	.long	17
	/* duplicate_count */
	.long	2
	/* map */
	.long	module5_managed_to_java
	/* duplicate_map */
	.long	module5_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.Compat */
	.long	.L.map_aname.5
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: 8a8eae9a-55b8-4bd8-bde9-191631ff8893 */
	.byte	0x9a, 0xae, 0x8e, 0x8a, 0xb8, 0x55, 0xd8, 0x4b, 0xbd, 0xe9, 0x19, 0x16, 0x31, 0xff, 0x88, 0x93
	/* entry_count */
	.long	2
	/* duplicate_count */
	.long	0
	/* map */
	.long	module6_managed_to_java
	/* duplicate_map */
	.long	0
	/* assembly_name: Xamarin.Essentials */
	.long	.L.map_aname.6
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: 042bdfc1-72aa-4095-849f-71744137ef76 */
	.byte	0xc1, 0xdf, 0x2b, 0x04, 0xaa, 0x72, 0x95, 0x40, 0x84, 0x9f, 0x71, 0x74, 0x41, 0x37, 0xef, 0x76
	/* entry_count */
	.long	9
	/* duplicate_count */
	.long	3
	/* map */
	.long	module7_managed_to_java
	/* duplicate_map */
	.long	module7_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.Design */
	.long	.L.map_aname.7
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: f0045eda-40d0-4ead-b787-b125e251e4d6 */
	.byte	0xda, 0x5e, 0x04, 0xf0, 0xd0, 0x40, 0xad, 0x4e, 0xb7, 0x87, 0xb1, 0x25, 0xe2, 0x51, 0xe4, 0xd6
	/* entry_count */
	.long	310
	/* duplicate_count */
	.long	51
	/* map */
	.long	module8_managed_to_java
	/* duplicate_map */
	.long	module8_managed_to_java_duplicates
	/* assembly_name: Mono.Android */
	.long	.L.map_aname.8
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	/* module_uuid: 7e99d1f2-a6a9-4482-aba1-42704570547a */
	.byte	0xf2, 0xd1, 0x99, 0x7e, 0xa9, 0xa6, 0x82, 0x44, 0xab, 0xa1, 0x42, 0x70, 0x45, 0x70, 0x54, 0x7a
	/* entry_count */
	.long	4
	/* duplicate_count */
	.long	1
	/* map */
	.long	module9_managed_to_java
	/* duplicate_map */
	.long	module9_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Arch.Lifecycle.Common */
	.long	.L.map_aname.9
	/* image */
	.long	0
	/* java_name_width */
	.long	0
	/* java_map */
	.long	0

	.size	map_modules, 480
/* Managed to Java map: END */

/* Java to managed map: START */
	.section	.rodata.map_java,"a",%progbits
	.type	map_java, %object
	.p2align	2
	.global	map_java
map_java:
	/* #0 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554866
	/* java_name */
	.ascii	"android/animation/Animator"
	.zero	56
	.zero	2

	/* #1 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554868
	/* java_name */
	.ascii	"android/animation/Animator$AnimatorListener"
	.zero	39
	.zero	2

	/* #2 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554870
	/* java_name */
	.ascii	"android/animation/Animator$AnimatorPauseListener"
	.zero	34
	.zero	2

	/* #3 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554872
	/* java_name */
	.ascii	"android/animation/AnimatorListenerAdapter"
	.zero	41
	.zero	2

	/* #4 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554875
	/* java_name */
	.ascii	"android/animation/TimeInterpolator"
	.zero	48
	.zero	2

	/* #5 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554878
	/* java_name */
	.ascii	"android/app/Activity"
	.zero	62
	.zero	2

	/* #6 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554879
	/* java_name */
	.ascii	"android/app/AlertDialog"
	.zero	59
	.zero	2

	/* #7 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554880
	/* java_name */
	.ascii	"android/app/AlertDialog$Builder"
	.zero	51
	.zero	2

	/* #8 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554881
	/* java_name */
	.ascii	"android/app/Application"
	.zero	59
	.zero	2

	/* #9 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554883
	/* java_name */
	.ascii	"android/app/Application$ActivityLifecycleCallbacks"
	.zero	32
	.zero	2

	/* #10 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554884
	/* java_name */
	.ascii	"android/app/Dialog"
	.zero	64
	.zero	2

	/* #11 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554885
	/* java_name */
	.ascii	"android/app/Notification"
	.zero	58
	.zero	2

	/* #12 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554886
	/* java_name */
	.ascii	"android/app/Notification$Builder"
	.zero	50
	.zero	2

	/* #13 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554891
	/* java_name */
	.ascii	"android/app/NotificationChannel"
	.zero	51
	.zero	2

	/* #14 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554887
	/* java_name */
	.ascii	"android/app/NotificationManager"
	.zero	51
	.zero	2

	/* #15 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554894
	/* java_name */
	.ascii	"android/app/PendingIntent"
	.zero	57
	.zero	2

	/* #16 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554897
	/* java_name */
	.ascii	"android/app/Service"
	.zero	63
	.zero	2

	/* #17 */
	/* module_index */
	.long	9
	/* type_token_id */
	.long	33554435
	/* java_name */
	.ascii	"android/arch/lifecycle/Lifecycle"
	.zero	50
	.zero	2

	/* #18 */
	/* module_index */
	.long	9
	/* type_token_id */
	.long	33554436
	/* java_name */
	.ascii	"android/arch/lifecycle/Lifecycle$State"
	.zero	44
	.zero	2

	/* #19 */
	/* module_index */
	.long	9
	/* type_token_id */
	.long	33554438
	/* java_name */
	.ascii	"android/arch/lifecycle/LifecycleObserver"
	.zero	42
	.zero	2

	/* #20 */
	/* module_index */
	.long	9
	/* type_token_id */
	.long	33554440
	/* java_name */
	.ascii	"android/arch/lifecycle/LifecycleOwner"
	.zero	45
	.zero	2

	/* #21 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554903
	/* java_name */
	.ascii	"android/content/BroadcastReceiver"
	.zero	49
	.zero	2

	/* #22 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554906
	/* java_name */
	.ascii	"android/content/ClipData"
	.zero	58
	.zero	2

	/* #23 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554907
	/* java_name */
	.ascii	"android/content/ClipData$Item"
	.zero	53
	.zero	2

	/* #24 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554905
	/* java_name */
	.ascii	"android/content/ClipboardManager"
	.zero	50
	.zero	2

	/* #25 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554915
	/* java_name */
	.ascii	"android/content/ComponentCallbacks"
	.zero	48
	.zero	2

	/* #26 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554917
	/* java_name */
	.ascii	"android/content/ComponentCallbacks2"
	.zero	47
	.zero	2

	/* #27 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554908
	/* java_name */
	.ascii	"android/content/ComponentName"
	.zero	53
	.zero	2

	/* #28 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554909
	/* java_name */
	.ascii	"android/content/ContentResolver"
	.zero	51
	.zero	2

	/* #29 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554899
	/* java_name */
	.ascii	"android/content/Context"
	.zero	59
	.zero	2

	/* #30 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554912
	/* java_name */
	.ascii	"android/content/ContextWrapper"
	.zero	52
	.zero	2

	/* #31 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554923
	/* java_name */
	.ascii	"android/content/DialogInterface"
	.zero	51
	.zero	2

	/* #32 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554919
	/* java_name */
	.ascii	"android/content/DialogInterface$OnClickListener"
	.zero	35
	.zero	2

	/* #33 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554900
	/* java_name */
	.ascii	"android/content/Intent"
	.zero	60
	.zero	2

	/* #34 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554924
	/* java_name */
	.ascii	"android/content/IntentFilter"
	.zero	54
	.zero	2

	/* #35 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554925
	/* java_name */
	.ascii	"android/content/IntentSender"
	.zero	54
	.zero	2

	/* #36 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554927
	/* java_name */
	.ascii	"android/content/ServiceConnection"
	.zero	49
	.zero	2

	/* #37 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554933
	/* java_name */
	.ascii	"android/content/SharedPreferences"
	.zero	49
	.zero	2

	/* #38 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554929
	/* java_name */
	.ascii	"android/content/SharedPreferences$Editor"
	.zero	42
	.zero	2

	/* #39 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554931
	/* java_name */
	.ascii	"android/content/SharedPreferences$OnSharedPreferenceChangeListener"
	.zero	16
	.zero	2

	/* #40 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554935
	/* java_name */
	.ascii	"android/content/pm/ApplicationInfo"
	.zero	48
	.zero	2

	/* #41 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554937
	/* java_name */
	.ascii	"android/content/pm/PackageInfo"
	.zero	52
	.zero	2

	/* #42 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554939
	/* java_name */
	.ascii	"android/content/pm/PackageItemInfo"
	.zero	48
	.zero	2

	/* #43 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554940
	/* java_name */
	.ascii	"android/content/pm/PackageManager"
	.zero	49
	.zero	2

	/* #44 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554943
	/* java_name */
	.ascii	"android/content/res/AssetFileDescriptor"
	.zero	43
	.zero	2

	/* #45 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554944
	/* java_name */
	.ascii	"android/content/res/ColorStateList"
	.zero	48
	.zero	2

	/* #46 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554945
	/* java_name */
	.ascii	"android/content/res/Configuration"
	.zero	49
	.zero	2

	/* #47 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554946
	/* java_name */
	.ascii	"android/content/res/Resources"
	.zero	53
	.zero	2

	/* #48 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554603
	/* java_name */
	.ascii	"android/database/CharArrayBuffer"
	.zero	50
	.zero	2

	/* #49 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554604
	/* java_name */
	.ascii	"android/database/ContentObserver"
	.zero	50
	.zero	2

	/* #50 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554610
	/* java_name */
	.ascii	"android/database/Cursor"
	.zero	59
	.zero	2

	/* #51 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554606
	/* java_name */
	.ascii	"android/database/DataSetObserver"
	.zero	50
	.zero	2

	/* #52 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554847
	/* java_name */
	.ascii	"android/graphics/Bitmap"
	.zero	59
	.zero	2

	/* #53 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554851
	/* java_name */
	.ascii	"android/graphics/BitmapFactory"
	.zero	52
	.zero	2

	/* #54 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554848
	/* java_name */
	.ascii	"android/graphics/Canvas"
	.zero	59
	.zero	2

	/* #55 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554852
	/* java_name */
	.ascii	"android/graphics/ColorFilter"
	.zero	54
	.zero	2

	/* #56 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554853
	/* java_name */
	.ascii	"android/graphics/Matrix"
	.zero	59
	.zero	2

	/* #57 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554854
	/* java_name */
	.ascii	"android/graphics/Paint"
	.zero	60
	.zero	2

	/* #58 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554855
	/* java_name */
	.ascii	"android/graphics/Point"
	.zero	60
	.zero	2

	/* #59 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554856
	/* java_name */
	.ascii	"android/graphics/PorterDuff"
	.zero	55
	.zero	2

	/* #60 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554857
	/* java_name */
	.ascii	"android/graphics/PorterDuff$Mode"
	.zero	50
	.zero	2

	/* #61 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554858
	/* java_name */
	.ascii	"android/graphics/Rect"
	.zero	61
	.zero	2

	/* #62 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554859
	/* java_name */
	.ascii	"android/graphics/RectF"
	.zero	60
	.zero	2

	/* #63 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554860
	/* java_name */
	.ascii	"android/graphics/Typeface"
	.zero	57
	.zero	2

	/* #64 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554862
	/* java_name */
	.ascii	"android/graphics/drawable/Drawable"
	.zero	48
	.zero	2

	/* #65 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554864
	/* java_name */
	.ascii	"android/graphics/drawable/Drawable$Callback"
	.zero	39
	.zero	2

	/* #66 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554841
	/* java_name */
	.ascii	"android/media/AudioAttributes"
	.zero	53
	.zero	2

	/* #67 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554830
	/* java_name */
	.ascii	"android/media/MediaPlayer"
	.zero	57
	.zero	2

	/* #68 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554832
	/* java_name */
	.ascii	"android/media/MediaPlayer$OnCompletionListener"
	.zero	36
	.zero	2

	/* #69 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554835
	/* java_name */
	.ascii	"android/media/MediaPlayer$OnPreparedListener"
	.zero	38
	.zero	2

	/* #70 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554843
	/* java_name */
	.ascii	"android/media/VolumeAutomation"
	.zero	52
	.zero	2

	/* #71 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554844
	/* java_name */
	.ascii	"android/media/VolumeShaper"
	.zero	56
	.zero	2

	/* #72 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554845
	/* java_name */
	.ascii	"android/media/VolumeShaper$Configuration"
	.zero	42
	.zero	2

	/* #73 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554828
	/* java_name */
	.ascii	"android/net/Uri"
	.zero	67
	.zero	2

	/* #74 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554807
	/* java_name */
	.ascii	"android/os/BaseBundle"
	.zero	61
	.zero	2

	/* #75 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554808
	/* java_name */
	.ascii	"android/os/Binder"
	.zero	65
	.zero	2

	/* #76 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554809
	/* java_name */
	.ascii	"android/os/Build"
	.zero	66
	.zero	2

	/* #77 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554810
	/* java_name */
	.ascii	"android/os/Build$VERSION"
	.zero	58
	.zero	2

	/* #78 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554812
	/* java_name */
	.ascii	"android/os/Bundle"
	.zero	65
	.zero	2

	/* #79 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554813
	/* java_name */
	.ascii	"android/os/Environment"
	.zero	60
	.zero	2

	/* #80 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554806
	/* java_name */
	.ascii	"android/os/Handler"
	.zero	64
	.zero	2

	/* #81 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554817
	/* java_name */
	.ascii	"android/os/IBinder"
	.zero	64
	.zero	2

	/* #82 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554815
	/* java_name */
	.ascii	"android/os/IBinder$DeathRecipient"
	.zero	49
	.zero	2

	/* #83 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554819
	/* java_name */
	.ascii	"android/os/IInterface"
	.zero	61
	.zero	2

	/* #84 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554824
	/* java_name */
	.ascii	"android/os/Looper"
	.zero	65
	.zero	2

	/* #85 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554825
	/* java_name */
	.ascii	"android/os/Parcel"
	.zero	65
	.zero	2

	/* #86 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554823
	/* java_name */
	.ascii	"android/os/Parcelable"
	.zero	61
	.zero	2

	/* #87 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554821
	/* java_name */
	.ascii	"android/os/Parcelable$Creator"
	.zero	53
	.zero	2

	/* #88 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554805
	/* java_name */
	.ascii	"android/preference/PreferenceManager"
	.zero	46
	.zero	2

	/* #89 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554595
	/* java_name */
	.ascii	"android/provider/DocumentsContract"
	.zero	48
	.zero	2

	/* #90 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554596
	/* java_name */
	.ascii	"android/provider/MediaStore"
	.zero	55
	.zero	2

	/* #91 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554597
	/* java_name */
	.ascii	"android/provider/MediaStore$Audio"
	.zero	49
	.zero	2

	/* #92 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554598
	/* java_name */
	.ascii	"android/provider/MediaStore$Audio$Media"
	.zero	43
	.zero	2

	/* #93 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554599
	/* java_name */
	.ascii	"android/provider/MediaStore$Images"
	.zero	48
	.zero	2

	/* #94 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554600
	/* java_name */
	.ascii	"android/provider/MediaStore$Images$Media"
	.zero	42
	.zero	2

	/* #95 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554601
	/* java_name */
	.ascii	"android/provider/MediaStore$Video"
	.zero	49
	.zero	2

	/* #96 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554602
	/* java_name */
	.ascii	"android/provider/MediaStore$Video$Media"
	.zero	43
	.zero	2

	/* #97 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554992
	/* java_name */
	.ascii	"android/runtime/JavaProxyThrowable"
	.zero	48
	.zero	2

	/* #98 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554442
	/* java_name */
	.ascii	"android/support/design/widget/BaseTransientBottomBar"
	.zero	30
	.zero	2

	/* #99 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554443
	/* java_name */
	.ascii	"android/support/design/widget/BaseTransientBottomBar$BaseCallback"
	.zero	17
	.zero	2

	/* #100 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554446
	/* java_name */
	.ascii	"android/support/design/widget/BaseTransientBottomBar$ContentViewCallback"
	.zero	10
	.zero	2

	/* #101 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554439
	/* java_name */
	.ascii	"android/support/design/widget/FloatingActionButton"
	.zero	32
	.zero	2

	/* #102 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554440
	/* java_name */
	.ascii	"android/support/design/widget/FloatingActionButton$OnVisibilityChangedListener"
	.zero	4
	.zero	2

	/* #103 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554435
	/* java_name */
	.ascii	"android/support/design/widget/Snackbar"
	.zero	44
	.zero	2

	/* #104 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554437
	/* java_name */
	.ascii	"android/support/design/widget/Snackbar$Callback"
	.zero	35
	.zero	2

	/* #105 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554436
	/* java_name */
	.ascii	"android/support/design/widget/Snackbar_SnackbarActionClickImplementor"
	.zero	13
	.zero	2

	/* #106 */
	/* module_index */
	.long	7
	/* type_token_id */
	.long	33554438
	/* java_name */
	.ascii	"android/support/design/widget/VisibilityAwareImageButton"
	.zero	26
	.zero	2

	/* #107 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554459
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat"
	.zero	45
	.zero	2

	/* #108 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554461
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat$OnRequestPermissionsResultCallback"
	.zero	10
	.zero	2

	/* #109 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554463
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat$PermissionCompatDelegate"
	.zero	20
	.zero	2

	/* #110 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554465
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat$RequestPermissionsRequestCodeValidator"
	.zero	6
	.zero	2

	/* #111 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554436
	/* java_name */
	.ascii	"android/support/v4/app/Fragment"
	.zero	51
	.zero	2

	/* #112 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554437
	/* java_name */
	.ascii	"android/support/v4/app/Fragment$SavedState"
	.zero	40
	.zero	2

	/* #113 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554435
	/* java_name */
	.ascii	"android/support/v4/app/FragmentActivity"
	.zero	43
	.zero	2

	/* #114 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554438
	/* java_name */
	.ascii	"android/support/v4/app/FragmentManager"
	.zero	44
	.zero	2

	/* #115 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554440
	/* java_name */
	.ascii	"android/support/v4/app/FragmentManager$BackStackEntry"
	.zero	29
	.zero	2

	/* #116 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554441
	/* java_name */
	.ascii	"android/support/v4/app/FragmentManager$FragmentLifecycleCallbacks"
	.zero	17
	.zero	2

	/* #117 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554444
	/* java_name */
	.ascii	"android/support/v4/app/FragmentManager$OnBackStackChangedListener"
	.zero	17
	.zero	2

	/* #118 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554449
	/* java_name */
	.ascii	"android/support/v4/app/FragmentTransaction"
	.zero	40
	.zero	2

	/* #119 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554451
	/* java_name */
	.ascii	"android/support/v4/app/LoaderManager"
	.zero	46
	.zero	2

	/* #120 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554453
	/* java_name */
	.ascii	"android/support/v4/app/LoaderManager$LoaderCallbacks"
	.zero	30
	.zero	2

	/* #121 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554466
	/* java_name */
	.ascii	"android/support/v4/app/SharedElementCallback"
	.zero	38
	.zero	2

	/* #122 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554468
	/* java_name */
	.ascii	"android/support/v4/app/SharedElementCallback$OnSharedElementsReadyListener"
	.zero	8
	.zero	2

	/* #123 */
	/* module_index */
	.long	2
	/* type_token_id */
	.long	33554441
	/* java_name */
	.ascii	"android/support/v4/app/TaskStackBuilder"
	.zero	43
	.zero	2

	/* #124 */
	/* module_index */
	.long	2
	/* type_token_id */
	.long	33554443
	/* java_name */
	.ascii	"android/support/v4/app/TaskStackBuilder$SupportParentable"
	.zero	25
	.zero	2

	/* #125 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554458
	/* java_name */
	.ascii	"android/support/v4/content/ContextCompat"
	.zero	42
	.zero	2

	/* #126 */
	/* module_index */
	.long	2
	/* type_token_id */
	.long	33554435
	/* java_name */
	.ascii	"android/support/v4/content/Loader"
	.zero	49
	.zero	2

	/* #127 */
	/* module_index */
	.long	2
	/* type_token_id */
	.long	33554437
	/* java_name */
	.ascii	"android/support/v4/content/Loader$OnLoadCanceledListener"
	.zero	26
	.zero	2

	/* #128 */
	/* module_index */
	.long	2
	/* type_token_id */
	.long	33554439
	/* java_name */
	.ascii	"android/support/v4/content/Loader$OnLoadCompleteListener"
	.zero	26
	.zero	2

	/* #129 */
	/* module_index */
	.long	2
	/* type_token_id */
	.long	33554440
	/* java_name */
	.ascii	"android/support/v4/content/PermissionChecker"
	.zero	38
	.zero	2

	/* #130 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554455
	/* java_name */
	.ascii	"android/support/v4/internal/view/SupportMenu"
	.zero	38
	.zero	2

	/* #131 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554457
	/* java_name */
	.ascii	"android/support/v4/internal/view/SupportMenuItem"
	.zero	34
	.zero	2

	/* #132 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554435
	/* java_name */
	.ascii	"android/support/v4/view/ActionProvider"
	.zero	44
	.zero	2

	/* #133 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554437
	/* java_name */
	.ascii	"android/support/v4/view/ActionProvider$SubUiVisibilityListener"
	.zero	20
	.zero	2

	/* #134 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554441
	/* java_name */
	.ascii	"android/support/v4/view/ActionProvider$VisibilityListener"
	.zero	25
	.zero	2

	/* #135 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554453
	/* java_name */
	.ascii	"android/support/v4/view/ViewPropertyAnimatorCompat"
	.zero	32
	.zero	2

	/* #136 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554450
	/* java_name */
	.ascii	"android/support/v4/view/ViewPropertyAnimatorListener"
	.zero	30
	.zero	2

	/* #137 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554452
	/* java_name */
	.ascii	"android/support/v4/view/ViewPropertyAnimatorUpdateListener"
	.zero	24
	.zero	2

	/* #138 */
	/* module_index */
	.long	1
	/* type_token_id */
	.long	33554435
	/* java_name */
	.ascii	"android/support/v4/widget/DrawerLayout"
	.zero	44
	.zero	2

	/* #139 */
	/* module_index */
	.long	1
	/* type_token_id */
	.long	33554437
	/* java_name */
	.ascii	"android/support/v4/widget/DrawerLayout$DrawerListener"
	.zero	29
	.zero	2

	/* #140 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554464
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar"
	.zero	50
	.zero	2

	/* #141 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554465
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$LayoutParams"
	.zero	37
	.zero	2

	/* #142 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554467
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$OnMenuVisibilityListener"
	.zero	25
	.zero	2

	/* #143 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554471
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$OnNavigationListener"
	.zero	29
	.zero	2

	/* #144 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554472
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$Tab"
	.zero	46
	.zero	2

	/* #145 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554475
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$TabListener"
	.zero	38
	.zero	2

	/* #146 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554479
	/* java_name */
	.ascii	"android/support/v7/app/ActionBarDrawerToggle"
	.zero	38
	.zero	2

	/* #147 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554481
	/* java_name */
	.ascii	"android/support/v7/app/ActionBarDrawerToggle$Delegate"
	.zero	29
	.zero	2

	/* #148 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554483
	/* java_name */
	.ascii	"android/support/v7/app/ActionBarDrawerToggle$DelegateProvider"
	.zero	21
	.zero	2

	/* #149 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554484
	/* java_name */
	.ascii	"android/support/v7/app/AppCompatActivity"
	.zero	42
	.zero	2

	/* #150 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554488
	/* java_name */
	.ascii	"android/support/v7/app/AppCompatCallback"
	.zero	42
	.zero	2

	/* #151 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554485
	/* java_name */
	.ascii	"android/support/v7/app/AppCompatDelegate"
	.zero	42
	.zero	2

	/* #152 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554435
	/* java_name */
	.ascii	"android/support/v7/graphics/drawable/DrawerArrowDrawable"
	.zero	26
	.zero	2

	/* #153 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554436
	/* java_name */
	.ascii	"android/support/v7/view/ActionMode"
	.zero	48
	.zero	2

	/* #154 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554438
	/* java_name */
	.ascii	"android/support/v7/view/ActionMode$Callback"
	.zero	39
	.zero	2

	/* #155 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554446
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuBuilder"
	.zero	42
	.zero	2

	/* #156 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554448
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuBuilder$Callback"
	.zero	33
	.zero	2

	/* #157 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554449
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuItemImpl"
	.zero	41
	.zero	2

	/* #158 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554443
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuPresenter"
	.zero	40
	.zero	2

	/* #159 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554441
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuPresenter$Callback"
	.zero	31
	.zero	2

	/* #160 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554445
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuView"
	.zero	45
	.zero	2

	/* #161 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554450
	/* java_name */
	.ascii	"android/support/v7/view/menu/SubMenuBuilder"
	.zero	39
	.zero	2

	/* #162 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554461
	/* java_name */
	.ascii	"android/support/v7/widget/DecorToolbar"
	.zero	44
	.zero	2

	/* #163 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554462
	/* java_name */
	.ascii	"android/support/v7/widget/ScrollingTabContainerView"
	.zero	31
	.zero	2

	/* #164 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554463
	/* java_name */
	.ascii	"android/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener"
	.zero	8
	.zero	2

	/* #165 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554451
	/* java_name */
	.ascii	"android/support/v7/widget/Toolbar"
	.zero	49
	.zero	2

	/* #166 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554455
	/* java_name */
	.ascii	"android/support/v7/widget/Toolbar$OnMenuItemClickListener"
	.zero	25
	.zero	2

	/* #167 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554452
	/* java_name */
	.ascii	"android/support/v7/widget/Toolbar_NavigationOnClickEventDispatcher"
	.zero	16
	.zero	2

	/* #168 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554784
	/* java_name */
	.ascii	"android/text/ClipboardManager"
	.zero	53
	.zero	2

	/* #169 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554787
	/* java_name */
	.ascii	"android/text/Editable"
	.zero	61
	.zero	2

	/* #170 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554790
	/* java_name */
	.ascii	"android/text/GetChars"
	.zero	61
	.zero	2

	/* #171 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554793
	/* java_name */
	.ascii	"android/text/InputFilter"
	.zero	58
	.zero	2

	/* #172 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554795
	/* java_name */
	.ascii	"android/text/NoCopySpan"
	.zero	59
	.zero	2

	/* #173 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554797
	/* java_name */
	.ascii	"android/text/Spannable"
	.zero	60
	.zero	2

	/* #174 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554800
	/* java_name */
	.ascii	"android/text/Spanned"
	.zero	62
	.zero	2

	/* #175 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554803
	/* java_name */
	.ascii	"android/text/TextWatcher"
	.zero	58
	.zero	2

	/* #176 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554782
	/* java_name */
	.ascii	"android/util/AttributeSet"
	.zero	57
	.zero	2

	/* #177 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554780
	/* java_name */
	.ascii	"android/util/DisplayMetrics"
	.zero	55
	.zero	2

	/* #178 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554779
	/* java_name */
	.ascii	"android/util/Log"
	.zero	66
	.zero	2

	/* #179 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554783
	/* java_name */
	.ascii	"android/util/SparseArray"
	.zero	58
	.zero	2

	/* #180 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554715
	/* java_name */
	.ascii	"android/view/ActionMode"
	.zero	59
	.zero	2

	/* #181 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554717
	/* java_name */
	.ascii	"android/view/ActionMode$Callback"
	.zero	50
	.zero	2

	/* #182 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554720
	/* java_name */
	.ascii	"android/view/ActionProvider"
	.zero	55
	.zero	2

	/* #183 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554726
	/* java_name */
	.ascii	"android/view/CollapsibleActionView"
	.zero	48
	.zero	2

	/* #184 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554730
	/* java_name */
	.ascii	"android/view/ContextMenu"
	.zero	58
	.zero	2

	/* #185 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554728
	/* java_name */
	.ascii	"android/view/ContextMenu$ContextMenuInfo"
	.zero	42
	.zero	2

	/* #186 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554722
	/* java_name */
	.ascii	"android/view/ContextThemeWrapper"
	.zero	50
	.zero	2

	/* #187 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554723
	/* java_name */
	.ascii	"android/view/Display"
	.zero	62
	.zero	2

	/* #188 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554739
	/* java_name */
	.ascii	"android/view/InputEvent"
	.zero	59
	.zero	2

	/* #189 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554694
	/* java_name */
	.ascii	"android/view/KeyEvent"
	.zero	61
	.zero	2

	/* #190 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554696
	/* java_name */
	.ascii	"android/view/KeyEvent$Callback"
	.zero	52
	.zero	2

	/* #191 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554697
	/* java_name */
	.ascii	"android/view/LayoutInflater"
	.zero	55
	.zero	2

	/* #192 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554699
	/* java_name */
	.ascii	"android/view/LayoutInflater$Factory"
	.zero	47
	.zero	2

	/* #193 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554701
	/* java_name */
	.ascii	"android/view/LayoutInflater$Factory2"
	.zero	46
	.zero	2

	/* #194 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554703
	/* java_name */
	.ascii	"android/view/LayoutInflater$Filter"
	.zero	48
	.zero	2

	/* #195 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554732
	/* java_name */
	.ascii	"android/view/Menu"
	.zero	65
	.zero	2

	/* #196 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554754
	/* java_name */
	.ascii	"android/view/MenuInflater"
	.zero	57
	.zero	2

	/* #197 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554738
	/* java_name */
	.ascii	"android/view/MenuItem"
	.zero	61
	.zero	2

	/* #198 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554734
	/* java_name */
	.ascii	"android/view/MenuItem$OnActionExpandListener"
	.zero	38
	.zero	2

	/* #199 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554736
	/* java_name */
	.ascii	"android/view/MenuItem$OnMenuItemClickListener"
	.zero	37
	.zero	2

	/* #200 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554704
	/* java_name */
	.ascii	"android/view/MotionEvent"
	.zero	58
	.zero	2

	/* #201 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554757
	/* java_name */
	.ascii	"android/view/SearchEvent"
	.zero	58
	.zero	2

	/* #202 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554742
	/* java_name */
	.ascii	"android/view/SubMenu"
	.zero	62
	.zero	2

	/* #203 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554686
	/* java_name */
	.ascii	"android/view/View"
	.zero	65
	.zero	2

	/* #204 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554688
	/* java_name */
	.ascii	"android/view/View$OnClickListener"
	.zero	49
	.zero	2

	/* #205 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554691
	/* java_name */
	.ascii	"android/view/View$OnCreateContextMenuListener"
	.zero	37
	.zero	2

	/* #206 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554761
	/* java_name */
	.ascii	"android/view/ViewGroup"
	.zero	60
	.zero	2

	/* #207 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554762
	/* java_name */
	.ascii	"android/view/ViewGroup$LayoutParams"
	.zero	47
	.zero	2

	/* #208 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554763
	/* java_name */
	.ascii	"android/view/ViewGroup$MarginLayoutParams"
	.zero	41
	.zero	2

	/* #209 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554744
	/* java_name */
	.ascii	"android/view/ViewManager"
	.zero	58
	.zero	2

	/* #210 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554746
	/* java_name */
	.ascii	"android/view/ViewParent"
	.zero	59
	.zero	2

	/* #211 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554765
	/* java_name */
	.ascii	"android/view/ViewPropertyAnimator"
	.zero	49
	.zero	2

	/* #212 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554705
	/* java_name */
	.ascii	"android/view/ViewTreeObserver"
	.zero	53
	.zero	2

	/* #213 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554707
	/* java_name */
	.ascii	"android/view/ViewTreeObserver$OnGlobalLayoutListener"
	.zero	30
	.zero	2

	/* #214 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554709
	/* java_name */
	.ascii	"android/view/ViewTreeObserver$OnPreDrawListener"
	.zero	35
	.zero	2

	/* #215 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554711
	/* java_name */
	.ascii	"android/view/ViewTreeObserver$OnTouchModeChangeListener"
	.zero	27
	.zero	2

	/* #216 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554712
	/* java_name */
	.ascii	"android/view/Window"
	.zero	63
	.zero	2

	/* #217 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554714
	/* java_name */
	.ascii	"android/view/Window$Callback"
	.zero	54
	.zero	2

	/* #218 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554749
	/* java_name */
	.ascii	"android/view/WindowManager"
	.zero	56
	.zero	2

	/* #219 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554747
	/* java_name */
	.ascii	"android/view/WindowManager$LayoutParams"
	.zero	43
	.zero	2

	/* #220 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554772
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityEvent"
	.zero	37
	.zero	2

	/* #221 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554778
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityEventSource"
	.zero	31
	.zero	2

	/* #222 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554773
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityRecord"
	.zero	36
	.zero	2

	/* #223 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554768
	/* java_name */
	.ascii	"android/view/animation/Animation"
	.zero	50
	.zero	2

	/* #224 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554771
	/* java_name */
	.ascii	"android/view/animation/Interpolator"
	.zero	47
	.zero	2

	/* #225 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554593
	/* java_name */
	.ascii	"android/webkit/MimeTypeMap"
	.zero	56
	.zero	2

	/* #226 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554611
	/* java_name */
	.ascii	"android/widget/AbsListView"
	.zero	56
	.zero	2

	/* #227 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554636
	/* java_name */
	.ascii	"android/widget/AbsSeekBar"
	.zero	57
	.zero	2

	/* #228 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554638
	/* java_name */
	.ascii	"android/widget/AbsSpinner"
	.zero	57
	.zero	2

	/* #229 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554652
	/* java_name */
	.ascii	"android/widget/Adapter"
	.zero	60
	.zero	2

	/* #230 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554613
	/* java_name */
	.ascii	"android/widget/AdapterView"
	.zero	56
	.zero	2

	/* #231 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554615
	/* java_name */
	.ascii	"android/widget/AdapterView$OnItemClickListener"
	.zero	36
	.zero	2

	/* #232 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554619
	/* java_name */
	.ascii	"android/widget/AdapterView$OnItemLongClickListener"
	.zero	32
	.zero	2

	/* #233 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554623
	/* java_name */
	.ascii	"android/widget/AdapterView$OnItemSelectedListener"
	.zero	33
	.zero	2

	/* #234 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	0
	/* java_name */
	.ascii	"android/widget/BaseAdapter"
	.zero	56
	.zero	2

	/* #235 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554643
	/* java_name */
	.ascii	"android/widget/Button"
	.zero	61
	.zero	2

	/* #236 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554644
	/* java_name */
	.ascii	"android/widget/EditText"
	.zero	59
	.zero	2

	/* #237 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554645
	/* java_name */
	.ascii	"android/widget/Filter"
	.zero	61
	.zero	2

	/* #238 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554647
	/* java_name */
	.ascii	"android/widget/Filter$FilterListener"
	.zero	46
	.zero	2

	/* #239 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554649
	/* java_name */
	.ascii	"android/widget/FrameLayout"
	.zero	56
	.zero	2

	/* #240 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554650
	/* java_name */
	.ascii	"android/widget/HorizontalScrollView"
	.zero	47
	.zero	2

	/* #241 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554655
	/* java_name */
	.ascii	"android/widget/ImageButton"
	.zero	56
	.zero	2

	/* #242 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554656
	/* java_name */
	.ascii	"android/widget/ImageView"
	.zero	58
	.zero	2

	/* #243 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554659
	/* java_name */
	.ascii	"android/widget/LinearLayout"
	.zero	55
	.zero	2

	/* #244 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554660
	/* java_name */
	.ascii	"android/widget/LinearLayout$LayoutParams"
	.zero	42
	.zero	2

	/* #245 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554654
	/* java_name */
	.ascii	"android/widget/ListAdapter"
	.zero	56
	.zero	2

	/* #246 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554661
	/* java_name */
	.ascii	"android/widget/ListView"
	.zero	59
	.zero	2

	/* #247 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554663
	/* java_name */
	.ascii	"android/widget/ProgressBar"
	.zero	56
	.zero	2

	/* #248 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554664
	/* java_name */
	.ascii	"android/widget/RelativeLayout"
	.zero	53
	.zero	2

	/* #249 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554665
	/* java_name */
	.ascii	"android/widget/RemoteViews"
	.zero	56
	.zero	2

	/* #250 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554666
	/* java_name */
	.ascii	"android/widget/SearchView"
	.zero	57
	.zero	2

	/* #251 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554668
	/* java_name */
	.ascii	"android/widget/SearchView$OnQueryTextListener"
	.zero	37
	.zero	2

	/* #252 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554674
	/* java_name */
	.ascii	"android/widget/SeekBar"
	.zero	60
	.zero	2

	/* #253 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554676
	/* java_name */
	.ascii	"android/widget/SeekBar$OnSeekBarChangeListener"
	.zero	36
	.zero	2

	/* #254 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554683
	/* java_name */
	.ascii	"android/widget/Spinner"
	.zero	60
	.zero	2

	/* #255 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554658
	/* java_name */
	.ascii	"android/widget/SpinnerAdapter"
	.zero	53
	.zero	2

	/* #256 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554635
	/* java_name */
	.ascii	"android/widget/TextView"
	.zero	59
	.zero	2

	/* #257 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554684
	/* java_name */
	.ascii	"android/widget/Toast"
	.zero	62
	.zero	2

	/* #258 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554444
	/* java_name */
	.ascii	"com/mikawaheiya/mymusiclists/MusicPlayService"
	.zero	37
	.zero	2

	/* #259 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554436
	/* java_name */
	.ascii	"crc640f9927811dc5dabb/MusicLabelView"
	.zero	46
	.zero	2

	/* #260 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554437
	/* java_name */
	.ascii	"crc640f9927811dc5dabb/MusicListView"
	.zero	47
	.zero	2

	/* #261 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554438
	/* java_name */
	.ascii	"crc640f9927811dc5dabb/NewMusicViewDialog"
	.zero	42
	.zero	2

	/* #262 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554439
	/* java_name */
	.ascii	"crc640f9927811dc5dabb/SimpleStringInput"
	.zero	43
	.zero	2

	/* #263 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554440
	/* java_name */
	.ascii	"crc640f9927811dc5dabb/SimpleStringView"
	.zero	44
	.zero	2

	/* #264 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554455
	/* java_name */
	.ascii	"crc64126e824666aacd28/MusicAdapter"
	.zero	48
	.zero	2

	/* #265 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554456
	/* java_name */
	.ascii	"crc64126e824666aacd28/MusicListAdapter"
	.zero	44
	.zero	2

	/* #266 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554447
	/* java_name */
	.ascii	"crc649b574cba3e25766a/ControlPaneNotificationRecevier"
	.zero	29
	.zero	2

	/* #267 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554442
	/* java_name */
	.ascii	"crc649b574cba3e25766a/MusicPlayBinder"
	.zero	45
	.zero	2

	/* #268 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554443
	/* java_name */
	.ascii	"crc649b574cba3e25766a/MusicPlayConnection"
	.zero	41
	.zero	2

	/* #269 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554445
	/* java_name */
	.ascii	"crc649b574cba3e25766a/NotificationClickRecevier"
	.zero	35
	.zero	2

	/* #270 */
	/* module_index */
	.long	6
	/* type_token_id */
	.long	33554465
	/* java_name */
	.ascii	"crc64a0e0a82d0db9a07d/ActivityLifecycleContextListener"
	.zero	28
	.zero	2

	/* #271 */
	/* module_index */
	.long	6
	/* type_token_id */
	.long	33554466
	/* java_name */
	.ascii	"crc64a0e0a82d0db9a07d/IntermediateActivity"
	.zero	40
	.zero	2

	/* #272 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554457
	/* java_name */
	.ascii	"crc64ad0812b77a3f66b2/ConfigActivity"
	.zero	46
	.zero	2

	/* #273 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554458
	/* java_name */
	.ascii	"crc64ad0812b77a3f66b2/MainActivity"
	.zero	48
	.zero	2

	/* #274 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554461
	/* java_name */
	.ascii	"crc64ad0812b77a3f66b2/MusicActivity"
	.zero	47
	.zero	2

	/* #275 */
	/* module_index */
	.long	4
	/* type_token_id */
	.long	33554462
	/* java_name */
	.ascii	"crc64ad0812b77a3f66b2/MusicListActivity"
	.zero	43
	.zero	2

	/* #276 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555141
	/* java_name */
	.ascii	"java/io/Closeable"
	.zero	65
	.zero	2

	/* #277 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555137
	/* java_name */
	.ascii	"java/io/File"
	.zero	70
	.zero	2

	/* #278 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555138
	/* java_name */
	.ascii	"java/io/FileDescriptor"
	.zero	60
	.zero	2

	/* #279 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555139
	/* java_name */
	.ascii	"java/io/FileInputStream"
	.zero	59
	.zero	2

	/* #280 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555143
	/* java_name */
	.ascii	"java/io/Flushable"
	.zero	65
	.zero	2

	/* #281 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555147
	/* java_name */
	.ascii	"java/io/IOException"
	.zero	63
	.zero	2

	/* #282 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555144
	/* java_name */
	.ascii	"java/io/InputStream"
	.zero	63
	.zero	2

	/* #283 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555146
	/* java_name */
	.ascii	"java/io/InterruptedIOException"
	.zero	52
	.zero	2

	/* #284 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555150
	/* java_name */
	.ascii	"java/io/OutputStream"
	.zero	62
	.zero	2

	/* #285 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555152
	/* java_name */
	.ascii	"java/io/PrintWriter"
	.zero	63
	.zero	2

	/* #286 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555149
	/* java_name */
	.ascii	"java/io/Serializable"
	.zero	62
	.zero	2

	/* #287 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555153
	/* java_name */
	.ascii	"java/io/StringWriter"
	.zero	62
	.zero	2

	/* #288 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555154
	/* java_name */
	.ascii	"java/io/Writer"
	.zero	68
	.zero	2

	/* #289 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555103
	/* java_name */
	.ascii	"java/lang/Appendable"
	.zero	62
	.zero	2

	/* #290 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555105
	/* java_name */
	.ascii	"java/lang/AutoCloseable"
	.zero	59
	.zero	2

	/* #291 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555079
	/* java_name */
	.ascii	"java/lang/Boolean"
	.zero	65
	.zero	2

	/* #292 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555080
	/* java_name */
	.ascii	"java/lang/Byte"
	.zero	68
	.zero	2

	/* #293 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555106
	/* java_name */
	.ascii	"java/lang/CharSequence"
	.zero	60
	.zero	2

	/* #294 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555081
	/* java_name */
	.ascii	"java/lang/Character"
	.zero	63
	.zero	2

	/* #295 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555082
	/* java_name */
	.ascii	"java/lang/Class"
	.zero	67
	.zero	2

	/* #296 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555098
	/* java_name */
	.ascii	"java/lang/ClassCastException"
	.zero	54
	.zero	2

	/* #297 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555083
	/* java_name */
	.ascii	"java/lang/ClassNotFoundException"
	.zero	50
	.zero	2

	/* #298 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555109
	/* java_name */
	.ascii	"java/lang/Cloneable"
	.zero	63
	.zero	2

	/* #299 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555111
	/* java_name */
	.ascii	"java/lang/Comparable"
	.zero	62
	.zero	2

	/* #300 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555084
	/* java_name */
	.ascii	"java/lang/Double"
	.zero	66
	.zero	2

	/* #301 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555099
	/* java_name */
	.ascii	"java/lang/Enum"
	.zero	68
	.zero	2

	/* #302 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555101
	/* java_name */
	.ascii	"java/lang/Error"
	.zero	67
	.zero	2

	/* #303 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555085
	/* java_name */
	.ascii	"java/lang/Exception"
	.zero	63
	.zero	2

	/* #304 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555086
	/* java_name */
	.ascii	"java/lang/Float"
	.zero	67
	.zero	2

	/* #305 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555114
	/* java_name */
	.ascii	"java/lang/IllegalArgumentException"
	.zero	48
	.zero	2

	/* #306 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555115
	/* java_name */
	.ascii	"java/lang/IllegalStateException"
	.zero	51
	.zero	2

	/* #307 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555116
	/* java_name */
	.ascii	"java/lang/IndexOutOfBoundsException"
	.zero	47
	.zero	2

	/* #308 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555088
	/* java_name */
	.ascii	"java/lang/Integer"
	.zero	65
	.zero	2

	/* #309 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555113
	/* java_name */
	.ascii	"java/lang/Iterable"
	.zero	64
	.zero	2

	/* #310 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555119
	/* java_name */
	.ascii	"java/lang/LinkageError"
	.zero	60
	.zero	2

	/* #311 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555089
	/* java_name */
	.ascii	"java/lang/Long"
	.zero	68
	.zero	2

	/* #312 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555120
	/* java_name */
	.ascii	"java/lang/NoClassDefFoundError"
	.zero	52
	.zero	2

	/* #313 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555121
	/* java_name */
	.ascii	"java/lang/NullPointerException"
	.zero	52
	.zero	2

	/* #314 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555122
	/* java_name */
	.ascii	"java/lang/Number"
	.zero	66
	.zero	2

	/* #315 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555090
	/* java_name */
	.ascii	"java/lang/Object"
	.zero	66
	.zero	2

	/* #316 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555124
	/* java_name */
	.ascii	"java/lang/ReflectiveOperationException"
	.zero	44
	.zero	2

	/* #317 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555118
	/* java_name */
	.ascii	"java/lang/Runnable"
	.zero	64
	.zero	2

	/* #318 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555091
	/* java_name */
	.ascii	"java/lang/RuntimeException"
	.zero	56
	.zero	2

	/* #319 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555125
	/* java_name */
	.ascii	"java/lang/SecurityException"
	.zero	55
	.zero	2

	/* #320 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555092
	/* java_name */
	.ascii	"java/lang/Short"
	.zero	67
	.zero	2

	/* #321 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555093
	/* java_name */
	.ascii	"java/lang/String"
	.zero	66
	.zero	2

	/* #322 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555095
	/* java_name */
	.ascii	"java/lang/Thread"
	.zero	66
	.zero	2

	/* #323 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555097
	/* java_name */
	.ascii	"java/lang/Throwable"
	.zero	63
	.zero	2

	/* #324 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555126
	/* java_name */
	.ascii	"java/lang/UnsupportedOperationException"
	.zero	43
	.zero	2

	/* #325 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555128
	/* java_name */
	.ascii	"java/lang/annotation/Annotation"
	.zero	51
	.zero	2

	/* #326 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555130
	/* java_name */
	.ascii	"java/lang/reflect/AnnotatedElement"
	.zero	48
	.zero	2

	/* #327 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555132
	/* java_name */
	.ascii	"java/lang/reflect/GenericDeclaration"
	.zero	46
	.zero	2

	/* #328 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555134
	/* java_name */
	.ascii	"java/lang/reflect/Type"
	.zero	60
	.zero	2

	/* #329 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555136
	/* java_name */
	.ascii	"java/lang/reflect/TypeVariable"
	.zero	52
	.zero	2

	/* #330 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555016
	/* java_name */
	.ascii	"java/net/ConnectException"
	.zero	57
	.zero	2

	/* #331 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555018
	/* java_name */
	.ascii	"java/net/HttpURLConnection"
	.zero	56
	.zero	2

	/* #332 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555020
	/* java_name */
	.ascii	"java/net/InetSocketAddress"
	.zero	56
	.zero	2

	/* #333 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555021
	/* java_name */
	.ascii	"java/net/ProtocolException"
	.zero	56
	.zero	2

	/* #334 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555022
	/* java_name */
	.ascii	"java/net/Proxy"
	.zero	68
	.zero	2

	/* #335 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555023
	/* java_name */
	.ascii	"java/net/Proxy$Type"
	.zero	63
	.zero	2

	/* #336 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555024
	/* java_name */
	.ascii	"java/net/ProxySelector"
	.zero	60
	.zero	2

	/* #337 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555026
	/* java_name */
	.ascii	"java/net/SocketAddress"
	.zero	60
	.zero	2

	/* #338 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555028
	/* java_name */
	.ascii	"java/net/SocketException"
	.zero	58
	.zero	2

	/* #339 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555029
	/* java_name */
	.ascii	"java/net/SocketTimeoutException"
	.zero	51
	.zero	2

	/* #340 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555031
	/* java_name */
	.ascii	"java/net/URI"
	.zero	70
	.zero	2

	/* #341 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555032
	/* java_name */
	.ascii	"java/net/URL"
	.zero	70
	.zero	2

	/* #342 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555033
	/* java_name */
	.ascii	"java/net/URLConnection"
	.zero	60
	.zero	2

	/* #343 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555030
	/* java_name */
	.ascii	"java/net/UnknownServiceException"
	.zero	50
	.zero	2

	/* #344 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555055
	/* java_name */
	.ascii	"java/nio/Buffer"
	.zero	67
	.zero	2

	/* #345 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555057
	/* java_name */
	.ascii	"java/nio/ByteBuffer"
	.zero	63
	.zero	2

	/* #346 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555062
	/* java_name */
	.ascii	"java/nio/channels/ByteChannel"
	.zero	53
	.zero	2

	/* #347 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555064
	/* java_name */
	.ascii	"java/nio/channels/Channel"
	.zero	57
	.zero	2

	/* #348 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555059
	/* java_name */
	.ascii	"java/nio/channels/FileChannel"
	.zero	53
	.zero	2

	/* #349 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555066
	/* java_name */
	.ascii	"java/nio/channels/GatheringByteChannel"
	.zero	44
	.zero	2

	/* #350 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555068
	/* java_name */
	.ascii	"java/nio/channels/InterruptibleChannel"
	.zero	44
	.zero	2

	/* #351 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555070
	/* java_name */
	.ascii	"java/nio/channels/ReadableByteChannel"
	.zero	45
	.zero	2

	/* #352 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555072
	/* java_name */
	.ascii	"java/nio/channels/ScatteringByteChannel"
	.zero	43
	.zero	2

	/* #353 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555074
	/* java_name */
	.ascii	"java/nio/channels/SeekableByteChannel"
	.zero	45
	.zero	2

	/* #354 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555076
	/* java_name */
	.ascii	"java/nio/channels/WritableByteChannel"
	.zero	45
	.zero	2

	/* #355 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555077
	/* java_name */
	.ascii	"java/nio/channels/spi/AbstractInterruptibleChannel"
	.zero	32
	.zero	2

	/* #356 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555042
	/* java_name */
	.ascii	"java/security/KeyStore"
	.zero	60
	.zero	2

	/* #357 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555044
	/* java_name */
	.ascii	"java/security/KeyStore$LoadStoreParameter"
	.zero	41
	.zero	2

	/* #358 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555046
	/* java_name */
	.ascii	"java/security/KeyStore$ProtectionParameter"
	.zero	40
	.zero	2

	/* #359 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555041
	/* java_name */
	.ascii	"java/security/Principal"
	.zero	59
	.zero	2

	/* #360 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555047
	/* java_name */
	.ascii	"java/security/SecureRandom"
	.zero	56
	.zero	2

	/* #361 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555048
	/* java_name */
	.ascii	"java/security/cert/Certificate"
	.zero	52
	.zero	2

	/* #362 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555050
	/* java_name */
	.ascii	"java/security/cert/CertificateFactory"
	.zero	45
	.zero	2

	/* #363 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555053
	/* java_name */
	.ascii	"java/security/cert/X509Certificate"
	.zero	48
	.zero	2

	/* #364 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555052
	/* java_name */
	.ascii	"java/security/cert/X509Extension"
	.zero	50
	.zero	2

	/* #365 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554984
	/* java_name */
	.ascii	"java/util/ArrayList"
	.zero	63
	.zero	2

	/* #366 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554973
	/* java_name */
	.ascii	"java/util/Collection"
	.zero	62
	.zero	2

	/* #367 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555036
	/* java_name */
	.ascii	"java/util/Enumeration"
	.zero	61
	.zero	2

	/* #368 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554975
	/* java_name */
	.ascii	"java/util/HashMap"
	.zero	65
	.zero	2

	/* #369 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554993
	/* java_name */
	.ascii	"java/util/HashSet"
	.zero	65
	.zero	2

	/* #370 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555038
	/* java_name */
	.ascii	"java/util/Iterator"
	.zero	64
	.zero	2

	/* #371 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555039
	/* java_name */
	.ascii	"java/util/Random"
	.zero	66
	.zero	2

	/* #372 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554565
	/* java_name */
	.ascii	"javax/net/SocketFactory"
	.zero	59
	.zero	2

	/* #373 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554570
	/* java_name */
	.ascii	"javax/net/ssl/HostnameVerifier"
	.zero	52
	.zero	2

	/* #374 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554567
	/* java_name */
	.ascii	"javax/net/ssl/HttpsURLConnection"
	.zero	50
	.zero	2

	/* #375 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554572
	/* java_name */
	.ascii	"javax/net/ssl/KeyManager"
	.zero	58
	.zero	2

	/* #376 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554581
	/* java_name */
	.ascii	"javax/net/ssl/KeyManagerFactory"
	.zero	51
	.zero	2

	/* #377 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554582
	/* java_name */
	.ascii	"javax/net/ssl/SSLContext"
	.zero	58
	.zero	2

	/* #378 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554574
	/* java_name */
	.ascii	"javax/net/ssl/SSLSession"
	.zero	58
	.zero	2

	/* #379 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554576
	/* java_name */
	.ascii	"javax/net/ssl/SSLSessionContext"
	.zero	51
	.zero	2

	/* #380 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554583
	/* java_name */
	.ascii	"javax/net/ssl/SSLSocketFactory"
	.zero	52
	.zero	2

	/* #381 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554578
	/* java_name */
	.ascii	"javax/net/ssl/TrustManager"
	.zero	56
	.zero	2

	/* #382 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554585
	/* java_name */
	.ascii	"javax/net/ssl/TrustManagerFactory"
	.zero	49
	.zero	2

	/* #383 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554580
	/* java_name */
	.ascii	"javax/net/ssl/X509TrustManager"
	.zero	52
	.zero	2

	/* #384 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554561
	/* java_name */
	.ascii	"javax/security/cert/Certificate"
	.zero	51
	.zero	2

	/* #385 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554563
	/* java_name */
	.ascii	"javax/security/cert/X509Certificate"
	.zero	47
	.zero	2

	/* #386 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555177
	/* java_name */
	.ascii	"mono/android/TypeManager"
	.zero	58
	.zero	2

	/* #387 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554921
	/* java_name */
	.ascii	"mono/android/content/DialogInterface_OnClickListenerImplementor"
	.zero	19
	.zero	2

	/* #388 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554833
	/* java_name */
	.ascii	"mono/android/media/MediaPlayer_OnCompletionListenerImplementor"
	.zero	20
	.zero	2

	/* #389 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554836
	/* java_name */
	.ascii	"mono/android/media/MediaPlayer_OnPreparedListenerImplementor"
	.zero	22
	.zero	2

	/* #390 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554969
	/* java_name */
	.ascii	"mono/android/runtime/InputStreamAdapter"
	.zero	43
	.zero	2

	/* #391 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	0
	/* java_name */
	.ascii	"mono/android/runtime/JavaArray"
	.zero	52
	.zero	2

	/* #392 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554990
	/* java_name */
	.ascii	"mono/android/runtime/JavaObject"
	.zero	51
	.zero	2

	/* #393 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555008
	/* java_name */
	.ascii	"mono/android/runtime/OutputStreamAdapter"
	.zero	42
	.zero	2

	/* #394 */
	/* module_index */
	.long	3
	/* type_token_id */
	.long	33554445
	/* java_name */
	.ascii	"mono/android/support/v4/app/FragmentManager_OnBackStackChangedListenerImplementor"
	.zero	1
	.zero	2

	/* #395 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554439
	/* java_name */
	.ascii	"mono/android/support/v4/view/ActionProvider_SubUiVisibilityListenerImplementor"
	.zero	4
	.zero	2

	/* #396 */
	/* module_index */
	.long	5
	/* type_token_id */
	.long	33554443
	/* java_name */
	.ascii	"mono/android/support/v4/view/ActionProvider_VisibilityListenerImplementor"
	.zero	9
	.zero	2

	/* #397 */
	/* module_index */
	.long	1
	/* type_token_id */
	.long	33554442
	/* java_name */
	.ascii	"mono/android/support/v4/widget/DrawerLayout_DrawerListenerImplementor"
	.zero	13
	.zero	2

	/* #398 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554469
	/* java_name */
	.ascii	"mono/android/support/v7/app/ActionBar_OnMenuVisibilityListenerImplementor"
	.zero	9
	.zero	2

	/* #399 */
	/* module_index */
	.long	0
	/* type_token_id */
	.long	33554457
	/* java_name */
	.ascii	"mono/android/support/v7/widget/Toolbar_OnMenuItemClickListenerImplementor"
	.zero	9
	.zero	2

	/* #400 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554689
	/* java_name */
	.ascii	"mono/android/view/View_OnClickListenerImplementor"
	.zero	33
	.zero	2

	/* #401 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554617
	/* java_name */
	.ascii	"mono/android/widget/AdapterView_OnItemClickListenerImplementor"
	.zero	20
	.zero	2

	/* #402 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554621
	/* java_name */
	.ascii	"mono/android/widget/AdapterView_OnItemLongClickListenerImplementor"
	.zero	16
	.zero	2

	/* #403 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554626
	/* java_name */
	.ascii	"mono/android/widget/AdapterView_OnItemSelectedListenerImplementor"
	.zero	17
	.zero	2

	/* #404 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554671
	/* java_name */
	.ascii	"mono/android/widget/SearchView_OnQueryTextListenerImplementor"
	.zero	21
	.zero	2

	/* #405 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554680
	/* java_name */
	.ascii	"mono/android/widget/SeekBar_OnSeekBarChangeListenerImplementor"
	.zero	20
	.zero	2

	/* #406 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33555096
	/* java_name */
	.ascii	"mono/java/lang/RunnableImplementor"
	.zero	48
	.zero	2

	/* #407 */
	/* module_index */
	.long	8
	/* type_token_id */
	.long	33554560
	/* java_name */
	.ascii	"xamarin/android/net/OldAndroidSSLSocketFactory"
	.zero	36
	.zero	2

	.size	map_java, 37536
/* Java to managed map: END */


/* java_name_width: START */
	.section	.rodata.java_name_width,"a",%progbits
	.type	java_name_width, %object
	.p2align	2
	.global	java_name_width
java_name_width:
	.size	java_name_width, 4
	.long	84
/* java_name_width: END */
