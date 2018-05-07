<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Accessory List</title>


<script type=text/javascript src="Resources/jquery/jquery.js"></script>
<script type=text/javascript src="Resources/jquery/jquery-ui.js"></script>
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link type=text/css rel=stylesheet href="Resources/jquery/template.css" />

<script type=text/javascript>
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
		<div id=content align=center class="">

			<h1>LIST OF ACCESSORIES FOR THIS PHONE</h1>

			<table cellpadding=5 border=1>
				<tr>
					<th>ACCESSORY NAME</th>
					<th>ACCESSORY PRICE</th>
				</tr>
				<c:forEach var="phone" items="${listAccessory}">
					<tr>
						<td><c:out value="${phone.accessory_name }"></c:out></td>
						<td><c:out value="${phone.accessory_price }"></c:out></td>
						<td>
							<form method=post action=#
								onsubmit="return confirmDelete()">
								<input type=hidden name=imei_no id=imei_no
									value="<c:out value='${phone.imei_no }'/>" /> <input
									type=submit value=Delete>
							</form>
						</td>

					</tr>
				</c:forEach>


			</table>

		</div>

	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>