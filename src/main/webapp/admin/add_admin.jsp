<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加管理员</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<body>
		<div class="center-block" style="width: 400px">
		<h3 style="text-align: center;">添加管理员</h3>
			<br /> <br />
			<div class="input-group">
				<span class="input-group-addon" >账号</span> <input id="usern"
					type="text" class="form-control" placeholder="请输入6-10位数字"
					aria-describedby="basic-addon1" required="required">
			</div>
			<p style="color: red">&nbsp;</p>
			<br />
			<div class="input-group">
				<span class="input-group-addon" >密码 </span> <input id="pwd1"
					type="password" class="form-control" placeholder="请输入6-16位（数字、字母、下划线）"
					aria-describedby="basic-addon1" required="required">
			</div>
			<p style="color: red">&nbsp;</p>
			<br />
			<div class="input-group" >
				<span class="input-group-addon">确认密码</span> <input id="pwd2"
					type="password" class="form-control" placeholder="确认密码"
					aria-describedby="basic-addon1" required="required">
				<span></span>
			</div>
			<p style="color: red">&nbsp;</p>
			<br />
			<div style="text-align: center;" id="tj">
				<input type="submit" value="提交" >
			</div>
		</div>
</body>
<script type="text/javascript">
var user= null;
var pwd1= null;
var pwd2= null;
	$(document).ready(function () {
		/*验证用户名*/
		$("#usern").blur(function () {
			var value = $("#usern").val();
			var verify= /^[0-9]{6,10}$/;
			if (!(verify.test(value))) {
				$("p:eq(0)").text("请输入规范的用户名");
				user = null;
			}else {
				user = value;
				$("p:eq(0)").text("");
			}
	    });
		/*验证密码*/
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
			if(user != null && pwd2 != null){
				$.get({
					"url":"<c:url value='/admin/adminServlet?method=addAdmin'/>",
					"data":"user=" + user + "&pwd=" + pwd2,
					"dataType":"json",
					"success":function(data) {
						var $ifs = $(data.ifs);
							if($ifs == true){
								alert("添加成功!");
							}else{
								alert("添加失败!");
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