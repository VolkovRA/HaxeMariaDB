package maria;

/**
 * Server and Client have different capabilities, here is the possibles values.
 * Client with capabilities CLIENT_MYSQL + CONNECT_WITH_DB will have a value of 9 (1 + 8).
 * 
 * See more: <i>https://mariadb.com/kb/en/connection/#capabilities</i>
 * @author VolkovRA
 */
typedef Capabilities = Float;

/**
 * Capability.
 * @author VolkovRA
 */
@:enum abstract Capability(Capabilities) to Capabilities
{
	var CLIENT_MYSQL						= 1;
	
	var FOUND_ROWS							= 2;
	
	/// One can specify db on connect.
	var CONNECT_WITH_DB						= 8;
	
	/// Can use compression protocol.
	var COMPRESS							= 16;
	
	/// Can use LOAD DATA LOCAL.
	var LOCAL_FILES							= 128;
	
	/// Ignore spaces before '('.
	var IGNORE_SPACE						= 256;
	
	/// 4.1 Protocol.
	var CLIENT_PROTOCOL_41					= 512;
	
	var CLIENT_INTERACTIVE					= 1024;
	
	/// Can use SSL.
	var SSL									= 2048‬;
	
	var TRANSACTIONS						= 4096;
	
	/// 4.1 Authentication.
	var SECURE_CONNECTION					= 8192‬;
	
	/// Enable/disable multi-stmt support.
	var MULTI_STATEMENTS					= 65536‬;
	
	/// Enable/disable multi-results.
	var MULTI_RESULTS						= 131072‬;
	
	/// Enable/disable multi-results for PrepareStatement.
	var PS_MULTI_RESULTS					= 262144‬;
	
	/// Client supports plugin authentication.
	var PLUGIN_AUTH							= 524288‬;
	
	/// Client send connection attributes.
	var CONNECT_ATTRS						= 1048576‬;
	
	/// Enable authentication response packet to be larger than 255 bytes.
	var PLUGIN_AUTH_LENENC_CLIENT_DATA		= 2097152‬;
	
	/// Enable/disable session tracking in OK_Packet.
	var CLIENT_SESSION_TRACK				= 8388608‬;
	
	/**
	 * EOF_Packet deprecation :
	 *   - OK_Packet replace EOF_Packet in end of Resulset when in text format
	 *   - EOF_Packet between columns definition and resultsetRows is deleted
	 */
	var CLIENT_DEPRECATE_EOF				= 16777216‬;
	
	/// Support zstd protocol compression.
	var CLIENT_ZSTD_COMPRESSION_ALGORITHM	= 67108864‬;
	
	/// Reserved for futur use. (Was CLIENT_PROGRESS Client support progress indicator before 10.2).
	var CLIENT_CAPABILITY_EXTENSION			= 536870912‬;
	
	/// Client support progress indicator (since 10.2).
	var MARIADB_CLIENT_PROGRESS				= 4294967296;
	
	/// Permit COM_MULTI protocol.
	var MARIADB_CLIENT_COM_MULTI			= 8589934592‬;
	
	/// Permit bulk insert.
	var MARIADB_CLIENT_STMT_BULK_OPERATIONS	= 17179869184;
}