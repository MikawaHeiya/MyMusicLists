# MyMusicLists
MyMusicLists是使用Xamarin开发的安卓平台音乐软件，它允许用户创建自定义的“歌单”以及基于不同“歌单”之上的“查询”。
## 如何运行此项目
下载此项目并使用VisualStudio打开MyMusicLists.sln，您可能需要为VisualStudio安装“使用.Net的移动开发”模块。
## 功能介绍
### 读取本地音乐并播放
MyMusicLists将自动读取“指定文件夹”内的mp3文件并加入到“全部音乐”中，用户可以从中选择并播放。  
当歌曲播放完毕后将根据播放模式自动选择下一首音乐，可供选择的模式有“随机播放”、“顺序播放”、“单曲循环”三种。  
“指定文件夹”可以在设置界面进行更改、添加以及删除。  
### 创建歌单
“歌单”是本地音乐的简单集合，歌单可以成为一个独立的播放列表，并且可以被命名。
### 创建查询
“歌单”只是简单的集合，可能难以满足用户在对音乐分类方面的需求，查询可以更好地满足这一需求。  
用户可以使用对数个“歌单”的简单运算创建一个查询，支持的运算有“+”、“-”、“\*”、“!”以及左右括号。  
其中，“+”为对两个歌单取并集，“-”表示取两个歌单的差，“\*”表示取两个歌单的交集，“!”表示取单个歌单的补集。  
例如查询 { （“中文” + “日语”） * “动漫” - “电音” } 将选择出“动漫”里的中文与日文且不是电音的音乐。 
