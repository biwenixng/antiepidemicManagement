<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 修改地址 -->
<title>修改地址</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-3.4.1.min.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
</head>
<body>
	<div class="page-header" id="new"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: #DDDDDD">修改住址</h2>
		<a href='<c:url value='/personalCenter/modify_personal_message.jsp'/>' style="display: inline-block;font-size: 18px;font-weight: bold; margin-left: 550px;">返回</a>
	</div>
	<form action='<c:url value='/AreaSer?method=update&username=${username}'/>'
		method="post">
		<c:if test="${not empty msg}">
					<p
						style="color: red; margin-left: 15px; margin-top: 5px; font-size: 15px;">${msg}</p>
				</c:if>
		<div style="margin: 100px auto; border: 2px soild;margin-left: 20px;">
			<label for="province">校区：</label> 
			<select id="province" name="province" class="form" required style="width: 120px; height: 30px; border: 1px solid red; border-radius: 4px;">
			</select> 
			<label for="city">楼层：</label> 
			<select id="city" name="city" required style="width: 120px; height: 30px; border: 1px solid red; border-radius: 4px;">
			</select>
			<label for="area">寝室：</label> 
			<select id="area" name="area" required style="width: 120px; height: 30px; border: 1px solid red; border-radius: 4px;">
			</select>
		</div>
		<p style="margin-left: 20px;">
			<input type="submit" value="修改" class="bo" />
		</p>
	</form>
</body>
<script type="text/javascript">
$(document).ready(function () {
    getprovince();//网页加载完成时自动执行 此方法 
     $("#province").change(function () {//表示id="province"的标签中的值改变时调用此方法
    	getcity($(this).eq(0).val());
    });
    $("#city").change(function () {//以上同理
    	getarea($(this).eq(0).val());
    }); 
    function getprovince(){//使用ajax获取后台返回的数据
    	 $.get({
             "url":"<c:url value='/AreaSer'/>",
             "data": "method=selectAll",
             "dataType":"json",
             "success": function(data){
           	  if(data != "null"){
           		 for(var i = 0 ; i <  data.length ; i++){
                  	 var  obj = data[i];
                        var  $option = $("<option>"+obj.name+"</option>");
                       $("#province").append($option);
                   }
           	  }               
              }
           });
    };
       function getcity(name){
            $("#city").empty();//清空之前的数据
            $.get({
                "url":"<c:url value='/AreaSer'/>",
                "data": "method=selectOne&schoolname="+name,
                "dataType":"json",
                "success": function(data){
              	  if(data != "null"){
              		 for(var i = 0 ; i <  data.length ; i++){
                     	 var  obj = data[i];
                           var  $option = $("<option>"+obj.name+"</option>");
                          $("#city").append($option);
                      }
              	  }               
                 }
              });
    };  
    function getarea(name){
    	$("#area").empty();
    	 $.get({
             "url":"<c:url value='/AreaSer'/>",
             "data": "method=selectAllPage&floorname="+name,
             "dataType":"json",
             "success": function(data){
           	  if(data != "null"){
           		 for(var i = 0 ; i <  data.length ; i++){
                  	 var  obj = data[i];
                        var  $option = $("<option>"+obj.name+"</option>");
                       $("#area").append($option);
                   }
           	  }               
              }
           });
    }; 
});
</script>
</html>