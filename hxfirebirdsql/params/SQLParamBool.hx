package hxfirebirdsql.params;

import hxfirebirdsql.consts.Consts;

class SQLParamBool extends SQLParam {

    public function new(value) {
        super(value);
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_short);
        blr.addShort(0);
    }

    override public function encode(data) {
        if (this.value != null) {
            data.addInt(this.value ? 1 : 0);
            data.addInt(0);
        } else {
            data.addInt(0);
            data.addInt(1);
        }
    }

}
