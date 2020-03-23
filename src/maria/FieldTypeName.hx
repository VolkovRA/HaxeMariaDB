package maria;

/**
 * Stringify field types of database table.
 * See more: <i>https://mariadb.com/kb/en/resultset/#field-types</i>
 * @author VolkovRA
 */
@:enum abstract FieldTypeName(String) to String
{
	var DECIMAL		= "DECIMAL";
	var TINY		= "TINY";
	var SHORT		= "SHORT";
	var LONG		= "LONG";
	var FLOAT		= "FLOAT";
	var DOUBLE		= "DOUBLE";
	var NULL		= "NULL";
	var TIMESTAMP	= "TIMESTAMP";
	var LONGLONG	= "LONGLONG";
	var INT24		= "INT24";
	var DATE		= "DATE";
	var TIME		= "TIME";
	var DATETIME	= "DATETIME";
	var YEAR		= "YEAR";
	var NEWDATE		= "NEWDATE";
	var VARCHAR		= "VARCHAR";
	var BIT			= "BIT";
	var TIMESTAMP2	= "TIMESTAMP2";
	var DATETIME2	= "DATETIME2";
	var TIME2		= "TIME2";
	
	/// Only for MySQL
	var JSON		= "JSON";
	
	var NEWDECIMAL	= "NEWDECIMAL";
	var ENUM		= "ENUM";
	var SET			= "SET";
	var TINY_BLOB	= "TINY_BLOB";
	var MEDIUM_BLOB	= "MEDIUM_BLOB";
	var LONG_BLOB	= "LONG_BLOB";
	var BLOB		= "BLOB";
	var VAR_STRING	= "VAR_STRING";
	var STRING		= "STRING";
	var GEOMETRY	= "GEOMETRY";
}