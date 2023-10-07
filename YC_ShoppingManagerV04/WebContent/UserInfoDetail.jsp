<%@page import="Bean.UserInfo"%>
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
		UserInfo m = (UserInfo) session.getAttribute("ResultUser");
	%>
	<div class="container">
		<form class="form-horizontal" action="UserInfoModifyServlet"
			method="get">
			<div class="form-group">
				<label for="txtaccount" class=" text-right col-sm-4 control-label">账号</label>
				<div class="col-sm-8">
					<input type="text" readonly="readonly" class="form-control" id="txtaccount"
						name="txtaccount" value="<%=m.getAccount()%>" />
				</div>
			</div>

			<div class="form-group">
				<label for="txtaddress" class=" text-right col-sm-4 control-label">家庭住址</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="txtaddress"
						name="txtaddress" value="<%=m.getAddress()%>" />
				</div>
			</div>

			<div class="form-group">
				<label for="txtAge" class=" text-right col-sm-4 control-label">年龄</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="txtage" name="txtage"
						value="<%=m.getAge()%>" />
				</div>
			</div>



			<div class="form-group">
				<label for="txttel" class=" text-right col-sm-4 control-label">电话</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="txttel" name="txttel"
						value="<%=m.getTel()%>" />

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-4"></div>
				<div class="col-sm-6">
					<!--  <button type="submit" class="btn">返回</button> -->
					<a href="QueryUser.jsp" class="btn btn-default">返回</a>
					<button id="idModify" name="idModify" class="btn btn-default">确认修改</button>
				</div>

			</div>

		</form>

	</div>
	<!-- 显示弹出对话框 -->
	<!-- ---------------------------------------------------------- -->
	<div class="modal fade bd-example-modal-sm" id="myModal" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content" style="padding: 0.4rem 0.4rem;">
				<p class="text-center mb-0">
					<span class="fa fa-clone-circle text-success mr-1"
						aria-hidden="true" id="faColor"></span> <span id="infoMoal">提交成功</span>
				</p>
			</div>
		</div>
	</div>
	<script>
		function ShowModal(info, color, flag) {
			$('#myModal').modal('show');
			// 移除原来图标样式
			$("#faColor").removeClass();
			color += " fa  mr-1";
			// 增加传入样式
			$("#faColor").addClass(color);
			// 显示文字信息
			$("#infoMoal").html(info);
			// 是否自动关闭
			if (flag > 0)
				setTimeout(function() {
					$("#myModal").modal("hide")
				}, 1200);
		}
	</script>
	<!-- ---------------------------------------------------------- -->

	<%
		String msgOK = "修改成功！";
		String msgError = "修改失败，请联系管理员！";
		Object obj = session.getAttribute("Msg");
		if (obj != null) {

			boolean bObj = (boolean) obj;
			if (bObj==true) {
				String str_script = "<script>ShowModal('" + msgOK + "', 'green', 10);</script>";
				out.println(str_script);

			} else {

				String str_script1 = "<script>ShowModal('" + msgError + "', 'red', 10);</script>";
				out.println(str_script1);
			}

		}
		session.removeAttribute("Msg");
	%>
</body>
</html>