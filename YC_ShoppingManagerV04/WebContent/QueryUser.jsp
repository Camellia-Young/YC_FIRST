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
	<%@ include file="CheckUser.jsp"%>
	<%
		boolean isBack = false;
		Object obj1 = session.getAttribute("IsBack");
		if (obj1 == null) {

		} else {
			isBack = (boolean) obj1;
		}
	%>
	<div class="container">
		<form class="form-horizontal" action="UserInfoQueryServlet"
			method="post">
			<div class="form-group">
				<label for="txt_account" class="col-sm-3 control-label"> 账号
				</label>
				<div class="col-sm-9">
					<%
						if (isBack == true) {
					%>
					<input class="form-control" type="text" id="txt_account"
						name="txt_account" placeholder="查无此人" />

					<%
						} else {
					%>
					<input class="form-control" type="text" id="txt_account"
						name="txt_account" placeholder="请输入查询的账号" />
					<%
						}
					%>
				</div>

			</div>
			<div class=" form-group">
				<div class="col-sm-3"></div>
				<div class="col-sm-9">
					<button class="btn btn-default" type="submit">查询</button>
				</div>
			</div>

		</form>


	</div>
</body>
</html>
