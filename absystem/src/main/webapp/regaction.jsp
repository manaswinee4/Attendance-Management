<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Attendance System</title>
</head>
<body>
<%@ page import="java.sql.*,absystem.DBConnection" %>
<%
     String name=request.getParameter("n");
     String email=request.getParameter("e");
     try
     {
    	  Connection con=DBConnection.getCon();
    	  PreparedStatement ps=con.prepareStatement("insert into myattend (name,email) values(?,?)");
    	  ps.setString(1,name);
    	  ps.setString(2,email);
    	  ps.executeUpdate();
    	  con.close();
     }
     catch(Exception e)
     {
    	 out.println(e);
     }
    // response.sendRedirect("home.html");
%>
</body>
</html>