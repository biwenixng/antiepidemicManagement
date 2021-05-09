<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加新闻</title>
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
	if ((String)request.getAttribute("msgs")=="添加新闻成功"){%>
	<script>
	alert("添加新闻成功!");
	</script>
<%}%>
<%
	if ((String)request.getAttribute("msgs")=="添加新闻失败"){%>
	<script>
	alert("添加新闻失败!");
	</script>
<%}%>
<%
	if ((String)request.getAttribute("msgs")=="新闻图片过大！"){%>
	<script>
	alert("新闻图片过大！");
	</script>
<%}%>
	<form action="<c:url value='/admin/revampDoctorServlet'/>" method="POST" enctype="multipart/form-data">
		<div class="center-block" style="width: 400px">
			<h3 style="text-align: center;">防疫新闻管理</h3>
			<br /> <br />
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">标题</span> <input
					id="bt" name = "title" required="required"
					type="text" class="form-control" placeholder="请输入长度小于20的标题"
					aria-describedby="basic-addon1">
			</div>
			<p style="color: red"></p>
			 <br />
			<div class="form-group">
				<span class="input-group-addon" id="basic-addon1">内容 </span>
				<textarea required="required" name ="center" class="form-control" rows="3" id="nr" placeholder="请输入长度小于1000的内容"></textarea>
			</div>
			<p style="color: red"></p>
			 <br />

			<div class="form-group">
				<span class="input-group-addon" id="basic-addon1" style="width:40%">上传图片 </span>
				<div style="text-align: center;">
					<input type="file" id="exampleInputFile" name = "image" required="required">
					<span class="help-block">请选择图片上传路径</span>
				</div>
			</div>
			<p style="color: red"></p>
			<div style="text-align: center;">
				<input type="submit" value="提交" id="tj">
			</div>
		</div>

	</form>
</body>
<script type="text/javascript">
	var $titleFlot;
	var $centerFlot;
	var $imgPathFlot;
	$(document).ready(function () {
		$("input").focus(function() {
    		$("p").text("");
    	});
		/*验证标题长度*/
        $("#bt").blur(function () {
            var value= $("#bt").val();
            if ( value.length > 20){
                $titleFlot = false;
            }else {
            	$titleFlot = true;
            }
            if ($titleFlot == false){
            	$(".center-block > p:eq(0)").text("请按规范填写标题");
            }else {
                $(".center-block > p:eq(0)").text("");
            }
        });
        /*内容长度验证  */
        $("#nr").blur(function () {
            var value= $("#nr").val();
            if (value.length > 1000){
                $centerFlot = false;
            }else { 
            	$centerFlot = true;
            }
            if ($centerFlot == false){
            	 $(".center-block > p:eq(1)").text("请按规范填写标题内容");
            }else {
                $(".center-block > p:eq(1)").text("");
            }
        });
        /*上传图片格式验证*/
        $("#exampleInputFile").blur(function () {
            var filepath=$("#exampleInputFile").val();
            var extStart=filepath.lastIndexOf(".");
            var ext=filepath.substring(extStart,filepath.length).toUpperCase();
            if(ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"){
            	$imgPathFlot = false;

            }else{
                $imgPathFlot = true;
            }
            if($imgPathFlot == false){
            	$(".center-block > p:eq(2)").text("请上传jpg、png或gif格式的图片");
                }else{
                	$(".center-block > p:eq(2)").text("");
                }


        });
        /*提交*/
        $("#tj").click(function () {
        	 if (!$titleFlot){
             	$(".center-block > p:eq(0)").text("请按规范填写标题");
             }else {
                 $(".center-block > p:eq(0)").text("");
             }
        	 if (!$centerFlot){
            	 $(".center-block > p:eq(1)").text("请按规范填写标题内容");
            }else {
                $(".center-block > p:eq(1)").text("");
            }
        	 if(!$imgPathFlot){
             	$(".center-block > p:eq(2)").text("请上传jpg、png或gif格式的图片");
           }else{
                 $(".center-block > p:eq(2)").text("");
            }
            if($titleFlot && $centerFlot && $imgPathFlot){
           
            }else{
            	alert("请按要求填写信息");
            	return false;
           }
        })

    })
</script>
</html>