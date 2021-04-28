<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<!-- 支持多终端访问 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 导入bootstrap的css库 -->
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.min.css" />" />

<!-- 导入JQurey的js库 -->
<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>

<!-- 导入bootstrap的js库 -->
<script type="text/javascript" src="<c:url value="/bootstrap/js/bootstrap.min.js" />"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var height = $(document).height();
		$('.main').css('height', height);
	})
</script>
<title>注册</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/user/user_css/zhuce.css" />"/>
</head>

<body>
	<div class="main">
		<div class="main0">
			<div class="main_left">
				<img src="<c:url value="/user/user_images/zhuce-image-3.png"/>" class="theimg" /> <img
					src="<c:url value="/user/user_images/zhuce-image-2.png"/>" class="secimg" /> <img
					src="<c:url value="/user/user_images/zhuce-image-1.png"/>" class="firimg" />
			</div>
			<div class="main_right">
				<div class="main_r_up">
					<img src="<c:url value="/user/user_images/user.png"/>" />
					<div class="pp">注册</div>
				</div>
				<hr />
				
				<form
					action="<%=application.getContextPath()%>/UserRegistered2Servlet"
					method="post">
					<!-- 隐藏表单域 -->
					<input type="hidden" name="idnumber"  value="${requestScope.idnumber}"/>
					<input type="hidden" name="name"      value="${requestScope.name}"/>
					<input type="hidden" name="residence" value="${requestScope.residence}"/>
					<input type="hidden" name="phone"     value="${requestScope.phone}"/>
					<div class="txt txt0">
						<span style="letter-spacing: 8px;">用户名:</span> <input name="uid"
							type="text" class="txtphone" id="uid" placeholder="请输入用户名" />
					</div>
					<div class="txt txt0">
						<span style="letter-spacing: 4px;">登录密码:</span> <input name=""
							type="password" class="txtphone" id="pwd" placeholder="请输入密码" />
					</div>
					<div class="txt txt0">
						<span style="letter-spacing: 4px;">重复密码:</span> <input name="newpwd"
							type="password" class="txtphone" id="newpwd"
							placeholder="请再次输入密码" />
					</div>
					<div >
						<input type="submit" class="xiayibu" id="zc" value="确认注册"/>
					</div>
				</form>
				<!-- 注册提示 -->
					<c:if test="${not empty requestScope.message}">
					   <span class="ts" style="font-family:'黑体';color:red;font-size: 30px">${requestScope.message}</span>
					   <span><a href="<c:url value="/user/user_login/user_login.jsp"/>">前往登录</a></span>
					</c:if>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#uid").blur(function() {
		var uid = $("#uid").val();
		var reg = new RegExp(/^[A-z 0-9]{6,11}$/, "i")
		if (uid && !reg.test(uid)) {
			alert("用户名只能是6-11位的字母或数字");
			$("#uid").val("");
			return;
		}else if(uid){
			$.post({
				"url" : "<c:url value='/UserRegisteredAjax2Servlet'/>",
				"data" : "uid=" + $("#uid").val(),
				"dataType" : "text",
				"success" : function(data) {
					if (data == "该用户名已存在!") {
						alert(data);
						$("#uid").val("");
					}
				}
			});
	    }
	});
	$("#pwd").blur(function() {
		var pwd = $("#pwd").val();
		var reg = new RegExp(/^[._~!@#$^&* A-z 0-9]{6,16}$/, "i");
		if (pwd && !reg.test(pwd)) {
			alert("请输入6~16位字符");
			$("#pwd").val("");
			return;
		}
	});
	$("#newpwd").blur(function() {
		var pwd = $("#pwd").val();
		var newpwd = $("#newpwd").val();
		if(pwd && newpwd){
		  if (pwd != newpwd) {
			alert("两次密码不一致，请重试");
			$("#pwd").val("");
			$("#newpwd").val("");
			return;
		  }
		}
	});

	$("#zc").click(function (){
		var uid = $("#uid").val();
		var pwd = $("#pwd").val();
		var newpwd = $("#newpwd").val();
		if(!uid){
           alert("请输入用户名");
           return false;
	    }
	    if(!pwd){
	    	alert("请输入密码");
	        return false;
		}
	    if(!newpwd){
	    	alert("请确认密码");
	        return false;
		}
    });
</script>

</html>