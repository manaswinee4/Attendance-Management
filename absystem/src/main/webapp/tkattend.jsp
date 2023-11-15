<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Attendance System</title>
</head>
<body>
<h1>Course Attendance System</h1><hr color=red size=5>
<%@ page import="java.sql.*,absystem.DBConnection" %>
<%
 try
	{
		Connection con=DBConnection.getCon();
		PreparedStatement ps=con.prepareStatement("select * from myattend");
	    ResultSet rs=ps.executeQuery();
	    out.println("Choose Subject <form action=tkaction.jsp method=post><select name=cn><option value=aj>AdJava</option><option value=c>C</option><option value=ds>DS</option><option value=py>Python</option></select><br>");
	    while(rs.next())
		{
	    	 out.println("<input type=checkbox value="+rs.getString(1)+" name=c>"+rs.getString(1)+"<br>");
	    }
	    out.println("<hr color=red size=5><input type=submit value=SaveAttendence><input type=reset value=Reset></form>");
	}
catch(Exception e)
	{
	out.println(e);
	}
 %>
</body>
</html>