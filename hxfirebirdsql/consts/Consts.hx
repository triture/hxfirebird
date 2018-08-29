package hxfirebirdsql.consts;

@:enum
abstract Consts(Int) {


    var MAX_BUFFER_SIZE = 8192;


    var op_void                   = 0;  // Packet has been voided
    var op_connect                = 1;  // Connect to remote server
    var op_exit                   = 2;  // Remote end has exitted
    var op_accept                 = 3;  // Server accepts connection
    var op_reject                 = 4;  // Server rejects connection
    var op_disconnect             = 6;  // Connect is going away
    var op_response               = 9;  // Generic response block

        // Full context server operations

    var op_attach                 = 19; // Attach database
    var op_create                 = 20; // Create database
    var op_detach                 = 21; // Detach database
    var op_compile                = 22; // Request based operations
    var op_start                  = 23;
    var op_start_and_send         = 24;
    var op_send                   = 25;
    var op_receive                = 26;
    var op_unwind                 = 27; // apparently unused, see protocol.cpp's case op_unwind
    var op_release                = 28;

    var op_transaction            = 29; // Transaction operations
    var op_commit                 = 30;
    var op_rollback               = 31;
    var op_prepare                = 32;
    var op_reconnect              = 33;

    var op_create_blob            = 34; // Blob operations
    var op_open_blob              = 35;
    var op_get_segment            = 36;
    var op_put_segment            = 37;
    var op_cancel_blob            = 38;
    var op_close_blob             = 39;

    var op_info_database          = 40; // Information services
    var op_info_request           = 41;
    var op_info_transaction       = 42;
    var op_info_blob              = 43;

    var op_batch_segments         = 44; // Put a bunch of blob segments

    var op_que_events             = 48; // Que event notification request
    var op_cancel_events          = 49; // Cancel event notification request
    var op_commit_retaining       = 50; // Commit retaining (what else)
    var op_prepare2               = 51; // Message form of prepare
    var op_event                  = 52; // Completed event request (asynchronous)
    var op_connect_request        = 53; // Request to establish connection
    var op_aux_connect            = 54; // Establish auxiliary connection
    var op_ddl                    = 55; // DDL call
    var op_open_blob2             = 56;
    var op_create_blob2           = 57;
    var op_get_slice              = 58;
    var op_put_slice              = 59;
    var op_slice                  = 60; // Successful response to op_get_slice
    var op_seek_blob              = 61; // Blob seek operation

    // DSQL operations

    var op_allocate_statement     = 62; // allocate a statment handle
    var op_execute                = 63; // execute a prepared statement
    var op_exec_immediate         = 64; // execute a statement
    var op_fetch                  = 65; // fetch a record
    var op_fetch_response         = 66; // response for record fetch
    var op_free_statement         = 67; // free a statement
    var op_prepare_statement      = 68; // prepare a statement
    var op_set_cursor             = 69; // set a cursor name
    var op_info_sql               = 70;

    var op_dummy                  = 71; // dummy packet to detect loss of client
    var op_response_piggyback     = 72; // response block for piggybacked messages
    var op_start_and_receive      = 73;
    var op_start_send_and_receive = 74;
    var op_exec_immediate2        = 75; // execute an immediate statement with msgs
    var op_execute2               = 76; // execute a statement with msgs
    var op_insert                 = 77;
    var op_sql_response           = 78; // response from execute, exec immed, insert
    var op_transact               = 79;
    var op_transact_response      = 80;
    var op_drop_database          = 81;
    var op_service_attach         = 82;
    var op_service_detach         = 83;
    var op_service_info           = 84;
    var op_service_start          = 85;
    var op_rollback_retaining     = 86;
    var op_partial                = 89; // packet is not complete - delay processing
    var op_trusted_auth           = 90;
    var op_cancel                 = 91;
    var op_cont_auth              = 92;
    var op_ping                   = 93;
    var op_accept_data            = 94; // Server accepts connection and returns some data to client
    var op_abort_aux_connection   = 95; // Async operation - stop waiting for async connection to arrive
    var op_crypt                  = 96;
    var op_crypt_key_callback     = 97;
    var op_cond_accept            = 98; // Server accepts connection, returns some data to client
    // and asks client to continue authentication before attach call


    var CONNECT_VERSION2          = 2;
    var ARCHITECTURE_GENERIC      = 1;


    // Protocol 10 includes support for warnings and removes the requirement for
    // encoding and decoding status codes
    var PROTOCOL_VERSION10  = 10;

    // Since protocol 11 we must be separated from Borland Interbase.
    // Therefore always set highmost bit in protocol version to 1.
    // For unsigned protocol version this does not break version's compare.

    var FB_PROTOCOL_FLAG    = 0x8000;

    // Protocol 11 has support for user authentication related
    // operations (op_update_account_info, op_authenticate_user and
    // op_trusted_auth). When specific operation is not supported,
    // we say "sorry".

    var PROTOCOL_VERSION11  = (FB_PROTOCOL_FLAG | 11);

    // Protocol 12 has support for asynchronous call op_cancel.
    // Currently implemented asynchronously only for TCP/IP.

    var PROTOCOL_VERSION12  = (FB_PROTOCOL_FLAG | 12);

    // Protocol 13 has support for authentication plugins (op_cont_auth).

    var PROTOCOL_VERSION13  = (FB_PROTOCOL_FLAG | 13);



    var DSQL_close      = 1;
    var DSQL_drop       = 2;
    var DSQL_unprepare  = 4; // >= 2.5


    var ptype_batch_send = 3;


    var SQL_TEXT      = 452; // Array of char
    var SQL_VARYING   = 448;
    var SQL_SHORT     = 500;
    var SQL_LONG      = 496;
    var SQL_FLOAT     = 482;
    var SQL_DOUBLE    = 480;
    var SQL_D_FLOAT   = 530;
    var SQL_TIMESTAMP = 510;
    var SQL_BLOB      = 520;
    var SQL_ARRAY     = 540;
    var SQL_QUAD      = 550;
    var SQL_TYPE_TIME = 560;
    var SQL_TYPE_DATE = 570;
    var SQL_INT64     = 580;
    var SQL_BOOLEAN   = 32764; // >= 3.0
    var SQL_NULL      = 32766; // >= 2.5

    /***********************/
    /*   ISC Services      */
    /***********************/

    var isc_action_svc_backup = 1; /* Starts database backup process on the server	*/
    var isc_action_svc_restore = 2; /* Starts database restore process on the server */
    var isc_action_svc_repair = 3; /* Starts database repair process on the server	*/
    var isc_action_svc_add_user = 4; /* Adds	a new user to the security database	*/
    var isc_action_svc_delete_user = 5; /* Deletes a user record from the security database	*/
    var isc_action_svc_modify_user = 6; /* Modifies	a user record in the security database */
    var isc_action_svc_display_user = 7; /* Displays	a user record from the security	database */
    var isc_action_svc_properties = 8; /* Sets	database properties	*/
    var isc_action_svc_add_license = 9; /* Adds	a license to the license file */
    var isc_action_svc_remove_license = 10; /* Removes a license from the license file */
    var isc_action_svc_db_stats = 11; /* Retrieves database statistics */
    var isc_action_svc_get_ib_log = 12; /* Retrieves the InterBase log file	from the server	*/
    var isc_action_svc_get_fb_log = isc_action_svc_get_ib_log; /* Retrieves the Firebird log file	from the server	*/
    var isc_action_svc_nbak = 20; /* start nbackup */
    var isc_action_svc_nrest = 21;  /* start nrestore */
    var isc_action_svc_trace_start = 22;
    var isc_action_svc_trace_stop = 23;
    var isc_action_svc_trace_suspend = 24;
    var isc_action_svc_trace_resume = 25;
    var isc_action_svc_trace_list = 26;


    var isc_info_svc_svr_db_info = 50; /* Retrieves the number	of attachments and databases */
    var isc_info_svc_get_license = 51; /* Retrieves all license keys and IDs from the license file	*/
    var isc_info_svc_get_license_mask = 52; /* Retrieves a bitmask representing	licensed options on	the	server */
    var isc_info_svc_get_config = 53; /* Retrieves the parameters	and	values for IB_CONFIG */
    var isc_info_svc_version = 54; /* Retrieves the version of	the	services manager */
    var isc_info_svc_server_version = 55; /* Retrieves the version of	the	InterBase server */
    var isc_info_svc_implementation = 56; /* Retrieves the implementation	of the InterBase server	*/
    var isc_info_svc_capabilities = 57; /* Retrieves a bitmask representing	the	server's capabilities */
    var isc_info_svc_user_dbpath = 58; /* Retrieves the path to the security database in use by the server	*/
    var isc_info_svc_get_env = 59; /* Retrieves the setting of	$INTERBASE */
    var isc_info_svc_get_env_lock = 60; /* Retrieves the setting of	$INTERBASE_LCK */
    var isc_info_svc_get_env_msg = 61; /* Retrieves the setting of	$INTERBASE_MSG */
    var isc_info_svc_line = 62; /* Retrieves 1 line	of service output per call */
    var isc_info_svc_to_eof = 63; /* Retrieves as much of	the	server output as will fit in the supplied buffer */
    var isc_info_svc_timeout = 64; /* Sets	/ signifies	a timeout value	for	reading	service	information	*/
    var isc_info_svc_get_licensed_users = 65; /* Retrieves the number	of users licensed for accessing	the	server */
    var isc_info_svc_limbo_trans = 66; /* Retrieve	the	limbo transactions */
    var isc_info_svc_running = 67; /* Checks to see if	a service is running on	an attachment */
    var isc_info_svc_get_users = 68; /* Returns the user	information	from isc_action_svc_display_users */
    var isc_info_svc_stdin = 78;

    /* Services Properties */

    var isc_spb_prp_page_buffers = 5;
    var isc_spb_prp_sweep_interval = 6;
    var isc_spb_prp_shutdown_db = 7;
    var isc_spb_prp_deny_new_attachments = 9;
    var isc_spb_prp_deny_new_transactions = 10;
    var isc_spb_prp_reserve_space = 11;
    var isc_spb_prp_write_mode = 12;
    var isc_spb_prp_access_mode = 13;
    var isc_spb_prp_set_sql_dialect = 14;
    var isc_spb_num_att = 5;
    var isc_spb_num_db = 6;
    // SHUTDOWN OPTION FOR 2.0
    var isc_spb_prp_force_shutdown = 41;
    var isc_spb_prp_attachments_shutdown = 42;
    var isc_spb_prp_transactions_shutdown = 43;
    var isc_spb_prp_shutdown_mode = 44;
    var isc_spb_prp_online_mode = 45;

    var isc_spb_prp_sm_normal = 0;
    var isc_spb_prp_sm_multi = 1;
    var isc_spb_prp_sm_single = 2;
    var isc_spb_prp_sm_full = 3;


    // WRITE_MODE_PARAMETERS
    var isc_spb_prp_wm_async = 37;
    var isc_spb_prp_wm_sync = 38;

    // ACCESS_MODE_PARAMETERS
    var isc_spb_prp_am_readonly = 39;
    var isc_spb_prp_am_readwrite = 40;

    // RESERVE_SPACE_PARAMETERS
    var isc_spb_prp_res_use_full = 35;
    var isc_spb_prp_res = 36;

    // Option Flags
    var isc_spb_prp_activate = 0x0100;
    var isc_spb_prp_db_online = 0x0200;

    // SHUTDOWN MODE

    /* · Backup Service ·*/

    var isc_spb_bkp_file = 5;
    var isc_spb_bkp_factor = 6;
    var isc_spb_bkp_length = 7;
    var isc_spb_bkp_ignore_checksums = 0x01;
    var isc_spb_bkp_ignore_limbo = 0x02;
    var isc_spb_bkp_metadata_only = 0x04;
    var isc_spb_bkp_no_garbage_collect = 0x08;
    var isc_spb_bkp_old_descriptions = 0x10;
    var isc_spb_bkp_non_transportable = 0x20;
    var isc_spb_bkp_convert = 0x40;
    var isc_spb_bkp_expand = 0x80;
    var isc_spb_bkp_no_triggers = 0x8000;
    // nbackup
    var isc_spb_nbk_level = 5;
    var isc_spb_nbk_file = 6;
    var isc_spb_nbk_direct = 7;
    var isc_spb_nbk_no_triggers = 0x01;

    /*	Restore Service ·*/

    var isc_spb_res_buffers = 9;
    var isc_spb_res_page_size = 10;
    var isc_spb_res_length = 11;
    var isc_spb_res_access_mode = 12;
    var isc_spb_res_fix_fss_data = 13;
    var isc_spb_res_fix_fss_metadata = 14;
    var isc_spb_res_am_readonly = isc_spb_prp_am_readonly;
    var isc_spb_res_am_readwrite = isc_spb_prp_am_readwrite;
    var isc_spb_res_deactivate_idx = 0x0100;
    var isc_spb_res_no_shadow = 0x0200;
    var isc_spb_res_no_validity = 0x0400;
    var isc_spb_res_one_at_a_time = 0x0800;
    var isc_spb_res_replace = 0x1000;
    var isc_spb_res_create = 0x2000;
    var isc_spb_res_use_all_space = 0x4000;


    /* · Repair Service ·*/

    var isc_spb_rpr_commit_trans = 15;
    var isc_spb_rpr_rollback_trans = 34;
    var isc_spb_rpr_recover_two_phase = 17;
    var isc_spb_tra_id = 18;
    var isc_spb_single_tra_id = 19;
    var isc_spb_multi_tra_id = 20;
    var isc_spb_tra_state = 21;
    var isc_spb_tra_state_limbo = 22;
    var isc_spb_tra_state_commit = 23;
    var isc_spb_tra_state_rollback = 24;
    var isc_spb_tra_state_unknown = 25;
    var isc_spb_tra_host_site = 26;
    var isc_spb_tra_remote_site = 27;
    var isc_spb_tra_db_path = 28;
    var isc_spb_tra_advise = 29;
    var isc_spb_tra_advise_commit = 30;
    var isc_spb_tra_advise_rollback = 31;
    var isc_spb_tra_advise_unknown = 33;
    var isc_spb_rpr_validate_db = 0x01;
    var isc_spb_rpr_sweep_db = 0x02;
    var isc_spb_rpr_mend_db = 0x04;
    var isc_spb_rpr_list_limbo_trans = 0x08;
    var isc_spb_rpr_check_db = 0x10;
    var isc_spb_rpr_ignore_checksum = 0x20;
    var isc_spb_rpr_kill_shadows = 0x40;
    var isc_spb_rpr_full = 0x80;
    var isc_spb_rpr_icu = 0x0800;

    /* · Security Service ·*/

    var isc_spb_sec_userid = 5;
    var isc_spb_sec_groupid = 6;
    var isc_spb_sec_username = 7;
    var isc_spb_sec_password = 8;
    var isc_spb_sec_groupname = 9;
    var isc_spb_sec_firstname = 10;
    var isc_spb_sec_middlename = 11;
    var isc_spb_sec_lastname = 12;
    var isc_spb_sec_admin = 13;

    /* License Service */

    var isc_spb_lic_key = 5;
    var isc_spb_lic_id = 6;
    var isc_spb_lic_desc = 7;

    /* Statistics Service */

    var isc_spb_sts_data_pages = 0x01;
    var isc_spb_sts_db_log = 0x02;
    var isc_spb_sts_hdr_pages = 0x04;
    var isc_spb_sts_idx_pages = 0x08;
    var isc_spb_sts_sys_relations = 0x10;
    var isc_spb_sts_record_versions = 0x20;
    var isc_spb_sts_table = 0x40;
    var isc_spb_sts_nocreation = 0x80;

    /* Trace Service */

    var isc_spb_trc_id = 1;
    var isc_spb_trc_name = 2;
    var isc_spb_trc_cfg = 3;


    /***********************/
    /*   ISC Error Codes   */
    /***********************/

    var isc_arg_end                     = 0;  // end of argument list
    var isc_arg_gds                     = 1;  // generic DSRI status value
    var isc_arg_string                  = 2;  // string argument
    var isc_arg_cstring                 = 3;  // count & string argument
    var isc_arg_number                  = 4;  // numeric argument (long)
    var isc_arg_interpreted             = 5;  // interpreted status code (string)
    var isc_arg_unix                    = 7;  // UNIX error code
    var isc_arg_next_mach               = 15; // NeXT/Mach error code
    var isc_arg_win32                   = 17; // Win32 error code
    var isc_arg_warning                 = 18; // warning argument
    var isc_arg_sql_state               = 19; // SQLSTATE


    isc_sqlerr = 335544436;

    /**********************************/
    /* Database parameter block stuff */
    /**********************************/

    var isc_dpb_version1                = 1;
    var isc_dpb_version2                = 2; // >= FB30
    var isc_dpb_cdd_pathname            = 1;
    var isc_dpb_allocation              = 2;
    var isc_dpb_journal                 = 3;
    var isc_dpb_page_size               = 4;
    var isc_dpb_num_buffers             = 5;
    var isc_dpb_buffer_length           = 6;
    var isc_dpb_debug                   = 7;
    var isc_dpb_garbage_collect         = 8;
    var isc_dpb_verify                  = 9;
    var isc_dpb_sweep                   = 10;
    var isc_dpb_enable_journal          = 11;
    var isc_dpb_disable_journal         = 12;
    var isc_dpb_dbkey_scope             = 13;
    var isc_dpb_number_of_users         = 14;
    var isc_dpb_trace                   = 15;
    var isc_dpb_no_garbage_collect      = 16;
    var isc_dpb_damaged                 = 17;
    var isc_dpb_license                 = 18;
    var isc_dpb_sys_user_name           = 19;
    var isc_dpb_encrypt_key             = 20;
    var isc_dpb_activate_shadow         = 21;
    var isc_dpb_sweep_interval          = 22;
    var isc_dpb_delete_shadow           = 23;
    var isc_dpb_force_write             = 24;
    var isc_dpb_begin_log               = 25;
    var isc_dpb_quit_log                = 26;
    var isc_dpb_no_reserve              = 27;
    var isc_dpb_user_name               = 28;
    var isc_dpb_password                = 29;
    var isc_dpb_password_enc            = 30;
    var isc_dpb_sys_user_name_enc       = 31;
    var isc_dpb_interp                  = 32;
    var isc_dpb_online_dump             = 33;
    var isc_dpb_old_file_size           = 34;
    var isc_dpb_old_num_files           = 35;
    var isc_dpb_old_file                = 36;
    var isc_dpb_old_start_page          = 37;
    var isc_dpb_old_start_seqno         = 38;
    var isc_dpb_old_start_file          = 39;
    var isc_dpb_old_dump_id             = 41;
    var isc_dpb_lc_messages             = 47;
    var isc_dpb_lc_ctype                = 48;
    var isc_dpb_cache_manager           = 49;
    var isc_dpb_shutdown                = 50;
    var isc_dpb_online                  = 51;
    var isc_dpb_shutdown_delay          = 52;
    var isc_dpb_reserved                = 53;
    var isc_dpb_overwrite               = 54;
    var isc_dpb_sec_attach              = 55;
    var isc_dpb_connect_timeout         = 57;
    var isc_dpb_dummy_packet_interval   = 58;
    var isc_dpb_gbak_attach             = 59;
    var isc_dpb_sql_role_name           = 60;
    var isc_dpb_set_page_buffers        = 61;
    var isc_dpb_working_directory       = 62;
    var isc_dpb_sql_dialect             = 63;
    var isc_dpb_set_db_readonly         = 64;
    var isc_dpb_set_db_sql_dialect      = 65;
    var isc_dpb_gfix_attach             = 66;
    var isc_dpb_gstat_attach            = 67;
    var isc_dpb_set_db_charset          = 68;
    var isc_dpb_gsec_attach             = 69;
    var isc_dpb_address_path            = 70;
    var isc_dpb_process_id              = 71;
    var isc_dpb_no_db_triggers          = 72;
    var isc_dpb_trusted_auth            = 73;
    var isc_dpb_process_name            = 74;
    var isc_dpb_trusted_role            = 75;
    var isc_dpb_org_filename            = 76;
    var isc_dpb_utf8_filename           = 77;
    var isc_dpb_ext_call_depth          = 78;

    /*************************************/
    /* Services parameter block stuff    */
    /*************************************/

    var isc_spb_version1 = 1;
    var isc_spb_current_version = 2;
    var isc_spb_version = isc_spb_current_version;
    var isc_spb_user_name = isc_dpb_user_name;
    var isc_spb_sys_user_name = isc_dpb_sys_user_name;
    var isc_spb_sys_user_name_enc = isc_dpb_sys_user_name_enc;
    var isc_spb_password = isc_dpb_password;
    var isc_spb_password_enc = isc_dpb_password_enc;
    var isc_spb_command_line = 105;
    var isc_spb_dbname = 106;
    var isc_spb_verbose = 107;
    var isc_spb_options = 108;

    /*************************************/
    /* Transaction parameter block stuff */
    /*************************************/

    var isc_tpb_version1                =  1;
    var isc_tpb_version3                =  3;
    var isc_tpb_consistency             =  1;
    var isc_tpb_concurrency             =  2;
    var isc_tpb_shared                  =  3; // < FB21
    var isc_tpb_protected               =  4; // < FB21
    var isc_tpb_exclusive               =  5; // < FB21
    var isc_tpb_wait                    =  6;
    var isc_tpb_nowait                  =  7;
    var isc_tpb_read                    =  8;
    var isc_tpb_write                   =  9;
    var isc_tpb_lock_read               =  10;
    var isc_tpb_lock_write              =  11;
    var isc_tpb_verb_time               =  12;
    var isc_tpb_commit_time             =  13;
    var isc_tpb_ignore_limbo            =  14;
    var isc_tpb_read_committed          =  15;
    var isc_tpb_autocommit              =  16;
    var isc_tpb_rec_version             =  17;
    var isc_tpb_no_rec_version          =  18;
    var isc_tpb_restart_requests        =  19;
    var isc_tpb_no_auto_undo            =  20;
    var isc_tpb_lock_timeout            =  21; // >= FB20

    /****************************/
    /* Common, structural codes */
    /****************************/

    var isc_info_end                    = 1;
    var isc_info_truncated              = 2;
    var isc_info_error                  = 3;
    var isc_info_data_not_ready         = 4;
    var isc_info_length                 = 126;
    var isc_info_flag_end               = 127;

    /*************************/
    /* SQL information items */
    /*************************/

    var isc_info_sql_select             = 4;
    var isc_info_sql_bind               = 5;
    var isc_info_sql_num_variables      = 6;
    var isc_info_sql_describe_vars      = 7;
    var isc_info_sql_describe_end       = 8;
    var isc_info_sql_sqlda_seq          = 9;
    var isc_info_sql_message_seq        = 10;
    var isc_info_sql_type               = 11;
    var isc_info_sql_sub_type           = 12;
    var isc_info_sql_scale              = 13;
    var isc_info_sql_length             = 14;
    var isc_info_sql_null_ind           = 15;
    var isc_info_sql_field              = 16;
    var isc_info_sql_relation           = 17;
    var isc_info_sql_owner              = 18;
    var isc_info_sql_alias              = 19;
    var isc_info_sql_sqlda_start        = 20;
    var isc_info_sql_stmt_type          = 21;
    var isc_info_sql_get_plan           = 22;
    var isc_info_sql_records            = 23;
    var isc_info_sql_batch_fetch        = 24;
    var isc_info_sql_relation_alias     = 25; // >= 2.0
    var isc_info_sql_explain_plan       = 26; // >= 3.0

    /*******************/
    /* Blr definitions */
    /*******************/

    var blr_text            = 14;
    var blr_text2           = 15;
    var blr_short           = 7;
    var blr_long            = 8;
    var blr_quad            = 9;
    var blr_float           = 10;
    var blr_double          = 27;
    var blr_d_float         = 11;
    var blr_timestamp       = 35;
    var blr_varying         = 37;
    var blr_varying2        = 38;
    var blr_blob            = 261;
    var blr_cstring         = 40;
    var blr_cstring2        = 41;
    var blr_blob_id         = 45;
    var blr_sql_date        = 12;
    var blr_sql_time        = 13;
    var blr_int64           = 16;
    var blr_blob2           = 17; // >= 2.0
    var blr_domain_name     = 18; // >= 2.1
    var blr_domain_name2    = 19; // >= 2.1
    var blr_not_nullable    = 20; // >= 2.1
    var blr_column_name     = 21; // >= 2.5
    var blr_column_name2    = 22; // >= 2.5
    var blr_bool            = 23; // >= 3.0

    var blr_version4        = 4;
    var blr_version5        = 5; // dialect 3
    var blr_eoc             = 76;
    var blr_end             = 255;

    var blr_assignment      = 1;
    var blr_begin           = 2;
    var blr_dcl_variable    = 3;
    var blr_message         = 4;


    var isc_info_sql_stmt_select          = 1;
    var isc_info_sql_stmt_insert          = 2;
    var isc_info_sql_stmt_update          = 3;
    var isc_info_sql_stmt_delete          = 4;
    var isc_info_sql_stmt_ddl             = 5;
    var isc_info_sql_stmt_get_segment     = 6;
    var isc_info_sql_stmt_put_segment     = 7;
    var isc_info_sql_stmt_exec_procedure  = 8;
    var isc_info_sql_stmt_start_trans     = 9;
    var isc_info_sql_stmt_commit          = 10;
    var isc_info_sql_stmt_rollback        = 11;
    var isc_info_sql_stmt_select_for_upd  = 12;
    var isc_info_sql_stmt_set_generator   = 13;
    var isc_info_sql_stmt_savepoint       = 14;


    var isc_blob_text = 1;

    var MAX_INT = Math.floor(Math.pow(2, 31) - 1);
    var MIN_INT = - Math.floor(Math.pow(2, 31));

    var DateOffset = 40587;
    var TimeCoeff = 86400000;
    var MsPerMinute = 60000;
}
