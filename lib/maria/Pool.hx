package maria;

import haxe.extern.EitherType;
import js.node.events.EventEmitter;

/**
 * Pool of Connections.
 * Each time a connection is asked, if the pool contains a connection that is not used, the pool will validate the connection,
 * exchanging an empty MySQL packet with the server to ensure the connection state, then give the connection.
 * The pool reuses connection intensively, so this validation is done only if a connection has not been used for a
 * period (specified by the "minDelayValidation" option with the default value of 500ms).
 * 
 * If no connection is available, the request for a connection will be put in a queue until connection timeout.
 * When a connection is available (new creation or released to the pool), it will be used to satisfy queued requests in FIFO order.
 * When a connection is given back to the pool, any remaining transactions will be rolled back.
 * 
 * See documentation: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#pool-api</i>
 * @author VolkovRA
 */
extern class Pool extends EventEmitter<Pool> 
{
	/**
	 * Creates a new Connection object.
	 * Connection must be given back to pool with the connection.end() method.
	 * @param	callback Callback function.
	 */
	public function getConnection(callback:SqlError->Connection->Void):Void;
	
	/**
	 * This is a shortcut to get a connection from pool, execute a query and release connection.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#poolquerysql-values-callback</i>
	 * @param	sql SQL string or object to supersede default connection options.
	 * @param	values Placeholder values. Usually an array, but in cases of only one placeholder, it can be given as is.
	 * @param	callback Callback function with arguments: (error, results, metadata).
	 */
	public function query(sql:EitherType<String,QueryOptions>, ?values:EitherType<Array<Dynamic>,Dynamic>, ?callback:SqlError->Dynamic->FieldInfo->Void):Void;
	
	/**
	 * This is a shortcut to get a connection from pool, execute a batch and release connection.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#poolbatchsql-values-callback</i>
	 * @param	sql SQL string or object to supersede default connection options.
	 * @param	values Placeholder values. Usually an array, but in cases of only one placeholder, it can be given as is.
	 * @param	callback Callback function with arguments: (error, results, metadata).
	 */
	public function batch(sql:EitherType<String,QueryOptions>, ?values:EitherType<Array<Dynamic>,Dynamic>, ?callback:SqlError->Dynamic->FieldInfo->Void):Void;
	
	/**
	 * Closes the pool and underlying connections gracefully.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#poolendcallback</i>
	 * @param	callback Callback function with argument (SqlError).
	 */
	public function end(callback:SqlError->Void):Void;
	
	/**
	 * This is an alias for Connection.escape(value):String to escape parameters.
	 */
	public function escape(value:Dynamic):String;
	
	/**
	 * This is an alias for Connection.escapeId(value):String to escape Identifier.
	 */
	public function escapeId(value:Dynamic):String;
	
	/**
	 * Gets current active connection number.
	 */
	public function activeConnections():Float;
	
	/**
	 * Gets current total connection number.
	 */
	public function totalConnections():Float;
	
	/**
	 * Gets current idle connection number.
	 */
	public function idleConnections():Float;
	
	/**
	 * Gets current stacked request.
	 */
	public function taskQueueSize():Float;
}