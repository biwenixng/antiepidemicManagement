<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 支持多终端访问 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 导入bootstrap的css库 -->
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" />

<!-- 导入JQurey的js库 -->
<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>

<!-- 导入bootstrap的js库 -->
<script type="text/javascript" src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<title>忘记密码？</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/user/user_css/password.css"/>" />
<script type="text/javascript">
	$(document).ready(function() {
		var height = $(document).height();
		$('.main').css('height', height);
	})
</script>
</head>	
<body>
	<div class="main">
		<div class="main0">
			<div class="formBox">
				<h3>登录密码重置</h3>
				<ul>
					<li class="mainCol firLi">&gt;身份验证</li>
					<li class="mainCol">&gt;登录密码重置</li>
					<li class="mainCol lastLi">&gt;重置完成</li>
				</ul>
				<img src="../user_images/line3.png" />
				<p class="sub">
					<span>-^0^-</span> 新登录密码重置成功，请重新登录!
				</p>
				<div class="btnBox_2">
					<button onclick="window.location.href='<c:url value='/user/user_login/user_login.jsp'/>'">重新登录</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>