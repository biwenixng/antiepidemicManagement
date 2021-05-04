<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>上传健康码</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/upload_code.css'/>'
	type="text/css">
</head>
<!-- 上传健康码 -->
<body>
	<div class="page-header"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: #DDDDDD">上传健康码</h2>
	</div>
	<div class="dv1">
		<div class="dv2">
			<form action='<c:url value='/FileUploadServlet?username=${username}'/>' method="post"
				enctype="multipart/form-data">
				<c:if test="${not empty msg}">
					<p
						style="color: red; margin-left: 15px; margin-top: 5px; font-size: 15px;">${msg}</p>
				</c:if>
				<p class="sp1">健康码</p>
				<p class="ip1">
					<input type="file" name="bookimage" required="required"/>
				</p>
				<p class="ip2">健康码格式要求为： .jpg .gif .png</p>
				<p>
					<input type="submit" value="上传" class="bo" />
				</p>
			</form>
		</div>
	</div>
</body>
</html>