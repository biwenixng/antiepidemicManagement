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
<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.min.css" />" />

<!-- 导入JQurey的js库 -->
<script type="text/javascript" src="<c:url value="/bootstrap/js/jquery-1.12.4.js" />"></script>

<!-- 导入bootstrap的js库 -->
<script type="text/javascript" src="<c:url value="/bootstrap/js/bootstrap.min.js" />"></script>

<script type="text/javascript">
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
$(document).ready(function () {
	var height=$(document).height();
	$('.main').css('height',height);
    $.get({
         "url":"<%=basePath%>userRegisteredServlet/findSchool",
         "data":null,
         "dataType":"json",
         "success" : function(data) {
                       for(var i=0;i<data.length;i++){
                      	var obj = data[i];           
                          var $option = $("<option>"+obj.schoolname+"</option>");
                           $("#tower").append($option);
                       }
                     }
        });
})
</script>
<title>注册</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/user/user_css/zhuce.css" />" />

</head>
<body>
	<div class="main">
		<div class="main0">
			<div class="main_left">
				<img src="<c:url value="/user/user_images/zhuce-image-3.png"/>" class="theimg" /> <img
					src="<c:url value="/user/user_images/zhuce-image-2.png"/>" class="secimg" /> <img
					src="<c:url value="/user/user_images/zhuce-image-1.png"/>" class="firimg" />
			</div>
			<div class="main_right">
				<div class="main_r_up">
					<img src="<c:url value="/user/user_images/user.png"/>" />
					<div class="pp">注册</div>
				</div>
				<div class="sub">
					<p>
						已经注册？<span class="blue"><a href="<c:url value="/user/user_login/user_login.jsp"/>">请登录&nbsp;&nbsp;&nbsp;</a></span>
					</p>
				</div>
				<form
					action="<%=basePath%>userRegisteredServlet/registerNO1"
					method="post">
					<div class="txt form-group">
						<span style="letter-spacing: 10px;">身份证号:</span> <input name="cid"
							type="text" class="txtphone" id="cid" placeholder="请输入您的身份证号" />
					</div>
					<div class="txt">
						<span style="letter-spacing: 10px;">真实姓名:</span> <input name="cname"
							type="text" class="txtphone" id="cname" placeholder="请输入您的真实姓名" />
					</div>
					<div class="txt">
						<span style="letter-spacing: 10px;">校园住址:&nbsp;</span> 
						<select	id="tower" name="tower">
							<option>--校区--</option>
						</select> 
						<select id="floor" name="floor">
							<option>--楼栋--</option>
						</select> 
						<select id="room" name="room">
							<option>--寝室号--</option>
						</select>
					</div>
					<div class="txt">
						<span style="letter-spacing: 10px;">联系电话:</span> <input name="cphone"
							type="text" class="txtphone" id="cphone" placeholder="请输入您的联系电话" />
					</div>
					<div>
					   <input type="submit" class="xiayibu" value="下一步"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$("#cid").blur(function (){
   var cid = $("#cid").val();
   var reg = new RegExp(/^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/,"i");
   if(cid && !reg.test(cid)){
       alert("身份证输入不合法，请重新输入");
       $("#cid").val("");
	}else if(cid){
		$.post({
			"url" : "<%=basePath%>userRegisteredServlet/userIdNumber",
			"data" : "cid=" + $("#cid").val(),
			"dataType" : "text",
			"success" : function(data) {
				if (data == "该身份证号码已被注册!") {
					alert(data);
					$("#cid").val("");
				}
			}
		});
	}	
});


$("#cname").blur(function (){
	var cname = $("#cname").val();
	var reg = new RegExp(/^[\u4E00-\u9FA5]{2,4}$/);
	if(cname && !reg.test(cname)){
	       alert("姓名输入不合法，请重新输入");
	       $("#cname").val("");
	}	
});

$("#cphone").blur(function (){
	var reg = new RegExp(/^1[3456789]\d{9}$/, "i");
	var cphone = $("#cphone").val();
	if (cphone && !reg.test(cphone)) {
		alert("电话号码输入不合法，请重新输入");
		$("#cphone").val("");
	}else if(cphone){
		$.post({
			"url" : "<%=basePath%>userRegisteredServlet/userPhone",
			"data" : "cphone=" + $("#cphone").val(),
			"dataType" : "text",
			"success" : function(data) {
				if (data == 0) {
					alert("该号码已经使用");
					$("#cphone").val("");
				}
			}
		});
    }
})

$(".xiayibu").click(function (){
	 var cid    = $("#cid").val();
	 var cname  = $("#cname").val();
	 var cphone = $("#cphone").val();
     var newtower  = $("#tower").val();
     var newfloor  = $("#floor").val();
     var newroom   = $("#room").val();
     if(!cid)   {alert("请先输入身份证号码");return false;};
     if(!cname) {alert("请先输入姓名");return false;};
     if(newtower == "--校区--") {alert("请先选择校区");return false;};
     if(newfloor == "--楼栋--") {alert("请先选择楼栋");return false;};
     if(newroom == "--寝室号--")  {alert("请先选择寝室");return false;};
     if(!cphone){alert("请先输入电话号码");return false;};
});
</script>
<script type="text/javascript">
$("#tower").change(function(){
	  $.post({
        "url":"<%=basePath%>userRegisteredServlet/findFloor",
        "data":"tower=" + $("#tower").val(),
        "dataType":"json",
        "success" : function(data) {
        	          $("#floor").empty();
        	          $("#floor").append("<option>"+"--楼栋--"+"</option>");
        	          $("#room").empty();
           	          $("#room").append("<option>"+"--寝室号--"+"</option>");
        	          for(var i=0;i<data.length;i++){
            	         var obj = data[i];           
                         var $option = $("<option>"+obj.floorname+"</option>");
                         $("#floor").append($option);
                      }
                    }
     })
});
$("#floor").change(function(){
	$.post({
        "url":"<%=basePath%>userRegisteredServlet/findDormitory",
        "data":"floor=" + $("#floor").val(),
        "dataType":"json",
        "success" : function(data) {
        	          $("#room").empty();
        	          $("#room").append("<option>"+"--寝室号--"+"</option>");
        	          for(var i=0;i<data.length;i++){
            	         var obj = data[i];           
                         var $option = $("<option>"+obj.dormitoryname+"</option>");
                         $("#room").append($option);
                      }
                    }
       })
});
</script>
</html>