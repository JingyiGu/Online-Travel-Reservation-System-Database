<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>find the possible flight path</title>
</head>
<body>

	<%
	    // refer to currentActivate.jsp
		List<String> columns = new ArrayList<String>();
		columns.add("Airline");
		columns.add("Flight");
		columns.add("From_Airport");
		columns.add("To_Airport");
		columns.add("Depart_Time");
		columns.add("Depart_Date");
		columns.add("Arrive_Time");
		columns.add("Arrive_Date");
		columns.add("Operation");
		
		List<String[]> results = new ArrayList<String[]>();
		results.add(new String[] {"UA", "Flight1496", "EWR", "MIA", "07:10pm", "Sat, Mar 24", "10:17pm", "Sat, Mar 24"});
		results.add(new String[] {"AA", "Flight1614", "EWR", "MIA", "11:05pm", "Sat, Mar 24", "02:16pm", "Sat, Mar 24"});
		
		// get form data
		
		String airType  = request.getParameter("Air");
		String dpAirport = request.getParameter("dpAirport"); 
		String arAirport = request.getParameter("arAirport"); 
		String departCalendar = request.getParameter("departCalendar"); 

		out.println("<h2>Your choice: </h2>");
		out.println("<br>depart Airport: " + dpAirport);
		out.println("<br>arrive Airport: " + arAirport);
		out.println("<br>departure Calendar: " + departCalendar);
		out.println("<br><br>");
		
		
		
		out.println("<h2>You can choose one flight from : </h2>");
		//Make an HTML table to show the results in:

	    	out.print("<form action='makeReservation.jsp' id='makeResForm' >");
		out.print("<input type='hidden' name='customer_email' />");
		out.print("<table id='makeResTable'>");
		
		out.print("<tr>");
		for(String colName : columns){
			out.print("<td>");
			out.print(colName);
			out.print("</td>");
		}
		out.print("</tr>");
		
		// print the result
		for(String[] oneRow : results){
			out.print("<tr>");
			for(String cell : oneRow){
				out.print("<td>");
				out.print(cell);
				out.print("</td>");
			}
			out.print("<td><input type='submit' value='Book Now'></td>");
			out.print("</tr>");
		}
	   out.print("</table>");
 	   out.print("<p class='message'> <br><br>Go Back? <a href='findCheapFlight.jsp'>" + " Go Back</a></p>");
		
	%>

</body>
</html>