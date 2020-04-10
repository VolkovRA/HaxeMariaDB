package maria;

/**
 * Connection information.
 * @author VolkovRA
 */
typedef ConnectionInfo =
{
	/**
	 * Server connection identifier value.
	 */
	var threadId(default, null):Null<Float>;
	
	/**
	 * Connection status flag.
	 * See: <i>https://mariadb.com/kb/en/library/ok_packet/#server-status-flag</i>.
	 */
	var status(default, null):ServerStatusFlag;
	
	/**
	 * Server version information.
	 */
	var serverVersion:ServerVersion;
	
	/**
	 * Server capabilities
	 * See: <i>https://mariadb.com/kb/en/library/connection/#capabilities</i>.
	 */
	var serverCapabilities(default, null):Capabilities;
}