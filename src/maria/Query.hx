package maria;

import js.node.events.EventEmitter;

/**
 * Query event dispatcher.
 * See all query events: maria.QueryEvent
 * See documentation: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md#connectionquerysql-values-callback---emitter</i>
 * @author VolkovRA
 */
extern class Query extends EventEmitter<Query>
{
}