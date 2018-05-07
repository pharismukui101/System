<%@page import='java.text.SimpleDateFormat'%>
<%@page import='iPlaceKenya.*,java.util.*,java.sql.*'%>



<%
	String email = request.getParameter("email"), password = request.getParameter("password"),
			name = request.getParameter("name"), role = request.getParameter("role"), email_error = "",
			password_error = "", birthday_error = "", sign_up_error = "";
	if (email == null) {//first rendering
		email = "";
		//birthday = "";
		name = "";

	} else {
		email_error = Validate.validateEmail(email);
		password_error = Validate.validatePassword(password);
		//birthday_error = Validate.validateBirthday(birthday);

		if (email_error.isEmpty() && password_error.isEmpty()) { //|| birthday_error.isEmpty()) {
			Connection c = MySQL.connect();
			if (c != null) {
				long id = MySQL.InsertUser(c, email, password, name, role);
				if (id != -1) {
					session.setAttribute(Template.USER_ID, id);
				} else {
					email_error = "That email is already in use.";
				}
			} else {
				sign_up_error = "Unable to connect to database. Try again later or troubleshoot";
			}
			MySQL.close(c);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>SignUp</title>
<script type=text/javascript src=jquery/jquery.js></script>
<script type=text/javascript src=jquery/jquery-ui.js></script>
<link rel=stylesheet href=jquery/jquery-ui.css />
<link type=text/css rel=stylesheet href=jquery/template.css />
<script type="text/javascript" src=jquery/validate.js></script>
<script type="text/javascript" src=jquery/signup.js></script>
<link rel=stylesheet href=jquery/signup.css />

<script type=text/javascript>
	
	function passwordConfirmation(){
		var password=getElementById("password").value;
		var confirmPassword=getElementById("confirmPassword").value;
		
		if (password==confirmPassword){
			return true;
		}
		else{
			if (password!=confirmPassword){
				alert("Password cofirmation Error!!!");
				return false;
			}
		}
	}
	
	
</script>

</head>
<body>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content class="">
			<form onsubmit="return passwordConfirmation()">
				<table id=table align=center>
					<tr>
						<td>email</td>
						<td><input type=email name=email placeholder='Input Email'
							value=<%=email%> /></td>
						<td id="email_error"><%=email_error%></td>
					</tr>
					<tr>
						<td>password</td>
						<td><input type=password name=password
							placeholder='Input Password' value=<%=password%> /></td>
						<td id=password_error><%=password_error%></td>
					</tr>

					<tr>
						<td>Confirm Password</td>
						<td><input type=password name=confirmPassword
							id=confirmPassword placeholder="Confirm Password..."></td>
						<td></td>
					</tr>

					<tr>
						<td>Name</td>
						<td><input type=text name=name id=name
							placeholder='Input Name' value=<%=name%> /></td>
						<td></td>
					</tr>
					<tr>
						<td>Role</td>
						<td><select name=role><option value=Administrator>Administrator</option>
								<option value=Developer>Developer</option>
								<option value=User>User</option>
						</select></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><input type=submit id=sign_up value=SUBMIT /></td>
						<td><%=sign_up_error%></td>
					</tr>

				</table>
			</form>
		</div>


	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>