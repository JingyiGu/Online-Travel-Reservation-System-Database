<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%
			    String customer_email = session.getAttribute("customer_email").toString();
				String customer_account = session.getAttribute("customer_account").toString();
			%>
  <h3>Travel itinerary given reservation</h3>
  <div class="content">
    <p>
      Produce a list of travel itinerary for a given reservation.
    </p>
    <form name="SearchItinearyForm" action="searchItinerary.jsp" method="post">
<%--     <input type="hidden" name="accountNo" value= <% session.getAttribute("customer_account"); %>/>  --%>
      Reservation Number: <input class="textbox" type="text" value = "20180113FL329" name="reservationNo">
      <button value="dummy" type="submit">Query</button>
    </form>
  </div>
  
  <br><br>Go Back? <a href= "customerHomePage.jsp"> Go Back</a>
</body>
</html>