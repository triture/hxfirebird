package hxfirebirdsql.params;

import hxfirebirdsql.consts.Consts;

class SQLParamInt extends SQLParam {

    public function new(value) {
        super(value);
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_long);
        blr.addShort(0);
    }

    override public function encode(data) {
        if (this.value != null) {
            data.addInt(this.value);
            data.addInt(0);
        } else {
            data.addInt(0);
            data.addInt(1);
        }
    }

}
