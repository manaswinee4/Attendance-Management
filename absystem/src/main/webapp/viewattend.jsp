<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Attendance System</title>
</head>
<body>
<h1>Course Attendance System</h1><hr color=blue size=10>
<h2>View Attendance</h2>
<%@page import="java.sql.*,absystem.*" %>
<%
try
{
	 	int c=0;
		Connection con=DBConnection.getCon();
		PreparedStatement ps=con.prepareStatement("select * from myattend");
	    ResultSet rs=ps.executeQuery();
	    ResultSetMetaData rsd=rs.getMetaData();
	    int col=rsd.getColumnCount();
	    out.println("<table border=2><tr>");
        for(int k=1;k<=col;k++)
	    	out.println("<th>"+rsd.getColumnName(k)+"</th>");
	    out.println("<th>Total class ["+(col-2)+"]</th></tr>");
	    while(rs.next())
	    {  
	    	c=0;
			out.println("<tr>");
	    	for(int j=1;j<=col;j++)
	    		if(rs.getString(j).equals("P")) 
	    	    {
	    			out.println("<td bgcolor=blue >"+rs.getString(j)+"</td>");
	    			c++;
	    		}
	    		else if(rs.getString(j).equals("A"))
	    			out.println("<td bgcolor=red>"+rs.getString(j)+"</td>");
	    		else
	    			out.println("<td>"+rs.getString(j)+"</td>");
			out.println("<td>"+(float)c*100/(col-2)+" %</td></tr>");
	     }
	     out.println("</table>");
}
catch(Exception e)
{
	out.println(e);
}
 %>
<br>
<input type=button value=Print onclick="window.print()">
</body>
</html>