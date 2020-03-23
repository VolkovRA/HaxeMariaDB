package;

import maria.MariaDB;

class Main 
{
	static function main() 
	{
		var con = MariaDB.createConnection({ host:"localhost" });
		
		con.connect(function(err){
			trace(MariaDB.version);
			
			con.query("SELECT * FROM Users;");
		});
	}
}