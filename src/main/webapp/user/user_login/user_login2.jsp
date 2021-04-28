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

<!-- 导入JQurey.cookie插件 -->
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jquery.cookie.js"/>"></script>

<!-- 导入bootstrap的js库 -->
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<title>用户登录</title>
<script type="text/javascript">
	$(document).ready(function() {
		var height = $(document).height();
		$('.main').css('height', height);
	})
</script>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/user/user_css/user_login.css"/>" />
</head>
<body>
	<div class="main">
		<div class="container-fluid">
			<div class="main0">
				<div class="main_left">
					<img src="<c:url value="/user/user_images/login-image-3.png"/>"
						class="theimg" /> <img
						src="<c:url value="/user/user_images/login-image-2.png"/>"
						class="secimg" /> <img
						src="<c:url value="/user/user_images/login-image-1.png"/>"
						class="firimg" />
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
					<!-- 提示 -->
                    <c:if test="${not empty requestScope.message}">
                         <span class="ts" style="font-family:'黑体';color:red;font-size: 30px">${requestScope.message}</span>
                    </c:if>
					<form action="<%=application.getContextPath()%>/UserLogin2Servlet" method="post">
						<div class="txt">
							<span style="letter-spacing: 8px;">手机号:&nbsp;</span> <input
								name="sjhm" type="text" class="txtphone" id="mobile"
								placeholder="请输入手机号" />
						</div>
						<div class="txt">
							<p><span style="float: left; letter-spacing: 8px;">验证码:</span> <input
								name="yzm" type="text" class="txtyzm" id="benPhone" disabled
								placeholder="请输入手机验证码" /> &nbsp;
								<input type="button" class="btn btn-info" id="btnYZM" onclick="getYZM()"
								value="发送验证码" /><span style="color:red" id="msg"></span></p>

						</div>
						<div class="xieyi">
							<p>
								<a href="<c:url value="/user/user_login/user_login.jsp"/>">密码登录</a>
							</p>
						</div>
						<div>
							<p></p>
							<input type="submit" id="dl" value="登录" class="xiayibu" />
						</div>
					</form>
					<div>
						<a href="<c:url value="/user/user_login/doctor_login.jsp"/>">校医登录入口</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$("#mobile").blur(function (){
		var reg = new RegExp(/^1[3456789]\d{9}$/, "i");
		var val = $("#mobile").val();
		  if (!val) {
			$("#benPhone").attr("disabled",true);
			return;
		  }
		if (!reg.test(val)) {
			alert("电话号码不合法");
			$("#mobile").val("");
		}
		}); 
	$("#benPhone").blur(function (){
       var reg = new RegExp(/^[A-z 0-9]{6}$/,"i");
       var val = $("#benPhone").val();
       if (!val) {
			return;
		}
		if (val && !reg.test(val)) {
			alert("验证码不合法");
			$("#benPhone").val("");	
		}

	});
	$("#mobile").focus(function (){
		   $(".ts").text("");
	});
	
</script>

<script type="text/javascript">
	//发送验证码时添加cookie
	function addCookie(name, value, expiresHours) {
		//判断是否设置过期时间,0代表关闭浏览器时失效
		if (expiresHours > 0) {
			var date = new Date();
			date.setTime(date.getTime() + expiresHours * 1000);
			$.cookie(name, escape(value), {
				expires : date
			});
		} else {
			$.cookie(name, escape(value));
		}
	}
	//修改cookie的值
	function editCookie(name, value, expiresHours) {
		if (expiresHours > 0) {
			var date = new Date();
			date.setTime(date.getTime() + expiresHours * 1000); //单位是毫秒
			$.cookie(name, escape(value), {
				expires : date
			});
		} else {
			$.cookie(name, escape(value));
		}
	}
	//根据名字获取cookie的值
	function getCookieValue(name) {
		return $.cookie(name);
	}
	//加载页面时获取Cookie并判断
	$(document).ready(function() {
		var obj1 = $("#btnYZM");
		v = getCookieValue("secondsremained");//获取cookie值
		if (v > 0) {
			settime(obj1);//开始倒计时
		}
	});
	//定义倒计时变量
	var countdown;
	//点击函数
	function getYZM() {
		var mobile = $("#mobile").val();
		var obj = $("#btnYZM");
		if (mobile) {
			$.post({
				"url" : "<c:url value='/FindPasswordAjaxServlet'/>",
				"data" : "mobile=" + $("#mobile").val(),
				"dataType" : "text",
				"success" : function(data) {
					if (data == "该手机号码不存在") {
						alert(data);
					} else {
						addCookie("secondsremained", 60, 60);//添加cookie记录,有效时间60s
						settime(obj);//开始倒计时
						$(".txtyzm").removeAttr("disabled");	
						$.get({
                          "url" : "<c:url value='/UserLoginCodeServlet'/>?method=sendSms&mobile="+$("#mobile").val(),
                          "dataType":"text",
                          "data":null,
                          "success" : function(data) {
                              $("#msg").html(data);
                          }
					    });					
					}
				}
			});
		} else {
			alert("请输入手机号");
		}
	}
	// 倒计时函数
	function settime(obj) { //发送验证码倒计时
		countdown = getCookieValue("secondsremained");
		if (countdown === "0") {
			obj.attr('disabled', false);
			//obj.removeattr("disabled");
			obj.val("发送验证码");
			return;
		} else {
			obj.attr('disabled', true);
			obj.val("重新发送(" + countdown + ")");
			countdown--;
			editCookie("secondsremained", countdown, countdown + 2);
		}
		setTimeout(function() {
			settime(obj)
		}, 1000)
	}
	$("#dl").click(function() {
		var mobile = $("#mobile").val();
		var benPhone = $("#benPhone").val();
		if (mobile == "") {
			alert("请输入手机号码");
			return false;
		} else if (benPhone == "") {
			alert("请输入验证码");
			return false;
		}
	});
</script>
</html>