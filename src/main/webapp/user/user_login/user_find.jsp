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

<title>忘记密码？</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/user/user_css/password.css"/>" />
<script type="text/javascript">
	$(document).ready(function() {
		var height = $(document).height();
		$('.main').css('height', height)
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
					<li class="mainCol firLi">&gt;身份验证</li>
					<li>&gt;登录密码重置</li>
					<li class="lastLi">&gt;重置完成</li>
				</ul>
				<img src="<c:url value='/user/user_images/line.png'/>" />
				<form
					action="<%=application.getContextPath()%>/FindPassword1Servlet"
					method="post">
					<div class="txt">
						<label>手机号码&nbsp;:</label> <input type="text" id="mobile"
							name="phone" placeholder="请输入注册手机号" />
					</div>
					<div class="txt">
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 验证码&nbsp;:</label> 
							<input type="text" class="txtyzm" name="yzm" id="yzm" disabled placeholder="请输入手机验证码" /> 
							<input type="button" class="btn btn-info" id="btnYZM" onclick="getYZM()"
							       value="发送验证码" /><span style="color:red" id="msg"></span>
					</div>
					<c:if test="${not empty requestScope.message}">
					   <span class="ts" style="font-family:'黑体';color:red;font-size: 20px">${requestScope.message}</span>
					</c:if>
					<div class="btnBox">
						<input type="submit" class="xiayibu" id="next" value="下一步" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#mobile").blur(function() {
		var mobile = $("#mobile").val();
		if (!mobile) {
			$(".txtyzm").attr("disabled",true);
			return;
		}
		var reg = new RegExp(/^1[3456789]\d{9}$/, "i");
		if (!reg.test(mobile)) {
			alert("手机号码不合法！");
			$("#mobile").val("");
		}
	});
	$("#yzm").blur(function(){
		 var reg = new RegExp(/^[A-z 0-9]{6}$/,"i");
	       var val = $("#yzm").val();
	       if (!val) {
				return;
			}
			if (val && !reg.test(val)) {
				alert("验证码不合法");
				$("#yzm").val("");	
			}
    });
	$("#next").click(function() {
		var mobile = $("#mobile").val();
		var txtyzm = $(".txtyzm").val();
		if (!mobile) {
			alert("请输入手机号码");
			return false;
		} else if (!txtyzm) {
			alert("请输入验证码");
			return false;
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
		v = getCookieValue("zhaohui");//获取cookie值
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
						addCookie("zhaohui", 60, 60);//添加cookie记录,有效时间60s
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
		countdown = getCookieValue("zhaohui");
		if (countdown === "0") {
			obj.attr('disabled', false);
			//obj.removeattr("disabled");
			obj.val("发送验证码");
			return;
		} else {
			obj.attr('disabled', true);
			obj.val("重新发送(" + countdown + ")");
			countdown--;
			editCookie("zhaohui", countdown, countdown + 2);
		}
		setTimeout(function() {
			settime(obj)
		}, 1000)
	}
</script>
</html>