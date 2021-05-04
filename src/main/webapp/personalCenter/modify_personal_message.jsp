<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>修改个人信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/modify.css'/>' type="text/css">
</head>

<!-- 修改个人信息 -->
<body>
<div id="dv">
	<div class="page-header"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: black;">修改个人信息</h2>
	</div>
	<div class="st">
		<a href='<c:url value='/personalCenter/a_dizi.jsp'/>'><span class="all">修改住址</span></a> 
		<a href='<c:url value='/personalCenter/update_Phone.jsp'/>'><span class="all">修改电话号码</span></a>
		<a href='<c:url value='/personalCenter/update_Password.jsp'/>'><span class="all">修改密码</span></a>
		<a href='<c:url value='/personalCenter/update_head.jsp'/>'><span class="all">修改头像</span></a>
	</div>
</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".all").hover(function() {
			var index = $(".all").index(this);
			$(".all:eq(" + index + ")").css("color","blue")
		}, function() {
			var index = $(".all").index(this);
			$(".all:eq(" + index + ")").css("color","#444444")
		});
	});
</script>
</html>