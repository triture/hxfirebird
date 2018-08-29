package hxfirebirdsql.params;

import hxfirebirdsql.consts.Defaults;
import hxfirebirdsql.consts.Consts;

class SQLParamString extends SQLParam {

    public function new(value) {
        super(value);
    }

    override public function calcBlr(blr) {
        blr.addByte(Consts.blr_text);

        var len = this.value ? Buffer.byteLength(this.value, Defaults.DEFAULT_ENCODING) : 0;
        blr.addWord(len);
    }

    override public function encode(data) {
        if (this.value != null) {
            data.addText(this.value, Defaults.DEFAULT_ENCODING);
            data.addInt(0);
        } else {
            data.addInt(1);
        }
    }

}
