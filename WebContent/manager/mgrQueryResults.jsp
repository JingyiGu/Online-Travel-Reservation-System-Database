<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <link rel="stylesheet" type="text/css" href="css/textbox.css">
</head>
<body>
      
<%
	String mgAccount = session.getAttribute("account").toString();
	out.print( "<p class='message' > Welcome! Dear " + mgAccount + "</p>");
%>
<h2><%=request.getAttribute("querytype")%></h2>
<table border=1>
	<% 
	  List<String> columns = (List<String>)request.getAttribute("columns");
	  List<String[]> results = (List<String[]>)request.getAttribute("results"); 
	  out.println("<tr>");
	  for(String columnName: columns ){
	     out.println("<td>"+columnName+"</td>");
	  }
	  out.println("</tr>");
	  for(String[] rowData: results){
	     out.println("<tr>");
	     for(String data: rowData){
	        out.println("<td>"+data+"</td>");
	     }
	     out.println("</tr>");
	  }
	%>
</table>

<p class="message">Go back? <a href="managerHomePage.jsp">Go back</a></p>
</body>
</html>
