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

<!-- 导入JQuery的js库 -->
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>

<!-- 导入JQuery.cookie插件 -->
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jquery.cookie.js"/>"></script>
	
<!-- 导入JQuery中的MD5插件 -->	
<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery.md5.js"/>"></script>

<!-- 导入bootstrap的js库 -->
<script type="text/javascript" src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<title>用户登录</title>
<script type="text/javascript">
	$(document).ready(function() {
		var height = $(document).height();
		$('.main').css('height', height);
	})
</script>
<link type="text/css" rel="stylesheet" href="<c:url value="/user/user_css/user_login.css"/>" />
	<%
		String path = request.getContextPath();
	    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
</head>
<body class = "exit">
	<div class="main">
		<div class="container-fluid">
			<div class="main0">
				<div class="main_left">
					<img src="<c:url value="/user/user_images/login-image-3.png"/>" class="theimg" /> <img
						 src="<c:url value="/user/user_images/login-image-2.png"/>" class="secimg" /> <img
						 src="<c:url value="/user/user_images/login-image-1.png"/>" class="firimg" />
				</div>
				<div class="main_right">
					<div class="main_r_up">
						<img src="<c:url value="/user/user_images/user.png"/>" />
						<div class="pp">学生登录</div>
					</div>
					<div class="sub">
						<p>
							还没有账号？<a href="<c:url value="/user/user_login/user_registered.jsp"/>"><span class="blue">立即注册&nbsp;&nbsp;&nbsp;</span></a>
						</p>
					</div>
					<!-- 登录提示 -->
					<c:if test="${not empty requestScope.message}">
					   <span class="ts" style="font-family:'黑体';color:red;font-size: 30px">${requestScope.message}</span>
					</c:if>
					<form action="<%=basePath%>userLoginServlet/login" method="post">
						<div class="txt">
							<span style="letter-spacing: 8px;">用户名:</span> <input name="uid"
								type="text" class="txtphone" id="uid" placeholder="请输入用户名" />
						</div>
						<div class="txt">
							<span style="letter-spacing: 4px;">登录密码:</span> <input name="pwd"
								type="password" class="txtphone" id="upwd"  placeholder="请输入登录密码" />
						</div>
						<div class="xieyi">
							<p>
								<a href="<c:url value="/user/user_login/user_login2.jsp"/>">手机验证登录</a>
							</p>
						</div>
						<div class="xieyi">
							<p>
								<input name="rememenber" id="rememenber" type="checkbox" value="选中了" checked="checked" />记住密码
								<a href="<c:url value="/user/user_login/user_find.jsp"/>"><span class="blue"
									style="padding-left: 130px; cursor: pointer">忘记密码？</span></a>
							</p>
						</div>
						<div>&nbsp;</div>
						<div>
							<input type="submit" value="登录" id="tj" class="xiayibu" />
						</div>
					</form>
					<div><a href="<c:url value="/user/user_login/doctor_login.jsp"/>">校医登录入口</a></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

$(document).ready(function() {
     	var kk = $.cookie("judge");
     	if(kk !=null)
        var userName = $.cookie("username"); //获取cookie中的用户名    
        var pwd =  $.cookie("password"); //获取cookie中的登陆密码    
        if(pwd){//密码存在的话把“记住用户名和密码”复选框勾选住    
           $("[name='rememenber']").attr("checked","true");    
        }    
        if(userName!=""){//用户名存在的话把用户名填充到用户名文本框 
           $("#uid").val(userName);    
        }else{
       	 $("#uid").val("");
        }
        if(pwd!=""){//密码存在的话把密码填充到密码文本框    
       	  $("#upwd").val(pwd); 
        }else{
       	 $("#upwd").val(""); 
        }
});    
</script>

<script type="text/javascript">
   $("#tj").click(function () {
       var uid = $("#uid").val();
       var pwd = $("#upwd").val();
       var aa = $("input[type='checkbox']").is(":checked");//获取选中状态
       if(uid ==""){
           alert("请输入用户名");
           return false;
    	   
       }else if(pwd == ""){
           alert("请输入密码");
           return false;
       }
   });
   
   $("#uid").blur(function (){
      var uid = $("#uid").val();
      if(!uid){
         return;   	
      }
      var reg = new RegExp(/^[A-z 0-9]{6,11}$/, "i");
      if(!reg.test(uid)){
          alert("用户名不合法");
          $("#uid").val("");
      }
   });
   
   $("#upwd").blur(function (){
      var pwd = $("#upwd").val();
      var reg = new RegExp(/^[._~!@#$^&* A-z 0-9]{6,16}$/,"i");
      if(pwd && !reg.test(pwd)){
         alert("密码不合法");
         $("#upwd").val("");
      }
   });
   
   $("#uid").focus(function (){
	   $(".ts").text("");
   });

   $("#upwd").focus(function (){
	   $(".ts").text("");
   });
</script>
</html>