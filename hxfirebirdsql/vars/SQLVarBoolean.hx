package hxfirebirdsql.vars;

import hxfirebirdsql.consts.Consts;

class SQLVarBoolean extends SQLVar{

    public function new() {
        super();
    }

    override public function decode(data) {
        var ret = data.readInt();

        if (!data.readInt()) {
            var value:Bool = (ret == null || ret == 0 || ret == "" || ret == false) ? false : true;

            return value;
        }

        return null;
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_bool);
    }
}
