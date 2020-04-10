package maria;

/**
 * Server version description.
 * @author VolkovRA
 */
typedef ServerVersion =
{
	/**
	 * Raw string that database server send to connector.
	 * Example : "10.4.3-MariaDB-1:10.4.3+maria~bionic-log"
	 */
	var raw(default, null):String;
	
	/**
	 * Indicate if server is a MariaDB or a MySQL server.
	 */
	var mariaDb(default, null):Bool;
	
	/**
	 * Server major version.
	 * Example for raw version "10.4.3-MariaDB" is 10.
	 */
	var major(default, null):Int;
	
	/**
	 * Server major version.
	 * Example for raw version "10.4.3-MariaDB" is 4.
	 */
	var minor(default, null):Int;
	
	/**
	 * Server major version.
	 * Example for raw version "10.4.3-MariaDB" is 3.
	 */
	var patch(default, null):Int;	
}