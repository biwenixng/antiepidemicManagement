<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加校医</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body>
<%
	if ((String)request.getAttribute("msgs")=="添加医生失败!输入错误"){%>
	<script>
	alert("添加医生失败!输入错误!");
	</script>
<%}%>
<%
	if ((String)request.getAttribute("msgs")=="添加医生成功"){%>
	<script>
	alert("添加医生成功!");
	</script>
<%}%>
<%
	if ((String)request.getAttribute("msgs")=="文件大小过大！"){%>
	<script>
	alert("文件大小过大！");
	</script>
<%}%>
	<form action="<c:url value='/admin/adminServlet'/>" method="POST" enctype="multipart/form-data">
    <div class="center-block" style="width: 400px">
        <h3 style="text-align: center;">添加校医</h3>
        <br /> <br />
        <c:if test="${not empty msg}">
        <span>${msg}</span>
        </c:if>
        
        <div class="input-group">
            <span class="input-group-addon" >用户名</span> <input id="usern" 
                type="text" class="form-control" name="username" placeholder="请输入6-10位数字"
                aria-describedby="basic-addon1" required="required">
        </div>
        <p style="color: red"></p>
        <br />
        <div class="input-group">
            <span class="input-group-addon" >密码 </span> <input id="pwd1" 
                type="password" class="form-control" name="password" placeholder="请输入6-16位数字、字母和字符"
                aria-describedby="basic-addon1" required="required">
        </div>
        <p style="color: red"></p>
        <br />
        <div class="input-group">
            <span class="input-group-addon" >确认密码</span> <input id="pwd2" 
                type="password" class="form-control" name="otherPassword" placeholder="确认密码"
                aria-describedby="basic-addon1" required="required">
        </div>
        <p style="color: red"></p>
        <br />
        <div class="input-group">
            <span class="input-group-addon" >姓名 </span> <input id="nam" name = "name"
                type="text" class="form-control" placeholder="不能大于8个汉字或16个字母"
                aria-describedby="basic-addon1" required="required">
        </div>
        <p style="color: red"></p>
        <br />
        <div class="form-group">
            <span class="input-group-addon" >简介 </span>
            <textarea class="form-control" name = "center" rows="3" id="jj" placeholder="长度不超过200" required="required"></textarea>
        </div>
        <p style="color: red"></p>
        <br />
        <div class="form-group">
            <span class="input-group-addon" id="basic-addon1" style="width:40%">上传图片</span>
            <div style="text-align: center;">
                <input class="form-control" type="file" name ="img" id="exampleInputFile" required="required">
            </div>
        </div>
        <p style="color: red"></p>
        <br/>
        <div style="text-align: center;">
            <input id="tj" type="submit" value="提交">
        </div>
    </div>
</form>
</body>
<script type="text/javascript">
var $userFlag;
var $pwd1Flag;
var $pwd2Flag;
var $nameFlag;
var $synopsisFlag;
var $imgPathFlag;

$(document).ready(function () {
        /*验证用户名*/
        $("input").focus(function() {
        		$("p").text("");
        });
        $("#usern").blur(function () {
            var  value= $("#usern").val();
            var verify= /^[0-9]{6,10}$/;
            if (!(verify.test(value))) {
            	$userFlag = false;
            }else {
            	$userFlag = true;
            }
            if($userFlag == false){
            	$(".center-block > p:eq(0)").text("请输入规范的用户名");
            }else{
            	 $(".center-block > p:eq(0)").text("");
            }
        });
        /*验证密码*/
        $("#pwd1").blur(function () {
            var  value= $("#pwd1").val();
            var verify= /^\w{6,16}$/;
            if (!(verify.test(value))) {
                 $pwd1Flag = false;
            }else {
            	 $pwd1Flag = true;
            }
            
            if($pwd1Flag == false){
            	$(".center-block > p:eq(1)").text("请输入规范的密码");
             }else{
                $(".center-block > p:eq(1)").text("");
             }
            
        });
        /*验证确认密码*/
        $("#pwd2").blur(function () {
            var value1=$("#pwd1").val();
            var value2=$("#pwd2").val();
            if (value2 != value1) {
            	$pwd1Flag = false;
            }else {
            	$pwd1Flag = true;
            }
            if($pwd1Flag == false){
            	$(".center-block > p:eq(2)").text("密码不一致");
             }else{
                $(".center-block > p:eq(2)").text("");
             }
        });
        /*姓名验证*/
        $("#nam").blur(function () {
            var value= $("#nam").val();
            var verify= /^[\u4e00-\u9fa5]{1,8}$/;
            var verify2=/^[A-z]{1,16}$/;
            if (!(verify.test(value))&&!(verify2.test(value))) {
            	$nameFlag = false;
            }else {
            	$nameFlag = true;  
            }
            if($nameFlag == false){
            	 $(".center-block > p:eq(3)").text("请输入规范的姓名");
            }else{
            	 $(".center-block > p:eq(3)").text("");
            }
        });
        /*简介长度验证*/
        $("#jj").blur(function () {
            var value= $("#jj").val();
            if (value.length < 200 && value.length > 0){
            	$synopsisFlag = true;
            }else {
            	$synopsisFlag = false;
            }
            if ($synopsisFlag == false){
            	$(".center-block > p:eq(4)").text("简介不符合要求!");
            }else {
                $(".center-block > p:eq(4)").text("");
            }
        });
        /*上传图片格式验证*/
        $("#exampleInputFile").blur(function () {
            var filepath=$("#exampleInputFile").val();
            var extStart=filepath.lastIndexOf(".");
            var ext=filepath.substring(extStart,filepath.length).toUpperCase();
            if(ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"){
                $imgPathFlag = false;
            }else{
            	$imgPathFlag = true;
            }
            if($imgPathFlag == false){
            	 $(".center-block > p:eq(5)").text("请上传jpg、png或gif格式的图片");
             }else{
                 $(".center-block > p:eq(5)").text("");
            }
        });
        /*提交*/
        $("#tj").click(function () {
        	if (!$userFlag) {
				$(".center-block > p:eq(0)").text("请输入规范的用户名");
			} else {
				$(".center-block > p:eq(0)").text("");
			}
			if (!$pwd1Flag) {
				$(".center-block > p:eq(1)").text("请输入规范的密码");
			} else {
				$(".center-block > p:eq(1)").text("");
			}
			if (!$pwd2Flag) {
				$(".center-block > p:eq(2)").text("密码不一致");
			} else {
				$(".center-block > p:eq(2)").text("");
			}
			if (!$nameFlag) {
				$(".center-block > p:eq(3)").text("请输入规范的姓名");
			} else {
				$(".center-block > p:eq(3)").text("");
			}
			if (!$synopsisFlag) {
				$(".center-block > p:eq(4)").text("简介不符合要求!");
			} else {
				$(".center-block > p:eq(4)").text("");
			}
			if (!$imgPathFlag) {
				$(".center-block > p:eq(5)").text("请上传jpg、png或gif格式的图片");
			} else {
				$(".center-block > p:eq(5)").text("");
			}

			if ($userFlag && $pwd1Flag && pwd2Flag && $nameFlag && $synopsisFlag && $imgPathFlag) {
				
			} else {
				alert("请按要求填写信息");
				return false;
			}

	})
})
</script>
</html>