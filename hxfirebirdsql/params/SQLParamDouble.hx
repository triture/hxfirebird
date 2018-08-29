package hxfirebirdsql.params;

import hxfirebirdsql.consts.Consts;

class SQLParamDouble extends SQLParam {

    public function new(value) {
        super(value);
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_double);
    }

    override public function encode(data) {
        if (this.value != null) {
            data.addDouble(this.value);
            data.addInt(0);
        } else {
            data.addDouble(0);
            data.addInt(1);
        }
    }

}
