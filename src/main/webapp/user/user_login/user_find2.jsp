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
<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" />

<!-- 导入JQurey的js库 -->
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>

<!-- 导入bootstrap的js库 -->
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>

<title>忘记密码？</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/user/user_css/password.css"/>" />

<script type="text/javascript">
$(document).ready(function() {
	var height = $(document).height();
	$('.main').css('height' , height);		
})
</script>
</head>
<body>
 <a href="<c:url value="/user/user_login/user_login.jsp"/>">返回登录页</a>
	<div class="main">
		<div class="main0">
			<div class="formBox">
				<h3>登录密码重置</h3>
				<ul>
					<li class="mainCol firLi">&gt;手机号验证</li>
					<li class="mainCol">&gt;登录密码重置</li>
					<li class="lastLi">&gt;重置完成</li>
				</ul>
				<img src="<c:url value="/user/user_images/line2.png"/>" />
				<form
					action="<%=application.getContextPath()%>/FindPassword2Servlet"
					method="post">
					<!-- 隐藏表单域 -->
					<input type="hidden" name="mobile" value="${requestScope.mobile}"/>
					<div class="txt">
						<label>重置密码&nbsp;:</label> <input type="password" class="ttxt"
							name="pwd" id="newpwd1" placeholder="请输入新登录密码" />
					</div>
					<div class="txt">
						<label>确认密码&nbsp;:</label> <input type="password" class="ttxt"
							id="newpwd2" placeholder="请再次输入新密码" />
					</div>
					<div class="btnBox">
						<input type="submit" class="xiayibu" id="next" value="下一步" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

$("#newpwd1").blur(function (){
	var reg = new RegExp(/^[A-z 0-9]{6,16}$/,"i");
	var newpwd1 = $("#newpwd1").val();
	if(newpwd1){
	    if(!reg.test(newpwd1)){
		    alert("密码必须是6-16位的字母或数字");
		    $("#newpwd1").val("");
		} 
	}
});
     
$("#next").click(function (){
	   var newpwd1 = $("#newpwd1").val();
	   var newpwd2 = $("#newpwd2").val();
	   if(!newpwd1){
          alert("请输入新密码");
          return false;
       }else if(!newpwd2){
    	   alert("请确认新密码");
    	   return false;
       }else if(newpwd1 !=newpwd2){
   	       alert("两次密码不一致，请重新输入");
   	       $("#newpwd1").val("");
   	       $("#newpwd2").val("");
   	       return false;
      }
});
</script>
</html>