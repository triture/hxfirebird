package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;
import hxfirebirdsql.tools.FirebirdDatetime;

class SQLVarTime extends SQLVar{

    public function new() {
        super();
    }

    override public function decode(data) {
        var ret = data.readUInt();

        if (!data.readInt()) {
            var d = FirebirdDatetime.fromTime(
                d.setMilliseconds(Math.floor(ret / 10) +
                d.getTimezoneOffset() * MsPerMinute)
            );
            return d;
        }
        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_sql_time);
    }
}
