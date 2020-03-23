package maria;

/**
 * Pool options.
 * Includes connection option documentation that will be used when creating new connections.
 * 
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#pool-options</i>
 * @author VolkovRA
 */
typedef PoolConfig =
{
	>ConnectionConfig,
	
	/**
	 * The milliseconds before a timeout occurs during the connection acquisition. This is slightly different from connectTimeout,
	 * because acquiring a pool connection does not always involve making a connection.
	 * 
	 * Default: 10000 ( = 10 seconds)
	 */
	@:optional var acquireTimeout:Int;
	
	/**
	 * Maximum number of connection in pool.
	 * The maximum number of connections to create at once.
	 * 
	 * Default: 10
	 */
	@:optional var connectionLimit:Int;
	
	/**
	 * Indicate idle time after which a pool connection is released.
	 * Value must be lower than @@wait_timeout. In seconds (0 means never release).
	 * In seconds (0 means never release)
	 * 
	 * Default: 1800 ( = 30 minutes)
	 */
	@:optional var idleTimeout:Int;
	
	/**
	 * Timeout after which pool give up creating new connection.
	 */
	@:optional var initializationTimeout:Int;
	
	/**
	 * When asking a connection to pool, the pool will validate the connection state.
	 * "minDelayValidation" permits disabling this validation if the connection has been borrowed recently avoiding
	 * useless verifications in case of frequent reuse of connections.
	 * 0 means validation is done each time the connection is asked. (in ms)
	 * 
	 * Default: 500 (in millisecond)
	 */
	@:optional var minDelayValidation:Int;
	
	/**
	 * Permit to set a minimum number of connection in pool.
	 * <b>Recommendation is to use fixed pool, so not setting this value.</b>
	 * 
	 * Default: set to connectionLimit value
	 */
	@:optional var minimumIdle:Int;
	
	/**
	 * When a connection is given back to pool, reset the connection if the server allows it (only for MariaDB version >= 10.2.22 /10.3.13).
	 * If disabled or server version doesn't allows reset, pool will only rollback open transaction if any.
	 * 
	 * Default: true
	 */
	@:optional var resetAfterUse:Bool;
	
	/**
	 * After giving back connection to pool (connection.end) connector will reset or rollback connection to ensure a valid state.
	 * This option permit to disable those controls
	 * 
	 * Default: false
	 */
	@:optional var noControlAfterUse:Bool;
	
	/**
	 * Permit to indicate a timeout to log connection borrowed from pool.
	 * When a connection is borrowed from pool and this timeout is reached, a message will be logged to console indicating a possible connection leak. Another message will tell if the possible logged leak has been released.
	 * A value of 0 (default) meaning Leak detection is disable.
	 * 
	 * Default: 0
	 */
	@:optional var leakDetectionTimeout:Int;
}