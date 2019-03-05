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
		String flightNo = request.getParameter("rsvByFlightNo");
		if (flightNo == null || flightNo.length() < 3) {
		%>
		<script>
			alert("Please input correct flight number");
			window.location.href = "flightReports.jsp";
		</script>
		<%
		return;
		}

		String airlineId = flightNo.substring(0, 2);
		Integer flightNum = Integer.parseInt(flightNo.substring(2));

		try {
			//Create a connection string

			String url = "jdbc:mysql://cs539-fzj-spring18.cqcdjb7jk2qs.us-east-2.rds.amazonaws.com:3306/hwproject";
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "fzj", "Ru151718~");
			
			// 1. check whether flightNo exits
			String strQuery = "SELECT * FROM FLIGHT WHERE airline_id =? AND flight_num=?";
			PreparedStatement stm = con.prepareStatement(strQuery);
			stm.setString(1, airlineId);
			stm.setInt(2, flightNum);
			ResultSet rs = stm.executeQuery();
			if(!rs.next()){
				%>
				<script>
					alert("Sorry, the flightNumber " + flightNo + " does not exists");
					window.location.href = "revenueReports.jsp";
				</script>
				<%
				return;
			} 
			
			strQuery = " SELECT R.*, L.*"
					+ " FROM LEG L, RESERVATION R "
					+ " WHERE L.airline_id = ? AND L.flight_num = ? AND L.reserve_num = R.reserve_num;";

			stm = con.prepareStatement(strQuery);
			stm.setString(1, airlineId);
			stm.setInt(2, flightNum);

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

			String queryType = "List Reservations by Flight Number '" + flightNo + "': ";
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