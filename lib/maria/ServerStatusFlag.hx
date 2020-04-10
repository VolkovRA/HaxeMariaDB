package maria;

/**
 * Values of server status flag.
 * See more: <i>https://mariadb.com/kb/en/ok_packet/#server-status-flag</i>
 * @author VolkovRA
 */
@:enum abstract ServerStatusFlag(Int) to Int
{
	/// A transaction is currently active.
	var SERVER_STATUS_IN_TRANS				= 1;
	
	/// Autocommit mode is set.
	var SERVER_STATUS_AUTOCOMMIT			= 2;
	
	/// More results exists (more packet follow).
	var SERVER_MORE_RESULTS_EXISTS			= 8;
	
	var SERVER_QUERY_NO_GOOD_INDEX_USED		= 16;
	
	var SERVER_QUERY_NO_INDEX_USED			= 32;
	
	/// When using COM_STMT_FETCH, indicate that current cursor still has result.
	var SERVER_STATUS_CURSOR_EXISTS			= 64;
	
	/// When using COM_STMT_FETCH, indicate that current cursor has finished to send results.
	var SERVER_STATUS_LAST_ROW_SENT			= 128;
	
	/// Database has been dropped.
	var SERVER_STATUS_DB_DROPPED			= 256;
	
	/// Current escape mode is "no backslash escape".
	var SERVER_STATUS_NO_BACKSLASH_ESCAPES	= 512;
	
	/// A DDL change did have an impact on an existing PREPARE (an automatic reprepare has been executed).
	var SERVER_STATUS_METADATA_CHANGED		= 1024;
	
	var SERVER_QUERY_WAS_SLOW				= 2048;
	
	/// This resultset contain stored procedure output parameter.
	var SERVER_PS_OUT_PARAMS				= 4096;
	
	/// Current transaction is a read-only transaction.
	var SERVER_STATUS_IN_TRANS_READONLY		= 8192;
	
	/// Session state change. See Session change type for more information.
	var SERVER_SESSION_STATE_CHANGED		= 16384;
}