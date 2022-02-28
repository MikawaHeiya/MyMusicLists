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

namespace MyMusicLists.Sources.Extra
{
    class Utility
    {
        public static string LinkStrings(IList<string> list, string begin, string end, string link)
        {
            if (list == null || list.Count == 0)
            {
                return $"{begin}{link}{end}";
            }

            var builder = new StringBuilder();
            for (var index = 0; index < list.Count - 1; ++index)
            {
                builder.Append(begin).Append(list[index]).Append(end).Append(link);
            }
            builder.Append(begin).Append(list[list.Count - 1]).Append(end);

            return builder.ToString();
        }
    }
}