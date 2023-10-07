<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="style/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="style/css/codepen.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="style/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="style/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		console.log("ready ...");
		$("#txt_account,#txt_password").focus(function() {
			console.log("enter focus");
			$("#div_account,#div_password").removeClass("has-error");
		});

	});

	function setError() {
		$("#div_account,#div_password").addClass("has-error");
	}
</script>
</head>
<body>
	<%
		Object fromServer = session.getAttribute("Error");
		int errorType = 0;
		if (fromServer != null) {
			errorType = (int) fromServer;
			session.removeAttribute("Error");
		}
	%>
	<div class="container">
		<!-- <div class="panel panel-default"> -->
		

			<!-- <div class=" panel-heading"> -->
				<!-- <h3 class="panel-title text-center">登录</h3> -->
				
			<!-- </div> -->


			<!-- <div class=" panel-body"> -->
			<div class="login-box">
				<h2>Login</h2>
				<form role="form" action="UserInfoLoginServlet" method="post">
					<!-- <div id="div_account" class="form-group"> -->
					<div id="div_account" class="user-box">
						<label for="txt_account"></label> <input type="text"
							class="form-control" id="txt_account" name="txt_account"
							 />
					</div>
					<!-- <div id="div_password" class="form-group"> -->
					<div id="div_password" class="user-box">
						<label for="txt_password"></label>
						<input type="password"
							class="form-control" id="txt_password" name="txt_password"
							 />
					</div>

				    <button type="submit" class="a">登录</button>
					<!-- <a href="register.jsp" class="btn btn-default">注册</a> -->
					<button type="submit" class="a">注册</button>
				</form>
			</div>
		</div>


	<!-- </div> -->

	<%
		if (errorType != 0) {
			out.println("<script>setError();</script>");
		}
	%>

</body>
</html>
