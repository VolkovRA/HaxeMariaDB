package maria;

import js.node.events.EventEmitter;

/**
 * Pool cluster.
 * Cluster handle multiple pools according to patterns and handle failover / distributed load (round robin / random / ordered ).
 * 
 * See documentation: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#pool-cluster-api</i>
 * @author VolkovRA
 */
extern class PoolCluster extends EventEmitter<PoolCluster> 
{
	/**
	 * Add a new Pool to cluster.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#poolclusteraddid-config</i>
	 * @param	id Node identifier. Example: "master".
	 * @param	options Pool options to create pool.
	 */
	public function add(id:String, options:PoolConfig):Void;
	
	/**
	 * Add a new Pool to cluster.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#poolclusterremovepattern</i>
	 * @param	pattern String regex pattern to select pools. Example, "slave*"
	 */
	public function remove(pattern:String):Void;
	
	/**
	 * Closes the pool cluster and underlying pools.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#poolclusterendcallback</i>
	 * @param	callback Callback function with argument: (SqlError).
	 */
	public function end(callback:SqlError->Void):Void;
	
	/**
	 * Creates a new Connection object. Connection must be given back to pool with the connection.end() method.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#poolclustergetconnectionpattern-selector-callback</i>
	 * @param	pattern Regex pattern to select pools. Example: "slave*", default: "*".
	 * @param	selector Pools selector. Can be 'RR' (round-robin), 'RANDOM' or 'ORDER' (use in sequence = always use first pools unless fails). default to the
	 * @param	callback Callback function with arguments: (SqlError, Connection).
	 */
	public function getConnection(pattern:String, selector:String, callback:SqlError->Connection->Void):Void;
}