package maria;

import haxe.extern.EitherType;

/**
 * Query options.
 * Those options can be set on the query level, but are usually set at the connection level, and will then apply to all queries.
 * 
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#query-options</i>
 * @author VolkovRA
 */
typedef QueryConfig =
{
	/**
	 * Presents result-sets by table to avoid results with colliding fields.
	 * Occasionally, you may have issue with queries that return columns with the same name.
	 * The standard JSON format does not permit key duplication. To get around this, you can set the nestTables option to true. This causes the Connector to group data by table. When using string parameters, it prefixes the JSON field name with the table name and the nestTables value.
	 * 
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#nesttables</i>
	 * Default:	false
	 */
	@:optional var nestTables:EitherType<Bool,String>;
	
	/**
	 * Allows to cast result types.
	 * In the event that you need certain values returned as a different type, you can use this function to cast the value into that type yourself.
	 * Example: function(column, next).
	 * 
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#typecast</i>
	 */
	@:optional var typeCast:TypeCastFunction;
	
	/**
	 * Return result-sets as array, rather than a JSON object.
	 * This is a faster way to get results. For more information, see the Promise and Callback query implementations.
	 * 
	 * Default: false
	 */
	@:optional var rowsAsArray:Bool;
	
	/**
	 * Whether to retrieve dates as strings or as Date objects.
	 * Whether you want the Connector to retrieve date values as strings, rather than Date objects.
	 * 
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#datestrings</i>
	 * Default: false
	 */
	@:optional var dateStrings:Bool;
	
	/**
	 * Forces use of the indicated timezone, rather than the current Node.js timezone.
	 * This has to be set when database timezone differ from Node.js timezone.
	 * Possible values are Z for UTC, local or ±HH:MM format.
	 */
	@:optional var timezone:String;
	
	/**
	 * Allows the use of named placeholders.
	 * While the recommended method is to use the question mark placeholder, you can alternatively allow named placeholders by setting this query option.
	 * Values given in the query must contain keys corresponding to the placeholder names.
	 * 
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#namedplaceholders</i>
	 * Default: false
	 */
	@:optional var namedPlaceholders:Bool;
	
	/**
	 * Permit to indicate server global variable max_allowed_packet value to ensure efficient batching.
	 * Default is 4Mb. See batch documentation.
	 * 
	 * Default: 4196304
	 */
	@:optional var maxAllowedPacket:Int;
	
	/**
	 * When an integer is not in the safe range, the Connector interprets the value as a Long object.
	 * Whether the query should return integers as strings when they are not in the safe range.
	 * 
	 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#supportbignumbers</i>
	 * Default: false
	 */
	@:optional var supportBigNumbers:Bool;
	
	/**
	 * Compatibility option to permit setting multiple value by a JSON object to replace one question mark.
	 * Key values will replace the question mark with format like key1=val,key2='val2'.
	 * Since it doesn't respect the usual prepared statement format that one value is for one question mark,
	 * this can lead to incomprehension, even if badly use to possible injection.
	 * 
	 * Default: false
	 */
	@:optional var permitSetMultiParamEntries:Bool;
	
	/**
	 * When an integer is not in the safe range, the Connector interprets the value as a string.
	 * Whether the query should return integers as strings when they are not in the safe range.
	 * 
	 * See more: </i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#bignumberstrings<i>
	 * Default: false
	 */
	@:optional var bigNumberStrings:Bool;
	
	/**
	 * Disabled bulk command in batch.
	 */
	@:optional var bulk:Bool;
	
	/**
	 * Sends queries one by one without waiting on the results of the previous entry.
	 * For more information, see Pipelining.
	 * 
	 * Default: true
	 */
	@:optional var pipelining:Bool;
	
	/**
	 * Force server version check by explicitly using SELECT VERSION(), not relying on server initial packet.
	 * Default: false
	 */
	@:optional var forceVersionCheck:Bool;
	
	/**
	 * Loading data from a file from the client may be a security issue, as a man-in-the-middle proxy server can change the actual file the server loads.
	 * Being able to execute a query on the client gives you access to files on the client.
	 * 
	 * Default: false
	 */
	@:optional var permitLocalInfile:Bool;
	
	/**
	 * Database server port number.
	 * Default: 3306
	 */
	@:optional var port:Int;
}

/**
 * The result of type cast.
 * Value can be: (TypeScript Types)
 *   1. boolean
 *   2. number
 *   3. string
 *   4. symbol
 *   5. null
 *   6. Date
 *   7. geojson.Geometry
 *   8. Buffer
 * 
 * @author VolkovRA
 */
typedef TypeCastResult = Dynamic;
typedef TypeCastNextFunction = Void->TypeCastResult;

/**
 * Function for type cast.
 * In the event that you need certain values returned as a different type, you can use this function to cast the value into that type yourself.
 * 
 * See more: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#typecast</i>.
 * 
 * @author VolkovRA
 */
typedef TypeCastFunction = FieldInfo->TypeCastNextFunction->TypeCastResult;