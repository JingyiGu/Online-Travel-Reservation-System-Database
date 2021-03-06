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
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		if (firstName == null || lastName == null) {
			%>
			<script>
				alert("Please input customer's first name and last name");
				window.location.href = "revenueReports.jsp";
			</script>
			<%
			return;
		}

		try {
			//Create a connection string

			String url = "jdbc:mysql://cs539-fzj-spring18.cqcdjb7jk2qs.us-east-2.rds.amazonaws.com:3306/hwproject";
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "fzj", "Ru151718~");
			
			// 1. check whether customer's name exists
			String strQuery = " SELECT *  FROM CUSTOMERS " + " WHERE  firstname=? AND lastname=?;";
			PreparedStatement stm = con.prepareStatement(strQuery);
			stm.setString(1, firstName);
			stm.setString(2, lastName);
			ResultSet rs = stm.executeQuery();
			if(!rs.next()){
				%>
				<script>
					alert("Sorry, the customer name doesnot exists");
					window.location.href = "revenueReports.jsp";
				</script>
				<%
				return;
			} 

			strQuery = " SELECT  R.*,L.*"
					+ " FROM CUSTOMERS C, ACCOUNT A, RESERVATION R,LEG L  "
					+ " WHERE C.firstname = ? AND C.lastname = ? AND C.email = A.email AND A.acct_num = R.acct_num AND R.reserve_num = L.reserve_num;";
			stm = con.prepareStatement(strQuery);
			stm.setString(1, firstName);
			stm.setString(2, lastName);

// 			System.out.println(" debuggable statement= " + stm.toString());
			rs = stm.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			List<String> columns = new ArrayList<String>();
			int rowCount = md.getColumnCount();
			for (int i = 1; i <= rowCount; i++) {
				columns.add(md.getColumnName(i));
			}
			
			//Data structure to hold result set
			List<String[]> results = new ArrayList<String[]>();
			while (rs.next()) {
				String[] row = new String[rowCount];
				for (int i = 1; i <= rowCount; i++) {
					row[i - 1] = rs.getString(columns.get(i - 1));
				}
				results.add(row);
			}

			String queryType = "List Reservations by Customer '" + firstName + " " + lastName + "': ";
			request.setAttribute("columns", columns);
			request.setAttribute("results", results);
			request.setAttribute("querytype", queryType);

			con.close();

			RequestDispatcher rd = request.getRequestDispatcher("mgrQueryResults.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			out.println(e);
			e.printStackTrace();
		}

		response.setContentType("text/html");
	%>

</body>
</html>