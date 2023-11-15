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
	String col=request.getParameter("col");
	int i,c=1,a=0;
	try
	{
		c=1;
		Connection con=DBConnection.getCon();
		PreparedStatement ps=con.prepareStatement("select name,"+col+" from myattend");
		ResultSet rs=ps.executeQuery();
		out.println("<table >");
		out.println("<tr><th colspan=2>"+col+"</th>");
	//	out.println("<th>Total Present</th><th>Total Absent</th>");
		out.println("<th>Percentage</th></tr>");
		while(rs.next())
		{
			out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td>");
			if(rs.getString(2).equals("P"))
				a=c++;
		}
		PreparedStatement ps1=con.prepareStatement("select count(name) from myattend");
		ResultSet r=ps1.executeQuery();
		while(r.next())
		{
		//		out.println("<td >"+((r.getInt(1))-(r.getInt(1)-a))+"</td>");
		//		out.println("<td >"+(r.getInt(1)-a)+"</td>");
				out.println("<td bgcolor=pink>"+(float)(((r.getInt(1))-(r.getInt(1)-a))*100/r.getInt(1))+" %</td></tr>");
		}
		out.println("</table>");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>