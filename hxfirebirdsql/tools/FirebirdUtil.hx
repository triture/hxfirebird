package hxfirebirdsql.tools;

using StringTools;
using hxfirebirdsql.tools.FirebirdStringTools;

class FirebirdUtil {

    public static function escape(value:Dynamic):String {

        if (value == null) return 'NULL';

        if (Std.is(value, Bool)) return value ? '1' : '0';
        else if (Std.is(value, Int) || Std.is(value, Float)) return Std.string(value);
        else if (Std.is(value, String)) return "'" + Std.string(value).replace("'", "''").replace("\\", "\\\\") + "'";
        else if (Std.is(value, Date)) {
            var date:Date = cast value;
            return "'" +
                date.getFullYear() + "-" +
                Std.string(date.getMonth() + 1).padLeft(2, '0') + "-" +
                Std.string(date.getDate()).padLeft(2, '0') + " " +
                Std.string(date.getHours()).padLeft(2, '0') + ":" +
                Std.string(date.getMinutes()).padLeft(2, '0') + ":" +
                Std.string(date.getSeconds()).padLeft(2, '0') + "." +
                '000' + "'";
        } else if (Std.is(value, FirebirdDatetime)) {
            var date:FirebirdDatetime = cast value;
            return "'" +
                date.getFullYear() + "-" +
                Std.string(date.getMonth() + 1).padLeft(2, '0') + "-" +
                Std.string(date.getDate()).padLeft(2, '0') + " " +
                Std.string(date.getHours()).padLeft(2, '0') + ":" +
                Std.string(date.getMinutes()).padLeft(2, '0') + ":" +
                Std.string(date.getSeconds()).padLeft(2, '0') + "." +
                '000' + "'";
        } else {

            escape(Std.string(value));

        }
    };
}
