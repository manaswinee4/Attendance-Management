<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,absystem.*" %>
<%
    String name[]=request.getParameterValues("c");
    String cn=request.getParameter("cn");
    java.util.Date d=new java.util.Date();
    String col=cn+"_"+d.getDate()+"_"+(d.getMonth()+1)+"_"+(d.getYear()+1900); 
    int res=new CreatColumn().createCM(col);
    if(res==0)
    {
    try
    {
		Connection con=DBConnection.getCon();
	 	String q="update myattend set "+col+"=? where name=?";
		PreparedStatement ps=con.prepareStatement(q);
		for(String r:name)
	    {
			ps.setString(1,"P");
		    ps.setString(2,r);
		    ps.addBatch();
	    }
	 	int proll[]=ps.executeBatch();
		out.println(proll.length+" records are marked present...");
		con.close();
     }
    catch(Exception e)
    {
	 	out.println(e);
    }
	}
    else
      	out.println("Attendance already taken...");	 
 %>
</body>
</html>