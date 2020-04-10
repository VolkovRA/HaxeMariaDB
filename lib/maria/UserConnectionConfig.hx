package maria;

import haxe.extern.EitherType;

/**
 * User connection options.
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/connection-options.md</i>
 * @author VolkovRA
 */
typedef UserConnectionConfig =
{
	/**
	 * Name of the database to use for this connection.
	 */
	@:optional var database:String;
	
	/**
	 * Sends information, (client name, version, operating system, Node.js version, and so on) to the Performance Schema.
	 * When enabled, sends information during connection to server
	 * - client name
	 * - version
	 * - operating system
	 * - Node.js version
	 *
	 * If JSON is set, add JSON key/value to those values.
	 * When Performance Schema is enabled, server can display client information on each connection.
	 * 
	 * Default: false
	 */
	@:optional var connectAttributes:EitherType<Bool,Dynamic>;
	
	/**
	 * Protocol character set used with the server.
	 * Connection collation will be the default collation associated with charset.
	 * It's mainly used for micro-optimizations. The default is often sufficient.
	 * 
	 * Default: UTF8MB4
	 */
	@:optional var charset:String;
	
	/**
	 * Permit to defined collation used for connection. (Used in replacement of charset)
	 * This will defined the charset encoding used for exchanges with database and defines the order used when comparing strings.
	 * It's mainly used for micro-optimizations.
	 * 
	 * Default: UTF8MB4_UNICODE_CI
	 */
	@:optional var collation:String;
	
	/**
	 * The MySQL user to authenticate as.
	 */
	@:optional var user:String;
	
	/**
	 * The password of database user.
	 */
	@:optional var password:String;
}