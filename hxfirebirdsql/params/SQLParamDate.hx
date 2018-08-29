package hxfirebirdsql.params;

import hxfirebirdsql.consts.Consts;

class SQLParamDate extends SQLParam {

    public function new(value) {
        super(value);
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_timestamp);
    }

    override public function encode(data) {
        if (this.value != null) {

            var value = this.value.getTime() - this.value.getTimezoneOffset() * MsPerMinute;
            var time = value % TimeCoeff;
            var date = (value - time) / TimeCoeff + DateOffset;
            time *= 10;

            // check overflow
            if (time < 0) {
                date--;
                time = Consts.TimeCoeff * 10 + time;
            }

            data.addInt(date);
            data.addUInt(time);
            data.addInt(0);
        } else {
            data.addInt(0);
            data.addUInt(0);
            data.addInt(1);
        }
    }

}
