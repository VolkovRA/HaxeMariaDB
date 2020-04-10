package maria;

/**
 * Object indicates the column collation.
 * In database systems, collation specifies how data is sorted and compared in a database.
 * Collation provides the sorting rules, case, and accent sensitivity properties for the data in the database.
 * 
 * See more:
 * <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#column-metadata</i>
 * <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/types/index.d.ts</i>
 * 
 * @author VolkovRA
 */
typedef Collation =
{
	/**
	 * Example: 33
	 */
	var index:Int;
	
	/**
	 * Example: "UTF8_GENERAL_CI"
	 */
	var name:String;
	
	/**
	 * Example: "utf8"
	 */
	var encoding:String;
	
	/**
	 * Example: 3
	 */
	var maxlen:Int;
	
	var fromEncoding:String->Collation;
	var fromIndex:Float->Collation;
	var fromName:String->Collation;
}