package maria;

import haxe.Constraints.Function;
import js.node.events.EventEmitter.Event;
import maria.old.Connection;

/**
 * Enumeration of events emitted by the `Pool` objects.
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#pool-events-1</i>
 * @author	VolkovRA
 */
@:enum abstract PoolEvent<T:Function>(Event<T>) to Event<T>
{	
	/**
	 * This event emits a connection is acquired from pool.
	 */
	var ACQUIRE:PoolEvent<Connection->Void> = "acquire";
	
	/**
	 * This event is emitted when a new connection is added to the pool.
	 * Has a connection object parameter.
	 */
	var CONNECTION:PoolEvent<Connection->Void> = "connection";
	
	/**
	 * This event is emitted when a command cannot be satisfied immediately by the pool and is queued.
	 */
	var ENQUEUE:PoolEvent<Void->Void> = "enqueue";
	
	/**
	 * This event is emitted when a connection is released back into the pool.
	 * Has a connection object parameter
	 */
	var RELEASE:PoolEvent<Connection->Void>	= "release";
}