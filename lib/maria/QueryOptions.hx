package maria;

/**
 * SQL Query options.
 * @author VolkovRA
 */
typedef QueryOptions =
{
	>QueryConfig,
	
	/**
	 * SQL command to execute.
	 */
	var sql:String;
}