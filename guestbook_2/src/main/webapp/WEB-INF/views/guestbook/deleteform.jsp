<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DeleteForm</title>
</head>
<body>
	<form action="delete.jsp" method="post">
		<input type="hidden" name="no"
			value="<%=request.getParameter("no")%>"> Password: <input
			type="password" name="password"> <input type="submit"
			value="Confirm">
	</form>
</body>
</html>