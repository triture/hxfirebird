package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;
import hxfirebirdsql.consts.Defaults;

class SQLVarString extends SQLVar{

    public function new() {
        super();
    }

    override public function decode(data) {
        var ret;

        if (this.subType > 1) {
            ret = data.readString(Defaults.DEFAULT_ENCODING);
        } else {
            ret = data.readBuffer();
        }

        if (!data.readInt()) {
            return ret;
        }

        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_varying);
        blr.addWord(this.length);
    }
}
