<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>print Faulty Phone Invoice</title>


<script type=text/javascript src="Resources/jquery/jquery.js"></script>
<script type=text/javascript src="Resources/jquery/jquery-ui.js"></script>
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link type=text/css rel=stylesheet href="Resources/jquery/template.css" />


<script type=text/javascript>
	function Clickheretoprint() {
		var disp_setting = "toolbar=yes,location=no,directories=yes,menubar=yes,";
		disp_setting += "scrollbars=yes,width=700, height=400, left=100, top=25";
		var content_vlue = document.getElementById("content").innerHTML;

		var docprint = window.open("", "", disp_setting);
		docprint.document.open();
		docprint.document
				.write('</head><body onLoad="self.print()" style="width: 700px; font-size:11px; font-family:arial; font-weight:normal;">');
		docprint.document.write(content_vlue);
		docprint.document.close();
		docprint.focus();
	}
</script>

</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all"
		align=center>
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar><%=Template.getNavigationBar()%></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content class="">
			<div id=receipt>
				<h1>
					IPLACE KENYA
					</h2>
					<br>
					<h4>FAULTY PHONE INVOICE</h4>
					<div>
						<%
							java.util.Date now = new java.util.Date();
							now.toLocaleString();
						%>
						Transaction Date:
						<%=now.toLocaleString()%><br>
						<br> Transaction Code: FAULT_INV_NO-
						<c:out value="${phone.imei_no}"></c:out>
					</div>
					<table border=1>
						<tr>
							<th>CLIENT NUMBER</th>
							<th>IMEI NO</th>
							<th>PHONE <br>NAME
							</th>
							<th>PHONE <br>STORAGE
							</th>
							<th>PHONE <br>COLOR
							</th>
							<th>DATE REPORTED</th>
							<th>FAULT DESCRIPTION</th>
						</tr>
						<tr>
							<td><c:out value="${phone.client_no}"></c:out></td>
							<td><c:out value="${phone.imei_no}"></c:out></td>
							<td><c:out value="${phone.phone_name}"></c:out></td>
							<td><c:out value="${phone.phone_storage}"></c:out></td>
							<td><c:out value="${phone.phone_color}"></c:out></td>
							<td><c:out value="${phone.fault_datereported}"></c:out></td>
							<td><c:out value="${phone.fault_description}"></c:out></td>
						</tr>
						<tr>
							<td colspan=6><h5 position=top>OTHER COMMODITIES
									BOUGHT:</h5> <br> <br> <br> <br> <br>
							<br> <br>
							<br> <br>
							<br> <br> <br> <br></td>
							<td></td>
						</tr>

						<tr>
							<td colspan=6><h4 align=right>TOTAL:</h4></td>
							<td></td>
						</tr>
					</table>
					<br> <br> <br>
			</div>
		</div>
		<input type=submit onclick="Clickheretoprint()"
			value="Confirm Invoice Print...">
	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>