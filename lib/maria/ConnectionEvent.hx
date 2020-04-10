package maria;

import haxe.Constraints.Function;
import js.node.events.EventEmitter.Event;

/**
 * Enumeration of events emitted by the `Connection` objects.
 * Do not confuse with QueryEvent events.
 * @author VolkovRA
 */
@:enum abstract ConnectionEvent<T:Function>(Event<T>) to Event<T> 
{
	/**
	 * Emits an error event when the connection closes unexpectedly.
	 */
	var ERROR:ConnectionEvent<SqlError->Void> = "error";
}