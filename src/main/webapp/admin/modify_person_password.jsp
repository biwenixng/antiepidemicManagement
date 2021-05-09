<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改用户密码页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<!-- 修改用户密码页面 -->
<body>
<form class="center-block">
		<div class="center-block" style="width: 400px">
		<h3 style="text-align: center;">修改用户密码页面</h3>
			<br /> <br />
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">用户名</span> 
			</div>
			<p>&nbsp;</p> 
			<br />
			<div class="input-group">
				<span class="input-group-addon" >新密码 </span> <input id="pwd1" name = "newpwd" 
					type="password" class="form-control" placeholder="请输入6-16位（数字、字母、下划线）"
					aria-describedby="basic-addon1">
			</div>
			<p style="color: red">&nbsp;</p>
			<br />
			<div class="input-group" >
				<span class="input-group-addon">确认密码</span> <input id="pwd2" name = "ortherpwd"
					type="password" class="form-control" placeholder="确认密码"
					aria-describedby="basic-addon1">
				<span></span>
			</div>
			<p style="color: red">&nbsp;</p>
			<br />
			<div style="text-align: center;">
				<input type="button" value="提交" id="tj">
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
/*验证密码*/
var fals2 = false;
$("#pwd1").blur(function () {
	var  value= $("#pwd1").val();
	var verify= /^\w{6,16}$/;
	if (value.length == 0){
		$("p:eq(1)").text("密码不能为空");
	}else {

		$("p:eq(1)").text("");
	}
	if (!(verify.test(value))) {
		$("p:eq(1)").text("请输入规范的密码");
	}else {
		fals2 = true;
		$("p:eq(1)").text("");
	}
});
/*验证确认密码*/
var fals3 =false;
$("#pwd2").blur(function () {
	var  value1= $("#pwd1").val();
	var  value2= $("#pwd2").val();
	if (value1.length == 0){
		$("p:eq(1)").text("密码不能为空");
	}else {
		$("p:eq(1)").text("");
	}
	if (value1 != value2) {
		$("p:eq(2)").text("密码不一致");
	}else {
		fals3 = true;
		$("p:eq(2)").text("");
	}
});
$("#tj").click(function () {
	if(!(fals2||fals3)){
		alert("添加信息有错误!");
	}else {

	}
})
})
</script>
</html>