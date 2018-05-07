<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Accessories Input</title>


<script type=text/javascript src="Resources/jquery/jquery.js"></script>
<script type=text/javascript src="Resources/jquery/jquery-ui.js"></script>
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link type=text/css rel=stylesheet href="Resources/jquery/template.css" />

<script type=text/javascript>
createEditableSelect(getElementById("accessory_name"));
</script>

</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar><%=Template.getNavigationBar()%></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content class="" align=center>
		<h4>ACCESSORY INPUT</h4>
			<form method=post action=inputAccessory>
				<table cellpadding=5 border=1>
					<tr>
						<th>IMEI NUMBER:</th>
						<td><input type=text name=imei_no></td>
					</tr>
					<tr>
						<th>ACCESSORY NAME:</th>
						<td><input type=text name=accessory_name id=accessory_name selectBoxOptions=" ;null;screen protector;back cover;"></td>
					</tr>
					<tr>
						<th>ACCESSORY PRICE:</th>
						<td><input type=text name=accessory_price></td>
					</tr>
					<tr>
						<td colspan=2>
							<div align=center>
								<input type=submit value=submit> <br> <br> <a
									href=Expenses.jsp><input type=button
									value="Proceed To Expenses Input..."></a>
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