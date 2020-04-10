package maria;

import haxe.extern.EitherType;

/**
 * Connection options.
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/connection-options.md</i>
 * @author VolkovRA
 */
typedef ConnectionConfig =
{
	>UserConnectionConfig,
	>QueryConfig,
	
	/**
	 * The hostname of the database you are connecting to.
	 * Default: localhost
	 */
	@:optional var host:String;
	
	/**
	 * The port number to connect to.
	 * Default: 3306
	 */
	@:optional var port:Int;
	
	/**
	 * The path to a unix domain socket to connect to.
	 * When used host and port are ignored
	 */
	@:optional var socketPath:String;
	
	/**
	 * The milliseconds before a timeout occurs during the initial connection to the MySQL server.
	 * Default: 10000
	 */
	@:optional var connectTimeout:Int;
	
	/**
	 * Socket timeout in milliseconds after the connection is established.
	 * Default: 0
	 */
	@:optional var socketTimeout:Int;
	
	/**
	 * This will print all incoming and outgoing packets on stdout.
	 * Default: false
	 */
	@:optional var debug:Bool;
	
	/**
	 * This will print all incoming and outgoing compressed packets on stdout.
	 * Default: false
	 */
	@:optional var debugCompress:Bool;
	
	/**
	 * When debugging, maximum packet length to write to console.
	 * Default: 256
	 */
	@:optional var debugLen:Int;
	
	/**
	 * Adds the stack trace at the time of query creation to the error stack trace, making it easier to identify the part of the code that issued the query.
	 * Note: This feature is disabled by default due to the performance cost of stack creation. Only turn it on when you need to debug issues.
	 * 
	 * Default: false
	 */
	@:optional var trace:Bool;
	
	/**
	 * Allow multiple mysql statements per query. Be careful with this, it exposes you to SQL injection attacks.
	 * Default: false
	 */
	@:optional var multipleStatements:Bool;
	
	/**
	 * Object with ssl parameters or a string containing name of ssl profile.
	 * For more information, see: https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/connection-options.md#ssl
	 * 
	 * Default: true
	 */
	@:optional var ssl:EitherType<Bool,SSLConfig>;
	
	/**
	 * Compress exchanges with database using gzip.
	 * This can give you better performance when accessing a database in a different location.
	 * 
	 * Default: false
	 */
	@:optional var compress:Bool;
	
	/**
	 * Debug option: Permit to save last exchanged packet.
	 * Error messages will display those last exchanged packet.
	 * 
	 * Default: false
	 */
	@:optional var logPackets:Bool;
	
	/**
	 * Force server version check by explicitly using SELECT VERSION(), not relying on server initial packet.
	 * Default: false
	 */
	@:optional var forceVersionCheck:Bool;
	
	/**
	 * Indicate to throw an exception if result-set will not contain some data due to having duplicate identifier.
	 * Default: true
	 */
	@:optional var checkDuplicate:Bool;
	
	/**
	 * When enabled, the update number corresponds to update rows.
	 * When disabled, it indicates the real rows changed.
	 * 
	 * Default: true
	 */
	@:optional var foundRows:Bool;
	
	/**
	 * When a connection is established, permit to execute commands before using connection.
	 * Default: array*
	 */
	@:optional var initSql:EitherType<String,Array<String>>;
	
	/**
	 * Permit to set session variables when connecting.
	 * Example: sessionVariables:{'idle_transaction_timeout':10000}.
	 */
	@:optional var sessionVariables:Dynamic;
}