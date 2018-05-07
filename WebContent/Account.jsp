<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Account Settings</title>


<script type=text/javascript src="Resources/jquery/jquery.js"></script>
<script type=text/javascript src="Resources/jquery/jquery-ui.js"></script>
<link rel=stylesheet href="Resources/jquery/jquery-ui.css"/>
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
		<h1>ACCOUNTS MANAGEMENT</h1>
		<a href=SignUp.jsp>Click Here</a> to Add A User....
		<br>
		<br>
		<h4>LIST OF ALLOWED USERS</h4>>
		<table border=1 cellpadding=5>
		<tr>
		<th>USER ID</th>
		<th>USER EMAIL</th>
		<th>USER NAME</th>
		<th>USER PASSWORD</th>
		<th>ACTIONS</th>
		</tr>
		<c:forEach var="user" items="${listAllUsers}">
		<tr>
		<td><c:out value='${user.user_id }'/></td>
		<td><c:out value='${user.user_email }'/></td>
		<td><c:out value='${user.user_name }'/></td>
		<td><input type=password value="<c:out value='${user.user_password }'/>"></td>
		<td>
		<form method=post action=deleteUser>
		<input type=hidden name=user_id value=<c:out value='${user.user_id }'/>>
		<input type=submit value="Delete User...">
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