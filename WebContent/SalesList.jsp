<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Sales List</title>
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
		<div class="" align="center">


			<h2>SALES LIST</h2>
			<p>List of Sold Phones are here</p>
			<div id=searchAndRefresh>
				<br>
				<form method=post action=searchSales
					onsubmit="return validateSearch()">
					<input type=text name=searchByImei id=searchByImei
						placeholder="Search By IMEI..."><input type=Submit
						value=Search>
				</form>
				<br>
				<form method=post action=listSales>
					<input type=Submit value="Refresh...">
				</form>
			</div>
			<a href="Sales.jsp">Go Back to Sales Input</a>
			<table cellpadding=5 border=1>
				<tr>
					<th>IMEI NUMBER</th>
					<th>PHONE NAME</th>
					<th>PHONE STORAGE</th>
					<th>PHONE COLOR</th>
					<th>PHONE SELLING PRICE</th>
					<th>PHONE SELLING DATE</th>
					<th>PHONE WARRANTY DATE</th>
					<th>SOLD BY</th>
					<th>ACCESSORY TOTAL</th>
					<th>TOTAL EXPENSE PAYABLE</th>
					<th>TOTAL AMOUNT PAYABLE</th>
					<th>ACTIONS</th>
				</tr>
				<c:forEach var="phone" items="${listSales}">
					<tr>
						<td><c:out value="${phone.imei_no}"></c:out></td>
						<td><c:out value="${phone.phone_name}"></c:out></td>
						<td><c:out value="${phone.phone_storage}"></c:out></td>
						<td><c:out value="${phone.phone_color}"></c:out></td>
						<td><c:out value="${phone.phone_sellingprice}"></c:out></td>
						<td><c:out value="${phone.phone_sellingdate}"></c:out></td>
						<td><c:out value="${phone.phone_warrantydate}"></c:out></td>
						<td><c:out value="${phone.phone_soldBy}"></c:out></td>
						<td><c:out value="${phone.accessory_total}"></c:out></td>
						<td><c:out value="${phone.phone_expense_total}"></c:out></td>
						<td><c:out value="${phone.sales_total}"></c:out></td>

						<td>
							<div id=content>
								<form method=post action=printReceipt>

									<input type=hidden name=imei_no id=imei_no
										value="<c:out value='${phone.imei_no }'/>" /> <input
										type=hidden name=phone_name id=phone_name
										value="<c:out value='${phone.phone_name}'/>" /> <input
										type=hidden name=phone_storage id=phone_storage
										value="<c:out value='${phone.phone_storage}'/>" /> <input
										type=hidden name=phone_color id=phone_color
										value="<c:out value='${phone.phone_color}'/>" /> <input
										type=hidden name=phone_sellingprice id=phone_sellingprice
										value="<c:out value='${phone.phone_sellingprice}'/>" /> <input
										type=hidden name=phone_sellingdate id=phone_sellingdate
										value="<c:out value='${phone.phone_sellingdate}'/>" /> <input
										type=hidden name=phone_warrantydate id=iphone_warrantydate
										value="<c:out value='${phone.phone_warrantydate}'/>" /> <input
										type=hidden name=phone_soldBy id=phone_soldBy
										value="<c:out value='${phone.phone_soldBy}'/>" /> <input
										type=hidden name=sales_total id=sales_total
										value="<c:out value='${phone.sales_total}'/>" /> <input
										type=hidden name=accessory_total id=accessory_total
										value="<c:out value='${phone.accessory_total}'/>" /> <input
										type=hidden name=phone_expense_total id=phone_expense_total
										value="<c:out value='${phone.phone_expense_total}'/>" /> <input
										type=submit value="Print Receipt">
								</form>
							</div> <br>
							<form method=post action=listAccessory>
								<input type=hidden name=imei_no id=imei_no
									value="<c:out value='${phone.imei_no }'/>" /> <input
									type=submit value="Accessories Bought...">
									</form>
							<br>
							<form method=post action=listPhoneExpense>
								<input type=hidden name=imei_no id=imei_no
									value="<c:out value='${phone.imei_no }'/>" /> <input
									type=submit value="Expenses Payable...">
									</form>
							<br>
							<form method=post action=listIncurredExpense>
								<input type=hidden name=imei_no id=imei_no
									value="<c:out value='${phone.imei_no }'/>" /> <input
									type=submit value="Expenses Incurred...">
									</form>
							<br>
							<form method=post action=deleteSoldPhone onsubmit="return confirmDelete()">
								<input type=hidden name=imei_no id=imei_no
									value="<c:out value='${phone.imei_no }'/>" /> <input
									type=submit value=Delete>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>

			<a href="Sales.jsp">Go Back to Sales Input</a>
		</div>

	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>