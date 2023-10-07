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
<div class="container">
		<form class="form-horizontal" action="UserInfoDeleteServlet"
			method="post">
			<div class="form-group">
				<label for="txt_account" class="col-sm-3 control-label"> 账号
				</label>
				<div class="col-sm-9">
					
					<input class="form-control" type="text" id="txt_account"
						name="txt_account" placeholder="请输入删除的账号" />
				
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
		String msgOK = "删除成功！";
		String msgError = "删除失败，请联系管理员！";
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