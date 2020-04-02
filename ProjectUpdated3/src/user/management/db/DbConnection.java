package user.management.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	
	
	
	private static Connection connection;
	public static Connection getConnection()
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/usermanagement","root","root");
			
			
		} catch (Exception e) {
			System.out.println("Connection Execption "+connection);
			return null;
		}
		return connection;
	}

}
