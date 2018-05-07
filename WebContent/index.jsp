<%@page import='iPlaceKenya.*,java.util.*,java.sql.*'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String email = request.getParameter("email"), password = request.getParameter("password"),
redirectTo = request.getParameter("redirectTo"), email_error = "", password_error = "",
login_error = "";
if (email == null || password == null) {// first rendering
email = "";
} else {
email_error = Validate.validateEmail(email);
password_error = Validate.validatePassword(password);

if (email_error.isEmpty() && password_error.isEmpty()) {
Connection c = MySQL.connect();
if (c != null) {
	long id = MySQL.selectUser(c, email, password); // authenticating existence of user in database
	if (id != -1) {
		session.setAttribute(Template.USER_ID, id);
	} else {
		login_error = "Invalid email or password.";
	}
} else {
	login_error = "Unable to connect to database. Try again later or troubleshoot";
}
MySQL.close(c);
}
}
if (redirectTo == null || redirectTo.isEmpty()) {
redirectTo = "dashboard.jsp";
}
if (session.getAttribute(Template.USER_ID) != null) {
response.sendRedirect(redirectTo);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Log In</title>
<script type=text/javascript src=jquery/jquery.js></script>
<script type=text/javascript src=jquery/jquery-ui.js></script>
<link rel=stylesheet href=jquery/jquery-ui.css />
<link type=text/css rel=stylesheet href=jquery/template.css />
<script type="text/javascript" src=jquery/validate.js></script>
<script type="text/javascript" src=jquery/signup.js></script>
<script type="text/javascript" src=jquery/javascript-display.js></script>
<link rel=stylesheet href=jquery/signup.css />


</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<h3 align=center>Welcome To iPlace Kenya!!!</h3>

		</div>
		<div id=content>
			<form method=post action=index.jsp>
				<table id=table align=center>
					<tr>
						<td></td>
						<td align=center><h4>Log In</h4></td>
						<td></td>
					</tr>
					<tr>
						<td class=align-right>email</td>
						<td><input type=email name=email placeholder='Input Email'
							data-validate=email value=<%=email%> /></td>
						<td id="email_error"><%=email_error%></td>
					</tr>
					<tr>
						<td class=align-right>password</td>
						<td><input type=password name=password data-validate=password
							placeholder='Input Password' value=<%=password%> /></td>
						<td id=password_error><%=password_error%></td>
					</tr>
					<tr>
						<td></td>

						<td></td>
					</tr>
					<tr>
						<td><input type=hidden value=<%=redirectTo%> name=redirectTo /></td>
						<td><input type=submit value="Log In" id=sign_up /></td>
						<td id=login_error><%=login_error%></td>
					</tr>

				</table>
			</form>
		</div>


	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>