<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改手机号码</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href='<c:url value='/personalCenter/css/bootstrap.min.css'/>' type="text/css">
<script type="text/javascript" src='<c:url value='/personalCenter/js/jquery-3.4.1.min.js'/>'></script>
<script type="text/javascript" src='<c:url value='/personalCenter/js/jquery.cookie.js'/>'></script>
<script type="text/javascript" src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
<script type="text/javascript" src='<c:url value='/personalCenter/js/bootstrap-multiselect.js'/>'></script>
<script type="text/javascript" src='<c:url value='/personalCenter/js/require-2.3.5.min.js'/>'></script>
<link type="text/css" rel="stylesheet" href='<c:url value='/personalCenter/css/up_info.css'/>'>
<link type="text/css" rel="stylesheet" href='<c:url value='/personalCenter/css/update.css'/>'>
</head>
<body>
	<div class="update">
	<form action="<%=application.getContextPath()%>/SucessCodeServlet?&uname=${username}" method="post">
	
		<div class="form-group">
			<label class="lb" for="exampleInputName2">原手机号码:</label>
			<input style="width: 180px; height: 30px" class="form-control" type="text" 
			id="oldmobile" name="oldphone" disabled value=""/>
		</div>
		
		
		<div class="form-group">
			<label class="lb" for="exampleInputName2">新手机号码:</label>
			<input style="width: 180px; height: 30px" class="form-control" type="text" 
			id="mobile" name="mobile" placeholder="请输入新手机号码" autocomplete="off"/>
		</div>
	
		
		<div class="form-group">
			<label class="lbyzm"  for="exampleInputName2">验证码:</label>
			<input style="width: 140px; height: 30px" class="form-control" id="yzm"
			 name="yzm" disabled placeholder="请输入手机验证码" type="text" autocomplete="off"/>
			 <input type="hidden" id="trueYZM" name="trueYZM" value="">
			
			
			<input class="btn btn-info" id="btnYZM" type="button" onclick="getYZM()" value="发送验证码"/>
			<span style="color:red" id="msg"></span>
		</div>
		
		<p>
			<input class="btn btn-success" id="next" type="submit" value="提交" name="submit" />
		</p>
	</form>
	</div>
</body>
<script type="text/javascript">
$("#mobile").blur(function() {
	var mobile = $("#mobile").val();
	if (!mobile) {
		$("#yzm").attr("disabled",true);
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
	var txtyzm = $("#yzm").val();
	if (!mobile) {
		alert("请输入手机号码");
		return false;
	} else if (!txtyzm) {
		alert("请输入验证码");
		return false;
	}else {
		if($("#trueYZM").val() != txtyzm){
					$("#yzm").val("");
					alert("修改失败");
					return false;
					
				}else if($("#yzm").val() == txtyzm){
					alert("修改成功");
					}	
		
	}
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
		v = getCookieValue("李四");//获取cookie值
		if (v > 0) {
			settime(obj1);//开始倒计时
		}
	});
	//定义倒计时变量

	//原手机号码
	$("#oldmobile").val(function(){
		$.post({
			"url" : "<c:url value='/SelectOldPhoneServlet'/>",
			//cookie 获取值username 用户名
			"data" : "uname=${username}",
			"dataType" : "text",
			"success" : function(data) {
				var pho = data;
				pho = pho.substring(0, 3) + "*****" + pho.substring(8, 11);
				$("#oldmobile").val(pho);
				}
		});
	});
	
	
	var countdown;
	//点击函数
	function getYZM() {
		var mobile = $("#mobile").val();
		var obj = $("#btnYZM");
		if (mobile) {
			$.post({
				"url" : "<c:url value='/FindPhoneServlet'/>",
				"data" : "mobile=" + $("#mobile").val(),
				"dataType" : "text",
				"success" : function(data) {
					if (data == 1) {
						alert("该手机号码已被使用");
					} else {
						addCookie("李四", 60, 60);//添加cookie记录,有效时间60s
						settime(obj);//开始倒计时
						$("#yzm").removeAttr("disabled");
						$.get({
	                          "url" : "<c:url value='/UserSendCodeServlet'/>",
	                          "dataType":"text",
	                          "data":"mobile=" + $("#mobile").val()+"&uname=${username}",
	                          "success" : function(data) {
	                              $("#trueYZM").val(data);
	                              
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
		countdown = getCookieValue("李四");

		if (countdown === "0") {
			obj.attr('disabled', false);
			//obj.removeattr("disabled");
			obj.val("发送验证码");
			return;
		} else {
			obj.attr('disabled', true);
			obj.val("重新发送(" + countdown + ")");
			countdown--;
			editCookie("李四", countdown, countdown + 2);
		}
		setTimeout(function() {
			settime(obj)
		}, 1000)
	}

	
</script>


</html>