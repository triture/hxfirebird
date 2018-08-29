package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;
import hxfirebirdsql.consts.ConstsLists;

class SQLVarInt extends SQLVar{

    public function new() {
        super();
    }

    override public function decode(data) {
        var ret = data.readInt();

        if (!data.readInt()) {
            if (this.scale) {
                ret = ret / ConstsLists.ScaleDivisor[Math.abs(this.scale)];
            }

            return ret;
        }
        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_long);
        blr.addShort(this.scale);
    }
}
