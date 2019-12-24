package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbTools {
	public Connection dbTools(){
		Connection c = null;
		try {
			c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bookstore?characterEncoding=UTF-8",
			        "root", "228339726");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
		
	}
}
