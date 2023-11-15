<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Course Attendance System</h1><hr>
<h2>Date wise report</h2>
<%@page import="java.sql.*,absystem.*" %>
<%
try{
		int c=0;
		Connection con=DBConnection.getCon();
		PreparedStatement ps=con.prepareStatement("select * from myattend");
		ResultSet rs=ps.executeQuery();
	    ResultSetMetaData rsd=rs.getMetaData();
	    int col=rsd.getColumnCount();
	    String sub="",sname="";
	    for(int k=3;k<=col;k++)
	    {
	    	sub=rsd.getColumnName(k);
	    	String sn[]=sub.split("_");   
	    	if(sn[0].equals("DS"))
	    		sname="DataStructure";
	    	else if(sn[0].equals("PY"))
	    		sname="Python";
	    	else if(sn[0].equals("AJ"))
	    		sname="AdvancedJava";
	    	else if(sn[0].equals("C"))
	    		sname="CProgramming";
	    	out.println(sname+" <a href=daily.jsp?col="+rsd.getColumnName(k)+">"+sn[1]+"_"+sn[2]+"_"+sn[3]+"</a><br>");
	    }

	   
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>