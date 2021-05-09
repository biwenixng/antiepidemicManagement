<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href='<c:url value='/personalCenter/css/bootstrap.min.css'/>' type="text/css">
<script type="text/javascript" src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript" src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
<script type="text/javascript" src='<c:url value='/personalCenter/js/bootstrap-multiselect.js'/>'></script>
<script type="text/javascript" src='<c:url value='/personalCenter/js/require-2.3.5.min.js'/>'></script>
<link type="text/css" rel="stylesheet" href='<c:url value='/personalCenter/css/up_info.css'/>'>
<link type="text/css" rel="stylesheet" href='<c:url value='/personalCenter/css/update.css'/>'>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<body>
	<div class="update">
		<form action="<%=basePath%>sucessPasswordServlet/updatePasssword" method="post">

		<div class="form-group">
			<label class="lb" for="exampleInputName2">请输入旧密码:</label>
			<input id="oldpsw" name="oldpsw" style="width: 180px; height: 30px" class="form-control" type="password" required="required"/>
			<span id="msg" style="color:red; display: none;">原密码不正确</span>
		</div>
		
		
		<div class="form-group">
			<label class="lb" for="exampleInputName2">请输入新密码:</label>
			<input id="newpsw" name="newpsw" style="width: 180px; height: 30px" class="form-control" type="password" required="required"/>
			<span id="np" style="color:red; display: none;">密码必须是6-16位的字母或数字</span>
		</div>
		
		
		<div class="form-group">
			<label class="lb" for="exampleInputName2">请确认新密码:</label>
			<input id="agipsw" name="agipsw" style="width: 180px; height: 30px" class="form-control" type="password" required="required"/>
			<span id="towmm" style="color:red; display: none;">两次密码不一致，请重新输入</span>
		</div>
		
		
		<p>
			<input class="btn btn-success" id="btn-sb" type="submit" value="提交" name="submit" />
		</p>

		</form>
	</div>
</body>
<script type="text/javascript">
$("#oldpsw").click(function(){
	$("#msg").css("display","none");
});
	$("#oldpsw").blur(function(){
		var inputPSW = $("#oldpsw").val();
		var opsw = $.post({
			"url" : "<%=basePath%>selectOldPswServlet/replacePwd",
			"data" : "password=" + $("#oldpsw").val(),
			"dataType" : "text",
			"success" : function(data) {
				if(inputPSW != ""){
					if(data == 0){
						$("#msg").css("display","block");
						$("#oldpsw").val("");
					}else if(data == 1){
						$("#msg").css("display","none");
					
					}
				}
			}
		});
			
	});

	$("#newpsw").click(function(){
		$("#np").css("display","none");
		});
	$("#newpsw").blur(function (){
		var reg = new RegExp(/^[A-z 0-9]{6,16}$/,"i");
		var newpwd1 = $("#newpsw").val();
		if(newpwd1){
		    if(!reg.test(newpwd1)){
		    	$("#np").css("display","block");
			    //alert("密码必须是6-16位的字母或数字");
			    $("#newpsw").val("");
			} 
		}
	});
	$("#agipsw").click(function(){
		$("#towmm").css("display","none");
		});
	$("#agipsw").blur(function (){
		   var newpwd1 = $("#newpsw").val();
		   var newpwd2 = $("#agipsw").val();
		   if(!newpwd1){
	         // alert("请输入新密码");
	          return false;
	       }else if(!newpwd2){
	    	  // alert("请确认新密码");
	    	   return false;
	       }else if(newpwd1 !=newpwd2){
	   	      // alert("两次密码不一致，请重新输入");
	   	       $("#towmm").css("display","block");
	   	       $("#newpsw").val("");
	   	       $("#agipsw").val("");
	   	       return false;
	      }
	});
	
$("#btn-sb").click(function(){
	var np = $("#newpsw").val();
	var ap = $("#agipsw").val();
	var op = $("#oldpsw").val();
	if (!op) {
		alert("原密码为空");
		return false;
	}else if(!ap) {
		alert("未确认新密码");
		return false;
	}else if(!np){
		alert("新密码为空");
		return false;
	}else{
		alert("修改成功");
//重定向...重新登录
		
	}
});


</script>


</html>