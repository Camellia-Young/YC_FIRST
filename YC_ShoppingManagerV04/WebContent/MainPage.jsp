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
<%@ include file="CheckUser.jsp" %>
	<div class="container">
		<div>
			<h3 class="text-center modal-title">后台管理系统</h3>
		</div>
		<div class="row clearfix">
			<div class="col-md-3 column">
				<jsp:include page="LeftBar.jsp"></jsp:include>
			</div>
			<div class="col-md-9 column">
				<div class="panel panel-default">
					
						<iframe src="Welcome.htm" class="col-md-12" width="1200"
							frameborder="0" height="600" name="iframe_content"> </iframe>
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>