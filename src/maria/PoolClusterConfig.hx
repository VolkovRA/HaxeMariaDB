package maria;

/**
 * Pool cluster options.
 * Includes pool option documentation that will be used when creating new pools.
 * 
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#poolcluster-options</i>
 * @author VolkovRA
 */
typedef PoolClusterConfig =
{
	/**
	 * When getting a connection from pool fails, can cluster retry with other pools.
	 * Default: true
	 */
	@:optional var canRetry:Bool;
	
	/**
	 * Maximum number of consecutive connection fail from a pool before pool is removed from cluster configuration.
	 * Null means node won't be removed.
	 * 
	 * Default: 5
	 */
	@:optional var removeNodeErrorCount:Int;
	
	/**
	 * If connection fails, specifies the number of milliseconds before another connection attempt will be made.
	 * If set to 0, then node will be removed instead and never re-used.
	 * 
	 * Default: 0
	 */
	@:optional var restoreNodeTimeout:Int;
	
	/**
	 * The default selector. (Default: RR)
	 * RR: Select one alternately. (Round-Robin)
	 * RANDOM: Select the node by random function.
	 * ORDER: Select the first node available unconditionally.
	 * 
	 * Default: RR
	 */
	@:optional var defaultSelector:String;
}