<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Inventory</title>


<script type=text/javascript src=jquery/jquery.js></script>
<script type=text/javascript src=jquery/jquery-ui.js></script>
<link rel=stylesheet href=jquery/jquery-ui.css />
<link type=text/css rel=stylesheet href=jquery/template.css />
<script type="text/javascript" src=jquery/validate.js></script>
<script type="text/javascript" src=jquery/signup.js></script>
<link rel=stylesheet href=jquery/signup.css />
<link rel="stylesheet"
	href="<c:url value='/resources/jquery/signup.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/jquery/jquery-ui.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/jquery/template.css'/>" />
<script type=text/javascript>
	function validateInventory() {
		var imei_no = document.getElementById("imei_no").value;
		var phone_name = document.getElementById("phone_name").value;
		var phone_storage = document.getElementById("phone_storage").value;
		var phone_color = document.getElementById("phone_color").value;
		var phone_buyingprice = document.getElementById("phone_buyingprice").value;

		if (imei_no.length > 15 || imei_no.length < 15) {
			alert("Invalid IMEI: not enough digits! IMEI has about 15 digits!");
			//form.imei_no.focus();
			return false;

		} else {
			if (isNaN(imei_no) || isNaN(phone_buyingprice)) {
				alert("Please enter number value in IMEI/Buying Price!");
				//imei_no.focus();
				//phone_buyingprice.focus();
				return false;
			}
			if (imei_no == null || imei_no.length <= 0
					|| phone_color.length <= 0 || phone_buyingprice.length <= 0
					|| phone_buyingprice == null) {
				alert("Some entries are empty!!! Please recheck your Input!");
				return false;
			}
			if (imei_no != null) {
				switch (phone_name, phone_storage) {
				case "":
					alert("Do not leave the Phone Name/Phone Storage blank!!!");
					return false;
					break;
				default:
					return true;
					break;
				}

			}

		}

	};

	function resetInventory() {
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


</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar><%=Template.getNavigationBar()%></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content class="">
		<h2 align=center>INVENTORY EDIT FORM</h2>
			<br> <br> <br>
			<form action=editPhone method=post name=InventoryForm id=InventoryForm
				onreset="return resetInventory()"
				onsubmit="return validateInventory()">
				<table border="1" cellpadding="5" id=InventoryFormTable>
					<tr>
						<th>IMEI NO</th>
						<th>PHONE NAME</th>
						<th>PHONE STORAGE</th>
						<th>PHONE COLOR</th>
						<th>PHONE BUYING PRICE</th>
					</tr>
					<tr>
						<td><input type=text name=imei_no id=imei_no value='<c:out value="${phone.imei_no}"></c:out>'></td>
						<td><input type=text name=phone_name id=phone_name value='<c:out value="${phone.phone_name}"></c:out>'> </td>
						<td><input type=text name=phone_storage id=phone_storage value='<c:out value="${phone.phone_storage}"></c:out>'>
								</td>
						<td><input type=text name=phone_color id=phone_color value='<c:out value="${phone.phone_color}"></c:out>'></td>
						<td><input type=text name=phone_buyingprice
							id=phone_buyingprice value='<c:out value="${phone.phone_buyingprice}"></c:out>'></td>
					</tr>

					<tr>
						<td colspan=6><div class=button align=center>
								<input type=submit id=submit value=submit>
								&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <input type=reset id=reset
									value=reset>
							</div></td>
					</tr>
				</table>
<p align=center>Click <a href=listInventory>Here to Go Back</a></p>

			</form>
		</div>
	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>
