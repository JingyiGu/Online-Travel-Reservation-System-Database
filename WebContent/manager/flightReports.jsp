<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script>
    $(function() {
      $("#accordion").accordion({
        active: parseInt(getAnchor(location.href)),
        heightStyle: "content"
      });
    });
    
    function getAnchor(url)
    {
      var index = url.lastIndexOf('#');
      if (index != -1)
        return url.substring(index+1);
    }
    
    function checkForm(oForm) {
      var filled = 0;
      for (var i = 0; i < oForm.elements.length; i++) {
        if (GetElementValue(oForm.elements[i]).length > 0)
          filled++;
      }
      if(filled!=oForm.elements.length) {
        alert("Please Fill Form Completely");
        return false;
      }
    }

    function GetElementValue(element) {
      if ((element.type === "checkbox" || element.type === "radio") && 
           element.checked === false)
        return "";
      return element.value;
    }
  </script>
</head>
<body>

	<%
		String mgAccount = session.getAttribute("account").toString();
		out.print( "<p class='message' > Welcome! Dear " + mgAccount + "</p>");
	%>
<h2>Flight Listings</h2>
<div id="accordion">
  <h3>Comprehensive Listing</h3>
  <div>
    <p>
      Produce a comprehensive listing of all flights
    </p>
    <form name="comp" action="comprehensiveFlights.jsp" method="post">
      <button value="dummy" type="submit">Query</button>
    </form>
  </div>
  
  <h3>List Reservations</h3>
  <div>
    <p>
       Produce a list of reservations by flight number or by customer name
    </p>
    <form name="resrvFlightForm" action="reservationByFlight.jsp" method="post">
    	Flight Number:  <input class="textbox" type="text" value="CA819" name="rsvByFlightNo" />
      <button value="dummy" type="submit">Query</button>
    </form>
    <br> Or
    <form name="resrvCustForm" action="reservationByCustName.jsp" method="post">
    Customer's First Name: <input class="textbox" type="text" value="JINGYI" name="firstName"/><br>
    Customer's Last Name: <input class="textbox" type="text" value="GU" name="lastName"/>
      <button value="dummy" type="submit">Query</button>
    </form>
  </div>
  
 <h3> Most Active Flights </h3>
  <div>
    <p>
      Produce a list of most active flights
    </p>
    <form name="activeflights" action="activeFlights.jsp" method="post">
      <button value="dummy" type="submit">Query</button>
    </form>
  </div>
  <h3>List all Customers by Reserved Seats</h3>
  <div>
    <p>
      Produce a list of all customers who have seats reserved on a given flight
    </p>
    <form name="custbyflight" action="customersByRsvSeats.jsp" method="post">
      Flight Number: <input class="textbox" type="text" value="CA819" name="custFlightNumber"/> <br>
      Fly day: <input class="textbox" type="text" name="flydate"/>
      <button value="dummy" type="submit">Query</button>
    </form>
  </div>
  <h3>List Flights By Airport</h3>
  <div>
    <p>
      Produce a list of all flights for a given airport
    </p>
    <form name="flightsbyport" action="flightsByAirport.jsp" method="post">
      Airport ID: <input class="textbox" type="text" name="airPortId">
      <button value="dummy" type="submit">Query</button>
    </form>
  </div>
  <h3>List Flights by Delays</h3>
  <div>
    <p>
      Produce a list of all flights whose arrival and departure times are 
      on-time/delayed
    </p>
    <form name="delayed" action="delayedFlights.jsp" method="post">
      <button value="dummy" type="submit">Query</button>
    </form>
  </div>
</div>

</body>
</html>
