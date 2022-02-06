<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>서블릿</title>
<script type="text/javascript" src="param.js"></script>
</head>
<body>
	<form action="ParamServlet" method="get">
	<label for="userid">아이디: </label><input type="text" name ="id1"id="userid"><br/>
	<label for="userage">나이: </label><input type="text" name ="age"id="userage"> <br/>
	<input type="submit" value="전송" onclick="return check()"></form>
</body>
</html>