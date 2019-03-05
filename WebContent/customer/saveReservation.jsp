<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.time.LocalTime" %>
<%@page import = "java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Storing request</title>
</head>
<body>
	<%
	
	   String bookingFee = "350";
	   String rid = "rid123";
	
		try{
			//Create a connection string
			
			String url = "jdbc:mysql://cs539-fzj-spring18.cqcdjb7jk2qs.us-east-2.rds.amazonaws.com:3306/cs539project";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "fzj", "Ru151718~");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the HelloWorld.jsp
			
			//Get parameters from the HTML form on the login.jsp
		    String customerEmail = request.getParameter("email");
		    
		    String resStr = "INSERT INTO reservation (rid, customer_email, booking_fee)"
						+String.format(" VALUES ('%s','%s','%s')", rid, customerEmail, bookingFee );
			stmt.executeUpdate(resStr);
			con.close();

			%>
			 <script> 
			    alert("Your reservation has been completed. Thank you!");
		    	 	window.location.href = "customerHomePage.jsp";
			 </script>
			<%
			
		}catch(Exception e){
			out.print(e.getMessage());
		}
	%>
		
</body>
</html>