package hxfirebirdsql.vars;

import hxfirebirdsql.tools.FirebirdDatetime;
import hxfirebirdsql.consts.Consts;

class SQLVarDate extends SQLVar{

    public function new() {
        super();
    }

    override public function decode(data) {
        var ret = data.readInt();

        if (!data.readInt()) {

            var d = FirebirdDatetime.fromTime(
                (ret - DateOffset) * TimeCoeff +
                d.getTimezoneOffset() * Consts.MsPerMinute
            );

            return d;
        }
        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_sql_date);
    }
}
