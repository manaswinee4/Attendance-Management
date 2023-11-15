package absystem;

import java.sql.*;
public class CreatColumn {
	public int createCM(String c)
	{
		int r=1;
		try{
			Connection con=DBConnection.getCon();
			String val="A";
			String q="alter table myattend add "+c+" varchar(15) default '"+val+"'";
			PreparedStatement ps=con.prepareStatement(q);
			r=ps.executeUpdate();
			System.out.println(r);
			con.commit();
			con.close();
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
		return r;
	}

}

