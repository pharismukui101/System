<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Personal Expenditures</title>


<script type=text/javascript src="Resources/jquery/jquery.js"></script>
<script type=text/javascript src="Resources/jquery/jquery-ui.js"></script>
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link rel=stylesheet href="Resources/jquery/jquery-ui.css" />
<link type=text/css rel=stylesheet href="Resources/jquery/template.css" />


</head>
<body>
	<%
		java.util.Date now = new java.util.Date();
		java.sql.Date SQLDateNow = new java.sql.Date(now.getTime());
	%>
	<div id=container class="ui-widget ui-widget-content ui-corner-all">
		<div id=header class="ui-widget-header ui-corner-all">
			<div id=navigation_bar><%=Template.getNavigationBar()%></div>
			<div id=account><%=Template.getAccountLinks(session.getAttribute(Template.USER_ID))%></div>
		</div>
		<div id=content align=center class="">
			<h4>PERSONAL EXPENDITURES INPUT</h4>
			<form method=post action=personalExpenditureInput>
				<table cellpadding=5 border=1>
					<tr>
						<th>EXPENDITURE NAME</th>
						<td><input type=text name=pExpenditureName
							id=pExpenditureName></td>
					</tr>
					<tr>
						<th>EXPENDITURE COST</th>
						<td><input type=text name=pExpenditurePrice
							id=pExpenditurePrice></td>
					</tr>
					<tr>
						<td colspan=2><input type=hidden name=pExpenditureDate
							value="<%=SQLDateNow.toString()%>"> <input type=submit
							value=submit></td>
					</tr>
				</table>
			</form>
		</div>

	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>