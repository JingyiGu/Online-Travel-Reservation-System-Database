<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="../js/jquery.min.js"></script>
<script src="../js/timepicki.js"></script>
<script src="../js/bootstrap.min.js"></script> 

<script>
    function chooseAirType() {
    	 	if (document.getElementById('rbOWId').checked) {
    	        document.getElementById('returnCalendarDiv').style.display = 'none';
    	        document.getElementById('flightId2').style.display = 'none';
    	    }
    	 	if (document.getElementById('rbRTId').checked) {
    	        document.getElementById('returnCalendarDiv').style.display = 'block';
    	        document.getElementById('flightId2').style.display = 'none';
    	    }
    	 	if (document.getElementById('rbMCId').checked) {
    	        document.getElementById('returnCalendarDiv').style.display = 'none';
    	        document.getElementById('flightId2').style.display = 'block';
    	        document.getElementById('flight1').style.display = 'block';
    	    }
    	 	
    }
    
</script>
</head>

<body>


<h2>Find Cheap Flights</h2><br>
<p>To retrieve a list of possible travel paths: <br>
Enter the <strong>date of travel</strong> desired.<br>
Enter the <strong>name of the city or the ID of the airport</strong> you are leaving from.<br>
Enter the <strong>name of the city or the ID of the airport</strong> you wish to go to.
</p>

<form name="findCheapFlightForm" action="findCheapFlightResult.jsp" method="post" >
	<input id="rbOWId" type="radio" name="Air" onclick="chooseAirType()" value="ONEWAYTRIP"> One Way 
	<input id="rbRTId" type="radio" name="Air" onclick="chooseAirType()" value="ROUNDTRIP"> Round Trip 
	<input id="rbMCId" type="radio" name="Air" onclick="chooseAirType()" value="MULTICITY"> Multiple Cities 
	<br><br>
	
	<div id="flightId1">
	<label id="flight1" hidden="true" style="color:blue"> Flight 1 <br><br></label>
		<b>From:&nbsp;</b> 
		<input type="text" name="dpAirport" value="EWR"><br><br>
		<b>To: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
		<input type="text" name="arAirport" value="MIA"><br><br>
		
		<b>Depart:&nbsp;</b> 
		<input id="departCalendarId" name="departCalendar" type=date placeholder="Pick a Date"><br><br>
		<div hidden="true" id="returnCalendarDiv">
		<b>Return:&nbsp;</b> 
		<input id="returnCalendarId" name="returnCalendar" type=date placeholder="Pick a Date"><br><br>
	    </div>
    </div>
    
    <div id="flightId2" hidden="true">
    <label id="flight2" style="color:blue"> Flight 2 <br><br></label>
    		<b>From:&nbsp;</b> 
		<input type="text" name="dpAirport2" value="EWR"><br><br>
		<b>To: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
		<input type="text" name="arAirport2" value="MIA"><br><br>
		
		<b>Depart:&nbsp;</b> 
		<input id="departCalendarId2" name="departCalendar2" type=date placeholder="Pick a Date"><br><br>		
    </div>
    
    <input type="submit" value="Search Now"> 
</form>
<br><br><a href="customerHomePage.jsp">Go Back?</a>
</body>
</html>