package maria;

/**
 * Field detail flags.
 * The field details flag will permit having an indication, like is this field signed?
 * <b>The blob flag is not enough to permit identifying if the field is a binary flag: char binary and varchar binary are not binary (they are handled like strings), but have the binary flag!</b>
 * 
 * See more: <i>https://mariadb.com/kb/en/resultset/#field-detail-flag</i>
 * @author VolkovRA
 */
typedef FieldFlags = Int;

/**
 * Field detail flag.
 * @author VolkovRA
 */
@:enum abstract FieldFlag(FieldFlags) to FieldFlags
{
	/// Field cannot be null.
	var NOT_NULL				= 1;
	
	/// Field is a primary key.
	var PRIMARY_KEY				= 2;
	
	/// Field is unique.
	var UNIQUE_KEY				= 4;
	
	/// Field is in a multiple key.
	var MULTIPLE_KEY			= 8;
	
	/// Is this field a Blob.
	var BLOB					= 16;
	
	/// Is this field unsigned.
	var UNSIGNED				= 32;
	
	/// Is this field a zerofill.
	var ZEROFILL_FLAG			= 64;
	
	/// Whether this field has a binary collation.
	var BINARY_COLLATION		= 128;
	
	/// Field is an enumeration.
	var ENUM					= 256;
	
	/// Field auto-increment.
	var AUTO_INCREMENT			= 512;
	
	/// Field is a timestamp value.
	var TIMESTAMP				= 1024;
	
	/// Field is a SET.
	var SET						= 2048;
	
	/// Field doesn't have default value.
	var NO_DEFAULT_VALUE_FLAG	= 4096;
	
	/// Field is set to NOW on UPDATE.
	var ON_UPDATE_NOW_FLAG		= 8192;
	
	/// Field is num.
	var NUM_FLAG				= 32768;
}