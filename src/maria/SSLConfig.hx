package maria;

import haxe.extern.EitherType;
import js.node.Buffer;
import js.node.Tls.TlsConnectOptions;

/**
 * SSL Connect options.
 * The Connector uses the Node.js implementation of TLS. For more information, see the Node.js TLS API documentation.
 * 
 * See more information:
 * <i>https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/connection-options.md#configuration</i>
 * <i>https://nodejs.org/api/tls.html#tls_tls_connect_options_callback</i>
 * 
 * @author VolkovRA
 */
typedef SSLConfig =
{
	>TlsConnectOptions,
	
	/**
	 * Minimum size of the DH parameter in bits to accept a TLS connection.
	 * Default: 1024
	 */
	@:optional var minDHSize:Float;
	
	/**
	 * Optional shared passphrase used for a single private key and/or a PFX.
	 */
	@:optional var passphrase:String;
	
	/**
	 * Optional cipher suite specification, replacing the default.
	 */
	@:optional var ciphers:String;
	
	/**
	 * Attempt to use the server's cipher suite preferences instead of the client's.
	 */
	@:optional var honorCipherOrder:Bool;
	
	/**
	 * A string describing a named curve or a colon separated list of curve NIDs or names, for example P-521:P-384:P-256, to use for ECDH key agreement, or false to disable ECDH.
	 * Set to auto to select the curve automatically.
	 * 
	 * Default: tls.DEFAULT_ECDH_CURVE
	 */
	@:optional var ecdhCurve:String;
	
	/**
	 * Optional name of an OpenSSL engine which can provide the client certificate.
	 */
	@:optional var clientCertEngine:String;
	
	/**
	 * Diffie Hellman parameters, required for Perfect Forward Secrecy.
	 */
	@:optional var dhparam:EitherType<String,Buffer>;
	
	/**
	 * Optional SSL method to use, default is "SSLv23_method".
	 * Default: SSLv23_method
	 */
	@:optional var secureProtocol:String;
}