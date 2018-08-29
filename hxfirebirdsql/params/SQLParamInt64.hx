package hxfirebirdsql.params;

import hxfirebirdsql.consts.Consts;

class SQLParamInt64 extends SQLParam {

    public function new(value) {
        super(value);
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_int64);
        blr.addShort(0);
    }

    override public function encode(data) {
        if (this.value != null) {
            data.addInt64(this.value);
            data.addInt(0);
        } else {
            data.addInt64(0);
            data.addInt(1);
        }
    }

}
