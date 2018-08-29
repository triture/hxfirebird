package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;
import hxfirebirdsql.consts.Defaults;

class SQLVarText extends SQLVar {

    public function new() {

    }

    override public function decode(data) {
        var ret;

        if (this.subType > 1) {
            ret = data.readText(this.length, Defaults.DEFAULT_ENCODING);
        } else {
            ret = data.readBuffer(this.length);
        }

        if (!data.readInt()) {
            return ret;
        }

        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_text);
        blr.addWord(this.length);
    }
}
