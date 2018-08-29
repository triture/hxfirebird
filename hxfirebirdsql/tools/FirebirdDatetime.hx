package hxfirebirdsql.tools;

import datetime.DateTime;

class FirebirdDatetime {

    private var date:DateTime;

    public function new(year:Null<Int>=null, month:Int=0, day:Int=1, hour:Int=0, min:Int=0, sec:Int=0) {
        if (year == null) year = Date.now().getFullYear();

        this.date = DateTime.make(year, month + 1, day, hour, min, sec);
    }

    /**
		Returns the timestamp (in milliseconds) of the date. It might
		only have a per-second precision depending on the platforms.
	**/
    public function getTime() : Float return this.date.getTime();


    /**
		Returns the hours of `this` Date (0-23 range).
	**/
    public function getHours() : Int return this.date.getHour();

    /**
		Returns the minutes of `this` Date (0-59 range).
	**/
    public function getMinutes() : Int return this.date.getMinute();

    /**
		Returns the seconds of `this` Date (0-59 range).
	**/
    public function getSeconds() : Int return this.date.getSecond();

    /**
		Returns the full year of `this` Date (4-digits).
	**/
    public function getFullYear() : Int return this.date.getYear();

    /**
		Returns the month of `this` Date (0-11 range).
	**/
    public function getMonth() : Int return this.date.getMonth() - 1;

    /**
		Returns the day of `this` Date (1-31 range).
	**/
    public function getDate() : Int return this.date.getDate();

    /**
		Returns the day of the week of `this` Date (0-6 range) where `0` is Sunday.
	**/
    public function getDay() : Int return this.date.getDay();

    /**
		Returns a string representation of `this` Date, by using the
		standard format [YYYY-MM-DD HH:MM:SS]. See `DateTools.format` for
		other formating rules.
	**/
    public function toString():String return this.date.toString();

    /**
		Returns a DateTime representing the current local time.
	**/
    static public function now():FirebirdDatetime return fromDateTime(DateTime.now());

    /**
		Returns a DateTime from timestamp `t`.
	**/
    static public function fromTime( t : Float ):FirebirdDatetime return fromDateTime(DateTime.fromTime(t));

    /**
		Returns a Date from a formated string `s`, with the following accepted
		formats:

		- `"YYYY-MM-DD hh:mm:ss"`
		- `"YYYY-MM-DD"`
		- `"hh:mm:ss"`

		The first two formats are expressed in local time, the third in UTC
		Epoch.
	**/
    static public function fromString( s : String ):FirebirdDatetime return fromDateTime(DateTime.fromString(s));

    static private inline function fromDateTime(datetime:DateTime):FirebirdDatetime {
        var d:FirebirdDatetime = new FirebirdDatetime();
        d.date = datetime;
        return d;
    }
}
