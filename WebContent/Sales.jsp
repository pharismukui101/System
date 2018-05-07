<%@page import='iPlaceKenya.*,java.util.*,java.sql.*'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales</title>
<script type=text/javascript src=jquery/jquery.js></script>
<script type=text/javascript src=jquery/jquery-ui.js></script>
<link rel=stylesheet href=jquery/jquery-ui.css />
<link type=text/css rel=stylesheet href=jquery/template.css />
</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar><%=Template.getNavigationBar()%></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content class="">
			<h4 align=center>INPUT SALES DETAILS</h4>
			<div id=SalesForm align=center>
				<%
					java.util.Date date = new java.util.Date();
					java.util.Date date1 = new java.util.Date();
					java.util.Date date2 = new java.util.Date();
					java.util.Date date3 = new java.util.Date();
					date1.setMonth(date.getMonth() + 6);
					date2.setYear(date.getYear() + 1);
					date3.setYear(date.getYear() + 2);
					java.sql.Date SQLDate = new java.sql.Date(date.getTime());
					java.sql.Date SQLDate1 = new java.sql.Date(date1.getTime());
					java.sql.Date SQLDate2 = new java.sql.Date(date2.getTime());
					java.sql.Date SQLDate3 = new java.sql.Date(date3.getTime());
				%>
				<form method=post action=salesInput>
					<table border="1" cellpadding="5" id=SalesFormTable>



						<tr>
							<th>IMEI NO</th>
							<td><input type=text name=imei_no id=sales_input></td>
						</tr>
						<tr>
							<th>PHONE SELLING PRICE</th>
							<td><input type=text name=phone_sellingprice id=sales_input></td>
						</tr>
						<tr>
							<th>WARRANTY PERIOD</th>
							<td><select name=phone_warrantydate id=sales_input>
									<option></option>
									<option value=<%=SQLDate1.toString()%>>6 Months</option>
									<option value=<%=SQLDate2.toString()%>>1 Year</option>
									<option value=<%=SQLDate3.toString()%>>2 Years</option>
							</select></td>

						</tr>
						<tr>
							<th>SOLD BY:</th>
							<td><input type=text name=phone_soldBy id=phone_soldBy></td>
						</tr>
						<tr>
							<th>PLATFORM/PERSON SOLD:</th>
							<td><select name=phone_platform>
									<option></option>
									<option value="Social Media">Social Media</option>
									<option value="Return Customer">Return Customer</option>
									<option value=Broker>Broker</option>
							</select></td>
						</tr>
						<tr>
							<th>PLATFORM/PERSON NAME:</th>
							<td><input type=text name=phone_platformName
								id=phone_platformName></td>
						</tr>
						<tr>
							<td colspan=6><div align=center>
									<input type=submit id=submit value=submit> <br> <br>
									<a href=Accessories.jsp><input type="button"
										value="Move To Accessory Input"></a> <br> <br>
								</div></td>
						</tr>
					</table>
					<input type=hidden value=<%=SQLDate.toString()%>
						name=phone_sellingdate>
				</form>
				<a href="listSales">View Full Sales Lists Here...</a>
			</div>

		</div>
	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>