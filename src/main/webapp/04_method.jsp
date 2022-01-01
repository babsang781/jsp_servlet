<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>서블릿</title>
</head>
<body>
	<form action="MethodServlet" method="get">
		<input type="submit" value="get 방식으로 호출하기">
	</form>
	<form action="MethodServlet" method="post">
		<input type="submit" value="post 방식으로 호출하기">
	</form>
</body>
</html>