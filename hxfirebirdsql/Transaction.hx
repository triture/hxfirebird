package hxfirebirdsql;

import hxfirebirdsql.consts.Consts;
import Reflect;

class Transaction {

    public var connection;
    public var db;

    public function new(connection) {
        this.connection = connection;
        this.db = connection.db;
    }

    public function newStatement(query, callback) {
        var cnx = this.connection;
        var self = this;
        var query_cache = cnx.getCachedQuery(query);

        if (query_cache) {
            callback(null, query_cache);
        } else {
            cnx.allocateStatement(
                function (err, statement) {
                    if (err) {
                        doError(err, callback);
                        return;
                    }

                    cnx.prepareStatement(self, statement, query, false, callback);
                }
            );
        }
    }

    public function execute(query, params, callback, custom) {

        if (Reflect.isFunction(params)) {
            callback = params;
            params = null;
        }

        var self = this;

        this.newStatement(
            query,
            function(err, statement) {

                if (err) {
                    doError(err, callback);
                    return;
                }

                var dropError = function(err) {
                    statement.release();
                    doCallback(err, callback);
                }

                statement.execute(
                    self,
                    params,
                    function(err) {
                        if (err) {
                            dropError(err);
                            return;
                        }

                        switch (statement.type) {
                            case Consts.isc_info_sql_stmt_select : {
                                statement.fetchAll(
                                    self,
                                    function(err, ret) {

                                        if (err) {
                                            dropError(err);
                                            return;
                                        }

                                        statement.release();

                                        if (callback) callback(null, ret, statement.output, true);

                                    }
                                );
                            }


                            case Consts.isc_info_sql_stmt_exec_procedure: {
                                if (statement.output.length) {
                                    statement.fetch(
                                        self,
                                        1,
                                        function(err, ret) {
                                            if (err) {
                                                dropError(err);
                                                return;
                                            }

                                            statement.release();

                                            if (callback) callback(null, ret.data[0], statement.output, false);
                                        }
                                    );
                                }
                            }

                            case _ : {
                                statement.release();
                                if (callback) callback();
                            }
                        }
                    },
                    custom
                );
            }
        );
    }

    public function query(query, params, callback) {

        if (Reflect.isFunction(params)) {
            callback = params;
            params = null;
        }

        if (callback == null) callback = noop;

        this.execute(
            query,
            params,
            callback,
            {
                asObject: true,
                asStream: callback == null || callback == null
            }
        );
    }

    public function commit(callback) {
        this.connection.commit(this, callback);
    }

    public function rollback(callback) {
        this.connection.rollback(this, callback);
    }

    public function commitRetaining(callback) {
        this.connection.commitRetaining(this, callback);
    }

    public function rollbackRetaining(callback) {
        this.connection.rollbackRetaining(this, callback);
    }
}
