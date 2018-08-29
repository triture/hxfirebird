package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;

class SQLVarShort extends SQLVarInt{

    public function new() {
        super();
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_short);
        blr.addShort(this.scale);
    }
}
