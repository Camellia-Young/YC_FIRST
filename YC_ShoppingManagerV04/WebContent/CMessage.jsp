<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./style/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="./style/js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="./style/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String msg = request.getQueryString();
	%>
	<div class="container">
		<h3><%=msg%></h3>
	</div>
</body>
</html>