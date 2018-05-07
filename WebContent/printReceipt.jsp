<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>print Receipt</title>


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
					</h1>
					<br>
					<h4>PURCHASE RECEIPT</h4>
					<div>
						<%
							java.util.Date now = new java.util.Date();
							now.toLocaleString();
						%>
						Print Date:
						<%=now.toLocaleString()%><br>
						<br> Transaction Code: RCPT_NO-
						<c:out value="${receiptDetails.imei_no}"></c:out>
					</div>
					<table border=1>
						<tr>
							<th>IMEI NO</th>
							<th>PHONE <br>NAME
							</th>
							<th>PHONE <br>STORAGE
							</th>
							<th>PHONE <br>COLOR
							</th>
							<th>DATE SOLD</th>
							<th>WARRANTY <br>EXPIRY DATE
							</th>
							<th>PRICE <br>BOUGHT AT
							</th>
						</tr>
						<tr>
							<td><c:out value="${receiptDetails.imei_no}"></c:out></td>
							<td><c:out value="${receiptDetails.phone_name}"></c:out></td>
							<td><c:out value="${receiptDetails.phone_storage}"></c:out></td>
							<td><c:out value="${receiptDetails.phone_color}"></c:out></td>
							<td><c:out value="${receiptDetails.phone_sellingdate}"></c:out></td>
							<td><c:out value="${receiptDetails.phone_warrantydate}"></c:out></td>
							<td><c:out value="${receiptDetails.phone_sellingprice}"></c:out></td>
						</tr>
						<tr>
							<td colspan=6><h5 position=top>ACCESSORIES BOUGHT:</h5> <c:forEach
									var="phone" items='${listAccessory}'>
									<c:out value="${phone.accessory_name}"></c:out>
									<br>
								</c:forEach>

								<h5>EXPENSES PAYABLE:</h5> <c:forEach var="phone"
									items='${listPhoneExpense}'>
									<c:out value="${phone.phone_expense_name}"></c:out>
									<br>
								</c:forEach>
							<td><br> <br> <c:forEach var="phone"
									items='${listAccessory}'>
									<c:out value="${phone.accessory_price}"></c:out>
									<br>
								</c:forEach> <br> <br> <br> <br> <c:forEach var="phone"
									items='${listPhoneExpense}'>
									<c:out value="${phone.phone_expense_price}"></c:out>
									<br>
								</c:forEach></td>



						</tr>

						<tr>
							<td colspan=6><h4 align=right>TOTAL:</h4></td>
							<td><c:out value="${receiptDetails.sales_total}"></c:out></td>
						</tr>
					</table>
					<br> <br> <br> SERVED BY: 
					<c:out value="${receiptDetails.phone_soldBy}"></c:out>
					<br>
					<br>
					<div id=footer><%=Template.getFooter()%></div>
			</div>
		</div>
		<input type=submit onclick="Clickheretoprint()"
			value="Confirm Receipt Print...">
	</div>
	
</body>
</html>