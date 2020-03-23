package maria;

import haxe.extern.EitherType;
import js.node.events.EventEmitter;

/**
 * Connection to database.
 * Used for execute queries.
 * 
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#connection-api</i>
 * @author VolkovRA
 */
extern class Connection extends EventEmitter<Connection>
{
	/**
	 * Connect to database.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#createconnectionoptions--connection</i>
	 * @param	callback Callback of connection is ready or failed.
	 */
	public function connect(callback:SqlError->Void):Void;
	
	/**
	 * Sends query to the database with a Callback function to call when done.
	 * In cases where the query returns huge result-sets, this means that all data is stored in memory.
	 * You may find it more practical to use the Query object to handle the rows one by one, to avoid overloading memory resources.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectionquerysql-values-callback---emitter</i>
	 * @param	sql SQL string or object to supersede default connection options.
	 * @param	values Placeholder values. Usually an array, but in cases of only one placeholder, it can be given as is.
	 * @param	callback Callback function with arguments: (error, results, metadata).
	 * @return	Returns an Emitter object that can emit four different types of event: maria.ConnectorEvent.
	 */
	public function query(sql:EitherType<String,QueryOptions>, ?values:EitherType<Array<Dynamic>,Dynamic>, ?callback:SqlError->Dynamic->FieldInfo->Void):Query;
	
	/**
	 * Implementation depend of server type and version.
	 * For MariaDB server version 10.2.7+, implementationuse dedicated bulk protocol. For other, insert queries will be rewritten
	 * for optimization. example: insert into ab (i) values (?) with firstbatch values = 1, second = 2 will be rewritten insert into ab (i) values (1), (2).
	 * 
	 * If query cannot be re-writen will execute a query for each values.
	 * Result difference compared to execute multiple single query insert is that only first generated insert id will be returned.
	 * 
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectionbatchsql-values--callback</i>
	 * @param	sql SQL string or object to supersede default connection options.
	 * @param	values Placeholder values. Usually an array, but in cases of only one placeholder, it can be given as is.
	 * @param	callback Callback function with arguments: (error, results, metadata).
	 */
	public function batch(sql:EitherType<String,QueryOptions>, ?values:EitherType<Array<Dynamic>,Dynamic>, ?callback:SqlError->Dynamic->FieldInfo->Void):Void;
	
	/**
	 * Begins a new transaction.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectionbegintransactioncallback</i>
	 * @param	callback Callback function with argument SqlError if any error.
	 */
	public function beginTransaction(callback:SqlError->Void):Void;
	
	/**
	 * Commits the current transaction, if there is one active.
	 * The Connector keeps track of the current transaction state on the server. When there isn't an
	 * active transaction, thismethod sends no commands to the server.
	 * 
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectioncommitcallback</i>
	 * @param	callback Callback function with argument SqlError if any error.
	 */
	public function commit(callback:SqlError->Void):Void;
	
	/**
	 * Rolls back the current transaction, if there is one active.
	 * The Connector keeps track of the current transaction state on the server.
	 * Where there isn't an active transaction, this method sends no commands to the server.
	 * 
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectionrollbackcallback</i>
	 * @param	callback Callback function with argument SqlError if any error.
	 */
	public function rollback(callback:SqlError->Void):Void;
	
	/**
	 * Resets the connection and re-authenticates with the given credentials.
	 * This is the equivalent of creating a new connection with a new user, reusing the existing open socket.
	 * 
	 * See: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectionchangeuseroptions-callback</i>
	 * @param	options Subset of connection option documentation: database, charset, password, user.
	 * @param	callback Callback function with argument SqlError if any error.
	 */
	public function changeUser(options:ConnectionConfig, callback:SqlError->Void):Void;
	
	/**
	 * Sends a one byte packet to the server to check that the connection is still active.
	 * @param	callback Callback function with argument SqlError if any error.
	 */
	public function ping(callback:SqlError->Void):Void;
	
	/**
	 * Closes the connection gracefully.
	 * That is, the Connector waits for current queries to finish their execution then closes the connection.
	 * @param	callback Callback function with argument SqlError if any error.
	 */
	public function end(callback:SqlError->Void):Void;
	
	/**
	 * reset the connection.
	 * Reset will:
	 *   1. Rollback any open transaction.
	 *   2. Reset transaction isolation level.
	 *   3. Reset session variables.
	 *   4. Delete user variables.
	 *   5. Remove temporary tables.
	 *   6. Remove all PREPARE statement.
	 * 
	 * This command is only available for MariaDB >=10.2.4 or MySQL >= 5.7.3. function will be rejected
	 * with error "Reset command not permitted for server XXX" if version doesn't permit reset.
	 * 
	 * For previous MariaDB version, reset connection can be done using connection.changeUser(options[, callback])
	 * that do the same + redo authentication phase.
	 * 
	 * See: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectionresetcallback</i>
	 * @param	callback Callback function with argument SqlError if any error.
	 */
	public function reset(callback:SqlError->Void):Void;
	
	/**
	 * Indicates the connection state as the Connector knows it.
	 * If it returns false, there is an issue with the connection, such as the socket disconnected without the Connector knowing about it.
	 */
	public function isValid():Bool;
	
	/**
	 * Closes the connection without waiting for any currently executing queries.
	 * These queries are interrupted. MariaDB logs the event as an unexpected socket close.
	 */
	public function destroy():Void;
	
	/**
	 * This function permit to escape a parameter properly according to parameter type to avoid injection.
	 * See mariadb String literals for escaping.
	 * 
	 * See more documentation:
	 * <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectionescapevalue--string</i>
	 * <i>https://mariadb.com/kb/en/string-literals/</i>
	 * @param	value Unsafe data.
	 */
	public function escape(value:Dynamic):String;
	
	/**
	 * This function permit to escape a Identifier properly.
	 * See Identifier Names for escaping. Value will be enclosed by '`' character if content doesn't satisfy:
	 *   1. ASCII: [0-9,a-z,A-Z$_] (numerals 0-9, basic Latin letters, both lowercase and uppercase, dollar sign, underscore)
	 *   2. Extended: U+0080 .. U+FFFF and escaping '`' character if needed.
	 * @param	value Unsafe data.
	 */
	public function escapeId(value:Dynamic):String;
	
	/**
	 * Pauses data reads.
	 */
	public function pause():Void;
	
	/**
	 * Resumes data reads from a pause.
	 */
	public function resume():Void;
	
	/**
	 * Retrieves the version of the currently connected server.
	 * Throws an error when not connected to a server.
	 * Example: 10.2.14-MariaDB
	 */
	public function serverVersion():String;
}