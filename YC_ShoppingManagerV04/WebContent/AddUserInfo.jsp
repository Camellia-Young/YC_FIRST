<%@page language="java" contentType="text/html; charset=UTF-8"
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
   <div class="container">
	  <form class="form-horizontal" action="UserInfoServlet" method="get">
	  	<div class="form-group">
			<label for="txtaccount" class=" text-right col-sm-4 control-label">账号</label>
	  		<div class="col-sm-8">
				<input type="text" class="form-control" id="txtaccount"
				 name="txtaccount"
				  placeholder="输入账号"/>
			</div>
	  	</div>
		
		<div class="form-group">
			<label for="txtaddress" class=" text-right col-sm-4 control-label">家庭住址</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="txtaddress"
				 name="txtaddress"
				  placeholder="家庭住址"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="txtAge" class=" text-right col-sm-4 control-label">年龄</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="txtage"
				 name="txtage"
				  placeholder="年龄"/>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="txtPassword" class=" text-right col-sm-4 control-label">口令</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" id="txtPassword"
				 name="txtPassword"
				  placeholder="口令"/>
			</div>
		</div>
		<div class="form-group">
			<label for="txtPassword2" class=" text-right col-sm-4 control-label">确认口令</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" id="txtPassword2"
				 name="txtPassword2"
				  placeholder="再输一次口令"/>
			</div>
		</div>
		<div class="form-group">
			<label for="txttel" class=" text-right col-sm-4 control-label">电话</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="txttel"
				 name="txttel"
				  placeholder="电话"/>
			</div>
		</div>
		<div class="form-group">
			
			<div class="col-sm-6  text-right">
				 <button type="submit" class="btn">确定</button>
			</div>
			<div class="col-sm-6">
				 <a class="btn btn-default">重置</a>
			</div>
		</div>
		
	  </form> 
	   
   </div>
</body>
</html>