<%@page import="Bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="CheckUser.jsp"%>

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
	
		Object objImage = session.getAttribute("ImageFilePath");
		String ImageFileName = "";
		if (objImage != null) {
			//out.print("EEE");
			ImageFileName = (String) objImage;
			ImageFileName = ImageFileName.substring(2);
		}
		if(ImageFileName.equals(""))
		{
			//out.print("29");
			Object objM=session.getAttribute("CurrentUser");
			if(objM!=null)
			{
				UserInfo m=(UserInfo)objM;
				ImageFileName=m.getImageUrl();
				if(!ImageFileName.equals(""))
				{
					ImageFileName=ImageFileName.substring(2);
				}
			}
		}
	%>
	<div class="container">
		<form class="form-horizontal" action="ImageUploadServlet"
			method="post" enctype="multipart/form-data">


			<div class="form-group">
				<label for="txttel" class=" text-right col-sm-4 control-label">图片</label>
				<div class="col-sm-8">
					<input class="form-control" accept=".jpg" type="file"
						id="upload_file_id" name="upload_file_id" /> 
						<img
						src="<%=ImageFileName%>" alt="Smiley face" width="128"
						height="128"><span><%=ImageFileName%></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-4"></div>
				<div class="col-sm-6">
					<!--  <button type="submit" class="btn">返回</button> -->
					<a href="QueryUser.jsp" class="btn btn-default">返回</a>
					<button type="submit" id="idModify" name="idModify"
						class="btn btn-default">上传</button>
					
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
			if (bObj == true) {
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