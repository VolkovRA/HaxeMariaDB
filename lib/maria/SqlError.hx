package maria;

/**
 * MariaDB SQL Error.
 * In addition to the standard properties, this object has the following properties:
 *   1. fatal: A boolean value indicating whether the connection remains valid.
 *   2. errno: The error number.
 *   3. sqlState: The SQL state code.
 *   4. code: The error code.
 * 
 * Errors contain an error stack, query and parameter values (the length of which is limited to 1,024 characters, by default).
 * To retrieve the initial stack trace (shown as From event... in the example above), you must have the Connection option trace enabled.
 * 
 * For more information on error numbers and SQL state signification, see the MariaDB Error Code documentation:
 * <i>https://mariadb.com/kb/en/library/mariadb-error-codes/</i>
 * 
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#error</i>
 * 
 * @author VolkovRA
 */
extern class SqlError extends js.lib.Error
{
	/**
	 * Error message.
	 * Either a MySQL server error (e.g. 'ER_ACCESS_DENIED_ERROR'), a node.js error (e.g. 'ECONNREFUSED') or an internalerror (e.g. 'PROTOCOL_CONNECTION_LOST').
	 * Example: 'ER_NO_SUCH_TABLE'.
	 */
	public var code:Null<String>;
	
	/**
	 * The error code number.
	 * Example: 1146.
	 */
	public var errno:ErrorCode;
	
	/**
	 * The SQL state code.
	 * Example: '42S02'.
	 */
	@:optional public var sqlState:Null<String>;
	
	/**
	 * A boolean value indicating whether the connection remains valid.
	 * Example: false.
	 */
	public var fatal:Bool;
}