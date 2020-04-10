package maria;

/**
 * The metadata of column response.
 * Documentation: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md#column-metadata</i>
 * Types code: <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/types/index.d.ts</i>
 * @author VolkovRA
 */
typedef FieldInfo =
{
	/**
	 * Object indicates the column collation.
	 * It has the properties: index, name, encoding, and maxlen. For instance, 33, "UTF8_GENERAL_CI", "utf8", 3.
	 */
	var collation:Collation;
	
	/**
	 * Shows the column's maximum length if there's a limit and 0 if there is no limit, (such as with a BLOB column).
	 */
	var columnLength:Float;
	
	/**
	 * Shows the column type.
	 * For more information on the relevant values, see: <i>https://mariadb.com/kb/en/resultset/#field-types</i>.
	 */
	var columnType:FieldType;
	
	/**
	 * Provides the decimal part length.
	 */
	var scale:Float;
	
	/**
	 * Shows the column type as a string value.
	 * For more information on the relevant values, see: <i>https://mariadb.com/kb/en/resultset/#field-types</i>.
	 */
	var type:FieldTypeName;
	
	/**
	 * Shows the byte-encoded flags.
	 * For more information, see https://mariadb.com/kb/en/resultset/#field-detail-flag.
	 */
	var flags:FieldFlags;
	
	/**
	 * Name of the database schema.
	 * You can also retrieve this using schema().
	 */
	var db:Void->String;
	
	/**
	 * Name of the database schema.
	 * Alias for db().
	 */
	var schema:Void->String;
	
	/**
	 * Table alias.
	 */
	var table:Void->String;
	
	/**
	 * Real table name.
	 */
	var orgTable:Void->String;
	
	/**
	 * Column alias.
	 */
	var name:Void->String;
	
	/**
	 * Real column name.
	 */
	var orgName:Void->String;
	
	
	
	// Note that you may only call *one* of these functions
	// when decoding a column via the typeCast callback.
	// Calling additional functions will give you incorrect results.
	
	/**
	 * Decode Column Type.
	 * <b>Note that you may only call *one* of these functions when decoding a column via the typeCast callback. Calling additional functions will give you incorrect results.</b>
	 */
	var string:Void->Null<String>;
	
	/**
	 * Decode Column Type.
	 * <b>Note that you may only call *one* of these functions when decoding a column via the typeCast callback. Calling additional functions will give you incorrect results.</b>
	 */
	var buffer:Void->Null<js.node.Buffer>;
	
	/**
	 * Decode Column Type.
	 * <b>Note that you may only call *one* of these functions when decoding a column via the typeCast callback. Calling additional functions will give you incorrect results.</b>
	 */
	var float:Void->Null<Float>;
	
	/**
	 * Decode Column Type.
	 * <b>Note that you may only call *one* of these functions when decoding a column via the typeCast callback. Calling additional functions will give you incorrect results.</b>
	 */
	var int:Void->Null<Int>;
	
	/**
	 * Decode Column Type.
	 * <b>Note that you may only call *one* of these functions when decoding a column via the typeCast callback. Calling additional functions will give you incorrect results.</b>
	 */
	var long:Void->Null<Float>;
	
	/**
	 * Decode Column Type.
	 * <b>Note that you may only call *one* of these functions when decoding a column via the typeCast callback. Calling additional functions will give you incorrect results.</b>
	 */
	var decimal:Void->Null<Float>;
	
	/**
	 * Decode Column Type.
	 * <b>Note that you may only call *one* of these functions when decoding a column via the typeCast callback. Calling additional functions will give you incorrect results.</b>
	 */
	var date:Void->Null<js.lib.Date>;
	
	/**
	 * Decode Column Type.
	 * <b>Note that you may only call *one* of these functions when decoding a column via the typeCast callback. Calling additional functions will give you incorrect results.</b>
	 */
	var geometry:Void->Null<Dynamic>;
}