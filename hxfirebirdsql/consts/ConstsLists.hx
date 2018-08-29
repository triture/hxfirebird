package hxfirebirdsql.consts;

@:enum
abstract ConstsLists(Array<Int>) {
    var DESCRIBE = [
        Consts.isc_info_sql_stmt_type,
        Consts.isc_info_sql_select,
        Consts.isc_info_sql_describe_vars,
        Consts.isc_info_sql_sqlda_seq,
        Consts.isc_info_sql_type,
        Consts.isc_info_sql_sub_type,
        Consts.isc_info_sql_scale,
        Consts.isc_info_sql_length,
        Consts.isc_info_sql_field,
        Consts.isc_info_sql_relation,
        //Consts.isc_info_sql_owner,
        Consts.isc_info_sql_alias,
        Consts.isc_info_sql_describe_end,
        Consts.isc_info_sql_bind,
        Consts.isc_info_sql_describe_vars,
        Consts.isc_info_sql_sqlda_seq,
        Consts.isc_info_sql_type,
        Consts.isc_info_sql_sub_type,
        Consts.isc_info_sql_scale,
        Consts.isc_info_sql_length,
        Consts.isc_info_sql_describe_end
    ];

    var ISOLATION_READ_UNCOMMITTED          = [
        Consts.isc_tpb_version3,
        Consts.isc_tpb_write,
        Consts.isc_tpb_wait,
        Consts.isc_tpb_read_committed,
        Consts.isc_tpb_rec_version
    ];

    var ISOLATION_READ_COMMITED             = [
        Consts.isc_tpb_version3,
        Consts.isc_tpb_write,
        Consts.isc_tpb_wait,
        Consts.isc_tpb_read_committed,
        Consts.isc_tpb_no_rec_version
    ];

    var ISOLATION_REPEATABLE_READ           = [
        Consts.isc_tpb_version3,
        Consts.isc_tpb_write,
        Consts.isc_tpb_wait,
        Consts.isc_tpb_concurrency
    ];

    var ISOLATION_SERIALIZABLE              = [
        Consts.isc_tpb_version3,
        Consts.isc_tpb_write,
        Consts.isc_tpb_wait,
        Consts.isc_tpb_consistency
    ];

    var ISOLATION_READ_COMMITED_READ_ONLY   = [
        Consts.isc_tpb_version3,
        Consts.isc_tpb_read,
        Consts.isc_tpb_wait,
        Consts.isc_tpb_read_committed,
        Consts.isc_tpb_no_rec_version
    ];

    var ScaleDivisor = [1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000,10000000000, 100000000000,1000000000000,10000000000000,100000000000000,1000000000000000];
}
