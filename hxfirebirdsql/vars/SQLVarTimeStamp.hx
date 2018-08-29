package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;
import hxfirebirdsql.tools.FirebirdDatetime;

class SQLVarTimeStamp extends SQLVar{

    public function new() {
        super();
    }

    override public function decode(data) {
        var date = data.readInt();
        var time = data.readUInt();

        if (!data.readInt()) {

            var d = FirebirdDatetime.fromTime(
                (date - DateOffset) * TimeCoeff +
                Math.floor(time / 10) +
                d.getTimezoneOffset() * MsPerMinute
            );

            return d;
        }

        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_timestamp);
    }
}
