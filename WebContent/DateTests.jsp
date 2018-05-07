<%@page import='iPlaceKenya.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Date Tests</title>


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
		<div id=content class="">
<%
java.util.Date now=new java.util.Date();
java.sql.Date SQLDate= new java.sql.Date(now.getTime());
%>
getYear-> <%=SQLDate.getYear()%><br>
getDate-> <%=SQLDate.getDate() %><br>
toLocalDate-> <%=SQLDate.toLocalDate() %>

		</div>
		
	</div>
	<div id=footer><%=Template.getFooter()%></div>
</body>
</html>