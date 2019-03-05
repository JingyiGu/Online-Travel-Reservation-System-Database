<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Path Details</h2>
<p>Select additional options for your Reservation</p>
<form name="reservationForm" action="saveReservation.jsp" method="post">
  <h4>Seat Class:</h4>
    <p>Economy or First Class?</p>
    <label for="economy">Economy</label>
    <input type="radio" name="class" id="economy" value="economy"><br>
    <label for="first">First Class</label>
    <input type="radio" name="class" id="first" value="first">
  
  <h4>Number of Passengers:</h4>
    <p>How many tickets do you need?</p>
    <label for="pass">Passengers</label>
    <select name='passengers' id='pass'>
    <%for(int i=1;i<7;i++) {%>
    <option value='<%=i%>'><%=i%></option>
    <%}%>
    </select>

  
  <h4>Meal:</h4>
    <p>Do you request any special Meal for your flight?</p>
    <input type="text" class="textbox" name="meal" value="">

  <h4>Customer Representative:</h4>
    <p>Did a customer representative help you? If so, enter his/her SSN. If not, enter "no".</p>
    <input type="text" class="textbox" name="repssn" value="no"><br>
    
<%--   <input name="index" hidden value="<%=request.getParameter("index")%>"><br> --%>
  <input type='submit' value='Book'>
</form>
<br><br>Go Back ?<a href= "findCheapFlight.jsp"> Go Back</a>
</body>
</html>