<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Faulty Phones List</title>
<script type=text/javascript src=jquery/jquery.js></script>
<script type=text/javascript src=jquery/jquery-ui.js></script>
<link rel=stylesheet href=jquery/jquery-ui.css />
<link type=text/css rel=stylesheet href=jquery/template.css />

<script type=text/javascript>
	function validateSearch() {
		var searchByImei = document.getElementById("searchByImei").value;

		if (searchByImei.length > 15 || searchByImei.length < 15) {
			alert("Invalid IMEI: not enough digits! IMEI has about 15 digits!");
			//form.imei_no.focus();
			return false;

		} else {
			if (isNaN(searchByImei)) {
				alert("Please enter number value in IMEI Search panel!");
				//imei_no.focus();
				//phone_buyingprice.focus();
				return false;
			}
		}
	}
	
	function confirmDelete() {
		var resetForm = window
				.confirm("Are you sure you want to delete this entry?");
		if (resetForm == true) {
			alert("Delete Successful!!!");
			return true;
		} else {
			return false;
		}
		;
	};
	
</script>
</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar><%=Template.getNavigationBar()%></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content class="">

			<div align=center>
				<h2>FAULTY PHONES LIST</h2>
				<p>List of Faulty Phones are here</p>
				<div id=searchAndRefresh>
					<br>
					<form method=post action=searchFaultyPhones
						onsubmit="return validateSearch()">
						<input type=text name=searchByImei id=searchByImei
							placeholder="Search By IMEI..."><input type=Submit
							value=Search>
					</form>
					<br>
					<form method=post action=listFaultyPhones>
						<input type=Submit value="Refresh...">
					</form>
				</div>
				<table cellpadding=5 border=1>
					<tr>
						<th>CLIENT NUMBER</th>
						<th>IMEI NUMBER</th>
						<th>PHONE NAME</th>
						<th>PHONE STORAGE</th>
						<th>PHONE COLOR</th>
						<th>DATE REPORTED</th>
						<th>FAULT DECRIPTION</th>
						<th>ACTIONS</th>
					</tr>
					<c:forEach var="phone" items="${listFaultyPhones}">
						<tr>
							<td><c:out value="${phone.client_no}"></c:out></td>
							<td><c:out value="${phone.imei_no}"></c:out></td>
							<td><c:out value="${phone.phone_name}"></c:out></td>
							<td><c:out value="${phone.phone_storage}"></c:out></td>
							<td><c:out value="${phone.phone_color}"></c:out></td>
							<td><c:out value="${phone.fault_datereported}"></c:out></td>
							<td><c:out value="${phone.fault_description}"></c:out></td>
							<td><form method=post action=printInvoice>
							<input type=hidden name=client_no id=client_no
										value="<c:out value='${phone.client_no }'/>" />
									<input type=hidden name=imei_no id=imei_no
										value="<c:out value='${phone.imei_no }'/>" /> <input
										type=hidden name=phone_name id=phone_name
										value="<c:out value='${phone.phone_name }'/>" /> <input
										type=hidden name=phone_storage id=phone_storage
										value="<c:out value='${phone.phone_storage }'/>" /> <input
										type=hidden name=phone_color id=phone_color
										value="<c:out value='${phone.phone_color }'/>" /> <input
										type=hidden name=fault_datereported id=fault_datereported
										value="<c:out value='${phone.fault_datereported }'/>" /> <input
										type=hidden name=fault_description id=fault_description
										value="<c:out value='${phone.fault_description }'/>" /> <input
										type=submit value="Print Invoice...">
								</form> <br>
								<form method=post action=deleteFaultyPhone onsubmit="return confirmDelete()">
									<input type=hidden name=imei_no id=imei_no
										value="<c:out value='${phone.imei_no }'/>" /> <input
										type=submit value=Delete>
								</form></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>