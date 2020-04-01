# Haxe externs for MariaDB client on NodeJS.

Description
------------------------------

The Haxe externs of MariaDB NodeJS Connector.

See more of MariaDB connector:
1. [GitHub repository](https://github.com/mariadb-corporation/mariadb-connector-nodejs "MariaDB Connector repository")
2. [NPM Package](https://www.npmjs.com/package/mariadb "NPM MariaDB package")
3. [Documentation of MariaDB callback's](https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/callback-api.md "Documentation")

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

Adding library
------------------------------

1. Install haxelib so that you can use the Haxe libraries.
2. Run the command in the terminal to install the MariaDB externs library globally on your local machine:
```
haxelib git MariaDB https://github.com/VolkovRA/HaxeMariaDB master
```
Command syntax:
```
haxelib git [project-name] [git-clone-path] [branch]
haxelib git minject https://github.com/massiveinteractive/minject.git         # Use HTTP git path.
haxelib git minject git@github.com:massiveinteractive/minject.git             # Use SSH git path.
haxelib git minject git@github.com:massiveinteractive/minject.git v2          # Checkout branch or tag `v2`.
```
3. Add the MariaDB library to your project to use it in the code. If you are using HaxeDevelop, then simply add the entry to the .hxproj file:
```
<haxelib>
	<library name="MariaDB" />
</haxelib>
```

See more information:
 * [Documentation Haxelib](https://lib.haxe.org/documentation/using-haxelib/ "Using Haxelib")
 * [Documentation HaxeDevelop](https://haxedevelop.org/configure-haxe.html "Configure Haxe")