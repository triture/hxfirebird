package hxfirebirdsql;

class Statement {
    private var connection;

    public function new(connection) {
        this.connection = connection;
    }

    public function close(callback) {
        this.connection.closeStatement(this, callback);
    }

    public function drop(callback) {
        this.connection.dropStatement(this, callback);
    }

    public function release(callback) {
        var cache_query = this.connection.getCachedQuery(this.query);

        if (cache_query) this.connection.closeStatement(this, callback);
        else this.connection.dropStatement(this, callback);
    }

    public function execute(transaction, params, callback, custom) {

        if (Reflect.isFunction(params)) {
            custom = callback;
            callback = params;
            params = undefined;
        }

        this.custom = custom;
        this.connection.executeStatement(transaction, this, params, callback, custom);
    }

    public function fetch(transaction, count, callback) {
        this.connection.fetch(this, transaction, count, callback);
    }

    public function fetchAll(transaction, callback) {
        this.connection.fetchAll(this, transaction, callback);
    }

}
