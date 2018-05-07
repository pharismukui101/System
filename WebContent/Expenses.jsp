<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Expenses Payable</title>


<script type=text/javascript src="Resources/jquery/jquery.js"></script>
<script type=text/javascript src="Resources/jquery/jquery-ui.js"></script>
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link type=text/css rel=stylesheet href="Resources/jquery/template.css" />


</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar><%=Template.getNavigationBar()%></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content class="" align=center>
			<h4>PHONE EXPENSE PAYABLE BY CLIENT</h4>
			<form method=post action=inputPhoneExpense>
				<table cellpadding=5 border=1>
					<tr>
						<th>IMEI NUMBER:</th>
						<td><input type=text name=imei_no></td>
					</tr>
					<tr>
						<th>EXPENSE NAME</th>
						<td><input type=text name=phone_expense_name></td>
					</tr>
					<tr>
						<th>EXPENSE PRICE</th>
						<td><input type=text name=phone_expense_price></td>
					</tr>
					<tr>
						<td colspan=2>
							<div align=center>
								<input type=submit value=submit> <br> <br> <a
									href=IncurredExpense.jsp><input type=button
									value="Proceed To Expenses Incurred..."></a>
							</div>
						</td>


					</tr>
				</table>
			</form>

		</div>

	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>