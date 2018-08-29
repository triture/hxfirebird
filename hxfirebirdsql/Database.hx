package hxfirebirdsql;

import Reflect;
import hxfirebirdsql.tools.FirebirdUtil;
class Database {

    public var connection;

    public function new(connection) {
        this.connection = connection;
        this.connection.db = this;
    }


//    Database.prototype.__proto__ = Object.create(Events.EventEmitter.prototype, {
//    constructor: {
//    value: Database,
//    enumberable: false
//    }
//    });

    public function escape(value) return FirebirdUtil.escape(value);

    public function detach(callback, force) {

        var self = this;

        if (!force && self.connection._pending.length > 0) {
            self.connection._detachAuto = true;
            self.connection._detachCallback = callback;
            return self;
        }

        if (self.connection._pooled == false) {
            self.connection.detach(
                function (err, obj) {

                    self.connection.disconnect();
                    self.emit('detach', false);

                    if (callback) callback(err, obj);

                },
                force
            );
        } else {
            self.emit('detach', false);
            if (callback) callback();
        }

        return self;
    }

    public function transaction(isolation, callback) return this.startTransaction(isolation, callback);

    public function startTransaction(isolation, callback) {
        this.connection.startTransaction(isolation, callback);
        return this;
    }

    public function newStatement(query, callback) {
        this.startTransaction(
            function(err, transaction) {
                if (err) {
                    callback(err);
                    return;
                }

                transaction.newStatement(
                    query,
                    function(err, statement) {

                        if (err) {
                            callback(err);
                            return;
                        }

                        transaction.commit(
                            function(err) {
                                callback(err, statement);
                            }
                        );
                    }
                );
            }
        );

        return this;
    }

    public function execute(query, params, callback, custom) {

        if (Reflect.isFunction(params)) {
            callback = params;
            params = null;
        }

        var self = this;

        self.connection.startTransaction(
            function(err, transaction) {

                if (err) {
                    doError(err, callback);
                    return;
                }

                transaction.execute(
                    query,
                    params,
                    function(err, result, meta, isSelect) {
                        if (err) {

                            transaction.rollback(
                                function() {
                                doError(err, callback);
                                }
                            );

                            return;
                        }

                        transaction.commit(
                            function(err) {
                                if (callback) {
                                    callback(err, result, meta, isSelect);
                                }
                            }
                        );

                    },
                    custom
                );
            }
        );

        return self;
    }

    public function sequentially(query, params, on, callback, asArray) {

        if (Reflect.isFunction(params)) {
            asArray = callback;
            callback = on;
            on = params;
            params = null;
        }

        if (on === undefined)
            throw new Error('Expected "on" delegate.');

        var self = this;
        self.execute(
            query,
            params,
            callback,
            {
                asObject: !asArray,
                asStream: true,
                on: on
            }
        );

        return self;
    }

    public function query(query, params, callback) {

        if (Reflect.isFunction(params)) {
            callback = params;
            params = null;
        }

        var self = this;
        self.execute(
            query,
            params,
            callback,
            {
                asObject: true,
                asStream: callback == null || callback == null
            }
        );

        return self;
    }

}
