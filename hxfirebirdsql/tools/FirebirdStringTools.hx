package hxfirebirdsql.tools;

import datetime.DateTime;

using StringTools;

class FirebirdStringTools {

    inline public static function padLeft(value:String, max:Int, c:String):String {
        return new Array<String>(Math.max(0, max - value.length + 1)).join(c || ' ') + value;
    }

//    public static function parseDate(value:String):DateTime {
//        var self:String = value.trim();
//
//        var arr:Array<Null<String>> = self.indexOf(' ') == -1 ? self.split('T') : self.split(' ');
//        var index:Int = arr[0].indexOf(':');
//        var length:Int = arr[0].length;
//
//        if (arr.length == 0) arr.push(null);
//        if (arr.length == 1) arr.push(null);
//
//        if (index != -1) {
//            var tmp:Null<String> = arr[1];
//
//            arr[1] = arr[0];
//            arr[0] = tmp;
//        }
//
//        if (arr[0] == null) arr[0] = '';
//
//        var noTime:Bool = arr[1] == null ? true : arr[1].length == 0;
//
//        for (i in 0 ... length) {
//            var c:String = arr[0].charCodeAt(i);
//
//            if (c > 47 && c < 58) continue;
//            if (c == 45 || c == 46) continue;
//
//            if (noTime) return new DateTime(self);
//        }
//
//        if (arr[1] == null) arr[1] = '00:00:00';
//
//        var firstDay:Bool = arr[0].indexOf('-') == -1;
//
//        var date:Array<String> = (arr[0] == null ? "" : arr[0]).split(firstDay ? '.' : '-');
//        var time:Array<String> = (arr[1] == null ? '' : arr[1]).split(':');
//        var parsed:Array<String> = [];
//
//        if (date.length < 4 && time.length < 2)
//        return new DateTime(self);
//
//        index = (time[2] || '').indexOf('.');
//
//            // milliseconds
//        if (index !== -1) {
//        time[3] = time[2].substring(index + 1);
//        time[2] = time[2].substring(0, index);
//        } else
//        time[3] = '0';
//
//        parsed.push(parseInt(date[firstDay ? 2 : 0], 10)); // year
//        parsed.push(parseInt(date[1], 10)); // month
//        parsed.push(parseInt(date[firstDay ? 0 : 2], 10)); // day
//        parsed.push(parseInt(time[0], 10)); // hours
//        parsed.push(parseInt(time[1], 10)); // minutes
//        parsed.push(parseInt(time[2], 10)); // seconds
//        parsed.push(parseInt(time[3], 10)); // miliseconds
//
//        var def = new Date();
//
//        for (var i = 0, length = parsed.length; i < length; i++) {
//        if (isNaN(parsed[i]))
//        parsed[i] = 0;
//
//        var value = parsed[i];
//        if (value !== 0)
//        continue;
//
//        switch (i) {
//        case 0:
//        if (value <= 0)
//        parsed[i] = def.getFullYear();
//        break;
//        case 1:
//        if (value <= 0)
//        parsed[i] = def.getMonth() + 1;
//        break;
//        case 2:
//        if (value <= 0)
//        parsed[i] = def.getDate();
//        break;
//        }
//        }
//
//        return new Date(parsed[0], parsed[1] - 1, parsed[2], parsed[3], parsed[4], parsed[5]);
//    }
}
