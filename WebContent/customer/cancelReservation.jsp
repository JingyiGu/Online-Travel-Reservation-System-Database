<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/login.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%	
       // TO DO
        String accountNo = request.getParameter("accountNo");
		String customerId = (String)request.getParameter("CustomerId");
	
		%>
		<script> 
	    	alert("cancel the reservation  success!");
	    	window.location.href = "customerHomePage.jsp";
		</script>
		<%
		
		
// 		try {
// 			//Create a connection string
			
// 			String url = "jdbc:mysql://cs539-fzj-spring18.cqcdjb7jk2qs.us-east-2.rds.amazonaws.com:3306/cs539project";
// 			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
// 			Class.forName("com.mysql.jdbc.Driver");

// 			//Create a connection to your DB
// 			Connection con = DriverManager.getConnection(url, "fzj", "Ru151718~");
			
// 			//Create a SQL statement
// 			Statement stmt = con.createStatement();
            String strQuery = "DELETE"
                            +" FROM Customer"
                            +" WHERE Id = ?";
            strQuery = "DELETE"
                    +" FROM Person"
                    +" WHERE Id = ?";
			
// 			con.close();

// 		} catch (Exception e) {
// 			out.print("failed");
			%>
			<script> 
		    	alert("Sorry, unexcepted error happens.");
		    	window.location.href = "managerHomePage.jsp";
			</script>
			<%			
// 		}
%>

</body>
</html>