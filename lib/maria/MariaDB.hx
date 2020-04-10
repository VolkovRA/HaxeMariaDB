package maria;

/**
 * Connector for database MariaDB. (Or MySQL)
 * Basic connector implementation has <b>two</b> types API: promises and callbacks.
 * This Haxe extern use only a <b>callbacks</b> API, as: <code>const mariadb = require('mariadb/callback');</code>
 * 
 * This definitions taken from the original repository: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/types/index.d.ts</i>
 * See documentation: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md</i>
 * @author VolkovRA
 */
@:jsRequire("mariadb/callback")
extern class MariaDB
{
	/**
	 * Library version.
	 * Returns a String that is library version.
	 * Example: '2.1.2'
	 */
	static public var version:String;
	
	/**
	 * Creates a new connection.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#createconnectionoptions--connection</i>
	 * @param	options Options for connect to data base.
	 * @return	Returns a Connection object.
	 */
	static public function createConnection(options:ConnectionConfig):Connection;
	
	/**
	 * Creates a new pool.
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#createpooloptions--pool</i>
	 * @param	options Pool options.
	 * @return	Returns a Pool object.
	 */
	static public function createPool(options:PoolConfig):Pool;
	
	/**
	 * Creates a new pool cluster.
	 * Cluster handle multiple pools, giving high availability / distributing load (using round robin / random / ordered ).
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#createpoolclusteroptions--poolcluster</i>
	 * @param	options
	 * @return	Returns a PoolCluster object.
	 */
	static public function createPoolCluster(options:PoolClusterConfig):PoolCluster;
}