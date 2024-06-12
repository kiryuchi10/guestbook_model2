<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook_2</title>
</head>
<body>
<h1>guestbook_2</h1>
<ul>
	<li><a 
		href="<%= request.getContextPath() + "/guestbook/" %>">
			Model1 방식</a></li>
	<li><a 
		href="<%= request.getContextPath() + "/el" %>">Model 2 방식 (Servlet + JSP)</a></li>
</ul>


</body>
</html>