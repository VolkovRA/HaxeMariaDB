package maria;

/**
 * Field types of database table.
 * See more: <i>https://mariadb.com/kb/en/resultset/#field-types</i>
 * @author VolkovRA
 */
@:enum abstract FieldType(Int) to Int
{
	var DECIMAL		= 0;
	var TINY		= 1;
	var SHORT		= 2;
	var LONG		= 3;
	var FLOAT		= 4;
	var DOUBLE		= 5;
	var NULL		= 6;
	var TIMESTAMP	= 7;
	var LONGLONG	= 8;
	var INT24		= 9;
	var DATE		= 10;
	var TIME		= 11;
	var DATETIME	= 12;
	var YEAR		= 13;
	var NEWDATE		= 14;
	var VARCHAR		= 15;
	var BIT			= 16;
	var TIMESTAMP2	= 17;
	var DATETIME2	= 18;
	var TIME2		= 19;
	
	/// Only for MySQL
	var JSON		= 245;
	
	var NEWDECIMAL	= 246;
	var ENUM		= 247;
	var SET			= 248;
	var TINY_BLOB	= 249;
	var MEDIUM_BLOB	= 250;
	var LONG_BLOB	= 251;
	var BLOB		= 252;
	var VAR_STRING	= 253;
	var STRING		= 254;
	var GEOMETRY	= 255;
}