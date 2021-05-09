<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 查看健康码 -->
<title>查看健康码</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-3.4.1.min.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<body>
	<div class="page-header" id="new"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: #DDDDDD">查看健康码</h2>
	</div>

</body>
<script type="text/javascript">
     $(document).ready(function(){
            $.get({
              "url":"<%=basePath%>query_Code/selectAUser",
              "data": "username=${username}",
              "dataType":"json",
              "success": function(data){
            	  var obj = data[0];
              	  var abc = "/antiepidemic_war"+obj.healthpath;
            	  if(obj.healthpath != ""){
					var $img = $("<img alt='#' style='width: 300px;height: 300px;margin: 15px 0px 0px 15px;' src='<c:url value='"+abc+"'/>'>");
					$("#new").after($img);
            	  }
            	  if(obj.healthpath == ""){
  					var $p = $("<p></p>");
  					$p.css({"color": "red",
  	  					"margin-left":"15px",
  	  					"margin-top":"5px",
  	  					"font-size":"15px",
  	  				    "font-size":"25px"});
  					$p.html("您还未上传健康码，请尽快上传健康码。");
  					$("#new").after($p);
              	  }               
               }
            });
     });
</script>
</html>