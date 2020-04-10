package maria;

import haxe.Constraints.Function;
import js.node.events.EventEmitter.Event;

/**
 * Enumeration of events emitted by the `PoolCluster` objects.
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#poolcluster-events</i>
 * @author	VolkovRA
 */
@:enum abstract PoolClusterEvent<T:Function>(Event<T>) to Event<T>
{	
	/**
	 * PoolCluster emits this event when a node is removed from configuration if the option removeNodeErrorCount
	 * is defined (default to 5) and connector fails to connect more than removeNodeErrorCount times.
	 * (if other nodes are present, each attemps will wait for value of the option restoreNodeTimeout)
	 */
	var REMOVE:PoolClusterEvent<Dynamic->Void> = "remove";
}