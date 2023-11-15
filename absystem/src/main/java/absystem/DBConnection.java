package absystem;

import java.sql.*;
public class DBConnection 
{
	public static Connection getCon()
	{
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mydb","db123");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
}