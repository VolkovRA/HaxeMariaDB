# Haxe externs for MariaDB client on NodeJS.

Description
------------------------------

The Haxe externs for [this](https://github.com/mariadb-corporation/mariadb-connector-nodejs "MariaDB Connector repository") repository and [this npm](https://www.npmjs.com/package/mariadb "NPM MariaDB package") package.
	
How to use
------------------------------
```
package;

import maria.MariaDB;

class Main 
{
	static function main() 
	{
		var con = MariaDB.createConnection({ host:"localhost" });
		
		con.connect(function(err){
			trace(con.serverVersion());
			
			con.query("SELECT * FROM Users;");
		});
	}
}
```

See more [documentation](https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md "MariaDB callback's docs").