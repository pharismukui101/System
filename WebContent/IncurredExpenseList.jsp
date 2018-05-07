<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Incurred Expense List</title>


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
		<div id=content align=center class="">
		<h1>INCURRED EXPENSES FOR THIS PHONE</h1>
		<table cellpadding=5 border=1>
		<tr>
		<th>EXPENSE NAME</th>
		<th>EXPENSE PRICE</th>
		</tr>
		<c:forEach var="iExpense" items="${listIncurredExpense}">
		<tr>
		<td><c:out value="${iExpense.IExpenseName}"></c:out></td>
		<td><c:out value="${iExpense.IExpensePrice}"></c:out></td>
		</tr>
		</c:forEach>
		</table>
		
		</div>
		
	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>