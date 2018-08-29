package hxfirebirdsql.vars;

import hxfirebirdsql.consts.ConstsLists;
import hxfirebirdsql.consts.Consts;

class SQLVarInt64 extends SQLVar{

    public function new() {
        super();
    }

    override public function decode(data) {
        var ret = data.readInt64();

        if (!data.readInt()) {
            if (this.scale) {
                ret = ret / ConstsLists.ScaleDivisor[Math.abs(this.scale)];
            }
            return ret;
        }
        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_int64);
        blr.addShort(this.scale);
    }
}
