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
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>

<!-- 导入bootstrap的js库 -->
<script type="text/javascript" src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<title>管理员登录</title>
<script type="text/javascript">
	$(document).ready(function() {
		var height = $(document).height();
		$('.main').css('height', height);
	})
</script>
<link type="text/css" rel="stylesheet" href="<c:url value="/user/user_css/admin_login.css"/>" />
</head>
<body>

    <div class="login">
        <div class="center">
            <h1><img src="<c:url value='/user/user_images/Windows10.png'/>" ></h1>
            <!-- 提示 -->
           <c:if test="${not empty requestScope.message}">
				<span class="ts" style="font-family:'黑体';color:red;font-size: 15px">${requestScope.message}</span>
		   </c:if>
            <form action="<%=application.getContextPath()%>/AdminLoginServlet" method="post">
                <div class="inputLi">
                    <input type="text" name="user" id="user" placeholder="请输入管理员名" required>
                </div>
                <div class="inputLi">
                    <input type="password" name="pwd" id="pwd" placeholder="请输入密码" required>
                </div>
                <div class="inputLi">
                    <button type = "submit" >登录</button>
                </div>
            </form>
            <p class="tip">欢迎登录</p>
        </div>
    </div>
</body>
<script type="text/javascript">
$("#user").blur(function (){
    var user = $("#user").val();
    if(!user){
       return;   
    }
    var reg = new RegExp(/^[A-z 0-9]{6,11}$/, "i");
    if(!reg.test(user)){
        alert("用户名不合法");
        $("#user").val("");
    }
 });
$("#pwd").blur(function (){
    var pwd = $("#pwd").val();
    var reg = new RegExp(/^[._~!@#$^&* A-z 0-9]{6,}$/,"i");
    if(pwd && !reg.test(pwd)){
       alert("密码不合法");
       $("#pwd").val("");
    }
 });

$("#user").focus(function (){
	   $(".ts").text("");
});

$("#pwd").focus(function (){
	   $(".ts").text("");
});
</script>
</html>