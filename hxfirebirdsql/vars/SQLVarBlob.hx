package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;

class SQLVarBlob extends SQLVarQuad {

    public function new() {
        super();
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_quad);
        blr.addShort(0);
    }
}