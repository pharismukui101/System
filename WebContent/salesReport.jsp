<%@page import='iPlaceKenya.*,java.util.*,java.sql.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report</title>
<script type=text/javascript src=jquery/jquery.js></script>
<script type=text/javascript src=jquery/jquery-ui.js></script>
<link rel=stylesheet href=jquery/jquery-ui.css />
<link type=text/css rel=stylesheet href=jquery/template.css />

<script type=text/javascript>
	function validateSearch() {
		var searchByImei = document.getElementById("searchSalesReportByImei").value;

		if (searchByImei.length > 15 || searchByImei.length < 15) {
			alert("Invalid IMEI: not enough digits! IMEI has about 15 digits!");
			//form.imei_no.focus();
			return false;

		} else {
			if (isNaN(searchByImei)) {
				alert("Please enter number value in IMEI/Buying Price!");
				//imei_no.focus();
				//phone_buyingprice.focus();
				return false;
			}
		}
	}
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
				<h2>SALES REPORT</h2>

				<div id=searchAndRefresh>
					<br>
					<form method=post action=searchSalesReport
						onsubmit="return validateSearch()">
						<input type=text name=searchSalesReportByImei
							id=searchSalesReportByImei placeholder="Search By IMEI..."><input
							type=Submit value=Search>
					</form>
					<br>
					<form method=post action=filterSalesReport>
						Filter Sales by Date From: <input type=date name=startSearchDate
							id=startSearchDate placeholder="Enter Start Search Date...">
						To: <input type=date name=endSearchDate id=endSearchDate
							placeholder="Enter End Search Date..."> <input
							type=Submit value=Filter...><br>
					</form>
					<br>
					<form method=post action=listSalesReport>
						<input type=Submit value="Refresh...">
					</form>
				</div>
				<br>
				<a href=#profitReport><input type=button value="Proceed to Monthly Profit Breakdown"></a>
				<br>
				<h3>SALES REPORT PER PHONE SOLD</h3>
				<table cellpadding=5 border=1>
					<tr>
						<th>IMEI NO</th>
						<th>PHONE NAME</th>
						<th>PHONE STORAGE</th>
						<th>PHONE COLOR</th>
						<th>DATE SOLD</th>
						<th>PHONE SELLING PRICE</th>
						<th>PHONE BUYING PRICE</th>
						<th>ACCESSORY TOTAL</th>
						<th>EXPENSE PAYABLE TOTAL</th>
						<th>SALES TOTAL</th>
						<th>EXPENSE INCURRED TOTAL</th>
						<th>SALES INFLUX TOTAL</th>
						<th>PROFIT PER<br> PHONE
						</th>

					</tr>
					<c:forEach var="phone" items="${listSalesReport}">
						<tr>
							<td><c:out value="${phone.imei_no}"></c:out></td>
							<td><c:out value="${phone.phone_name}"></c:out></td>
							<td><c:out value="${phone.phone_storage}"></c:out></td>
							<td><c:out value="${phone.phone_color}"></c:out></td>
							<td><c:out value="${phone.phone_sellingdate}"></c:out></td>
							<td><c:out value="${phone.phone_sellingprice}"></c:out></td>
							<td><c:out value="${phone.phone_buyingprice}"></c:out></td>
							<td><c:out value="${phone.accessory_total}"></c:out></td>
							<td><c:out value="${phone.phone_expense_total}"></c:out></td>
							<td><c:out value="${phone.sales_total}"></c:out></td>
							<td><c:out value="${phone.expense_incurred_total}"></c:out></td>
							<td><c:out value="${phone.sales_influx}"></c:out></td>
							<td><c:out value="${phone.phone_profitmargin}"></c:out></td>
						</tr>
					</c:forEach>
				</table>
				<br> <br>
				<h2 id=profitReport>MONTHLY PROFIT BREAKDOWN REPORT</h2>
				<table cellpadding=5 border=1>
					<tr>
						<th>YEAR SOLD</th>
						<th>JAN SALES</th>
						<th>FEB SALES</th>
						<th>MAR SALES</th>
						<th>APR SALES</th>
						<th>MAY SALES</th>
						<th>JUN SALES</th>
						<th>JUL SALES</th>
						<th>AUG SALES</th>
						<th>SEP SALES</th>
						<th>OCT SALES</th>
						<th>NOV SALES</th>
						<th>DEC SALES</th>
						<th>YEAR'S TOTAL</th>
					</tr>
					<c:forEach var="phone" items="${listProfitReport }">
						<tr>
							<td><c:out value="${phone.year_sold}"></c:out></td>
							<td><c:out value="${phone.jan_sales}"></c:out></td>
							<td><c:out value="${phone.feb_sales}"></c:out></td>
							<td><c:out value="${phone.mar_sales}"></c:out></td>
							<td><c:out value="${phone.apr_sales}"></c:out></td>
							<td><c:out value="${phone.may_sales}"></c:out></td>
							<td><c:out value="${phone.jun_sales}"></c:out></td>
							<td><c:out value="${phone.jul_sales}"></c:out></td>
							<td><c:out value="${phone.aug_sales}"></c:out></td>
							<td><c:out value="${phone.sep_sales}"></c:out></td>
							<td><c:out value="${phone.oct_sales}"></c:out></td>
							<td><c:out value="${phone.nov_sales}"></c:out></td>
							<td><c:out value="${phone.dec_sales}"></c:out></td>
							<td><c:out value="${phone.year_totals}"></c:out></td>
						</tr>
					</c:forEach>
				</table>

			</div>

		</div>
	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>