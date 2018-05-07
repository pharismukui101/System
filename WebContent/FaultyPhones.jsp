<%@page import='iPlaceKenya.*'%>
<!DOCTYPE html>
<html>
<head>
<title>Faulty Phones</title>
<script type=text/javascript src=jquery/jquery.js></script>
<script type=text/javascript src=jquery/jquery-ui.js></script>
<link rel=stylesheet href=jquery/jquery-ui.css />
<link type=text/css rel=stylesheet href=jquery/template.css />
<script type=text/javascript>
	function validateFaults() {
		var imei_no = document.getElementById("imei_no").value;
		var client_no= document.getElementById("client_no").value;
		
		if (imei_no.length > 15 || imei_no.length < 15) {
			alert("Invalid IMEI: not enough digits! IMEI has about 15 digits!");
			//form.imei_no.focus();
			return false;
		}
		 else {
			 if (client_no.length <=0 || client_no.length > 11) {
					alert("Client No should neither be empty nor exceed 10 digits!");
					//form.imei_no.focus();
					return false;
			}
			if (isNaN(imei_no)) {
				alert("Please enter number value in IMEI/ Client No. !");
				//imei_no.focus();
				//phone_buyingprice.focus();
				return false;
			}
		};
		};
		function resetFaults() {
			var resetForm = window
					.confirm("Are you sure you want to reset the form?");
			if (resetForm == true) {
				alert("Reset Successful!!!");
				return true;
			} else {
				return false;
			}
			;
		};
		</script>
		
		<% 
		java.util.Date now= new java.util.Date();
		java.sql.Date SQLNow = new java.sql.Date(now.getTime());
		
		%>

</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar><%=Template.getNavigationBar()%></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content class="">
			<h2 align=center>FAULTY PHONES RECORDS</h2>
			<form method=post action=faulty onsubmit="return validateFaults()"
				onreset="return resetFaults()">
				<div align=center>
				<table cellpadding=5 border=1>
					<tr>
						<th>Input CLIENT NUMBER</th>
						<td><input type=text name=client_no id=client_no></td>
					</tr>
					<tr>
						<th>Input IMEI NUMBER</th>
						<td><input type=text name=imei_no id=imei_no></td>
					</tr>
					<tr>
						<th>FAULT DESCRIPTION</th>
						<td><textarea name=fault_description id=fault_description
								placeholder="Enter Description of Fault Here..."></textarea></td>
					</tr>
					<tr>
						<td>
						<input type=hidden name=fault_datereported value=<%=SQLNow.toString() %>>
						<input type=submit name=faultySubmit value=submit></td>
						&nbsp;&nbsp;&nbsp;
						<td><input type=reset name=faultyReset value=Reset></td>
					</tr>
				</table>
				<p><a href=listFaultyPhones>Click Here To view All Faulty Phones</a></p>
				</div>
				*****REMEMBER TO PUT ERROR EXPRESSION FOR INCASE IMEI IS UNRECOGNISED!!!
			</form>

		</div>
	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>