<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<body>
<form action="<c:url value="/admin/revampDoctorServlet"/>" method="POST">
		<div class="center-block" style="width: 400px">
		<h3 style="text-align: center;">修改用户</h3>
			<br />
			<c:if test="${not empty msg}">
       			 <span>${msg}</span>
       		 </c:if>
       		 <div class="input-group">
				<span class="input-group-addon" >用户名 </span> 
			<c:if test="${not empty user}"><p style="text-align: center">
			<input name=user class="form-control" type="text" readonly="readonly" value="${user}"/>
			</c:if>
			</div>
			<p style="color: red">&nbsp;</p>
			<br />
			<div class="input-group">
				<span class="input-group-addon" >密码 </span> <input id="pwd1" name="pwd"
					type="password" class="form-control" placeholder="请输入6-16位（数字、字母、下划线）"
					aria-describedby="basic-addon1" required="required">
			</div>
			<p style="color: red">&nbsp;</p>
			<br />
			<div class="input-group" >
				<span class="input-group-addon">确认密码</span> <input id="pwd2" name="ortherpassword"
					type="password" class="form-control" placeholder="确认密码"
					aria-describedby="basic-addon1" required="required">
			</div>
			<p style="color: red">&nbsp;</p>
			<br />
			<input type="hidden" class="form-control" name="method" value="revamapPwd"/>
			<div style="text-align: center;" id="tj">
				<input type="submit" value="提交" >
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
var pwd1= null;
var pwd2= null;
var user1= $("#username").text();
$(document).ready(function () {
$("#pwd1").blur(function () {
			var value = $("#pwd1").val();
			var verify= /^\w{6,16}$/;
			if (!(verify.test(value))) {
				pwd1 = null
				$("p:eq(1)").text("请输入规范的密码");
			}else {
				pwd1 = value;
				$("p:eq(1)").text("");
			}
		});
		/*验证确认密码*/
		$("#pwd2").blur(function () {
			var value = $("#pwd2").val();
			if (value != pwd1) {
				pwd2 = null;
				$("p:eq(2)").text("密码不一致");
			}else {
				pwd2 = value;
				$("p:eq(2)").text("");
			}
		});	
	})
		$("#tj").click(function () {
			if(pw1 != null && pwd2 != null){
				$.get({
					"url":"<c:url value='/admin/adminServlet?method=revamapPwd'/>",
					"data":"user=" + user1 + "&pwd=" + pwd2,
					"dataType":"json",
					"success":function(data) {
						alert(data);
						var $ifs = $(data.ifs);
							if($ifs){
								alert("修改成功!");
							}else{
								alert("修改失败!");
							}
					}
				})
			}else{
				alert("请填写完整!");
				return false;
			}
		})
</script>
</html>