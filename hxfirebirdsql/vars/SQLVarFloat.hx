package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;

class SQLVarFloat extends SQLVar{

    public function new() {
        super();
    }

    override public function decode(data) {
        var ret = data.readFloat();

        if (!data.readInt()) {
            return ret;
        }

        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_float);
    }
}
