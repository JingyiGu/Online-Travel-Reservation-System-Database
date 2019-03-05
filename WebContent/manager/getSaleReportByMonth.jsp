<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		String month = request.getParameter("month");
		String year = request.getParameter("year");

		try {
			//Create a connection string

			String url = "jdbc:mysql://cs539-fzj-spring18.cqcdjb7jk2qs.us-east-2.rds.amazonaws.com:3306/hwproject";
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "fzj", "Ru151718~");

			String strQuery = " SELECT SUM(R.booking_fee) AS total_fee " 
					+ " FROM RESERVATION R "
					+ " WHERE month(R.date)= ? AND year(R.date) = ? ;";

			PreparedStatement stm = con.prepareStatement(strQuery);
			stm.setString(1, month);
			stm.setString(2, year);
			ResultSet rs = stm.executeQuery();
			out.print("total_fee: ");
			if(rs.next()){
				out.print(rs.getString("total_fee"));
			}
			out.print("<p class='message'>Go back? <a href='managerHomePage.jsp'>" + "Go back</a></p>");
			con.close();

	
		} catch (Exception e) {
			System.out.println("getSaleReportByMonth error:" + e.toString());
		
			%>
			<script> 
				 alert("Sorry, something went wrong on our server");
				 window.location.href = "saleReportByMonth.jsp";
			</script>
			<%
			return;
		}
	%>
</body>
</html>