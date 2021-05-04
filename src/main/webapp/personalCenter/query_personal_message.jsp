<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>查看个人信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<link type="text/css" rel="stylesheet" href='<c:url value='/personalCenter/css/q_p_m.css'/>'>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
</head>

<!-- 查看个人信息 -->
<body>

	<div class="page-header"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: #DDDDDD">查看个人信息</h2>
	</div>
	<div class="infomain">
	<div class="info_center">
		<table>
			<tr>
				<td><div class="form-group">
						<label for="exampleInputName2">头像:</label>
					</div></td>
				<td><img id="imgad" style="width: 100px; height: 100px"
				 	src='<c:url value=''/>'
					alt="..." class="img-rounded"></td>
			</tr>
			<tr>
				<td><div class="form-group">
						<label for="exampleInputName2">姓名:</label>
					</div></td>
				<td><input style="width: 90px; height: 30px; background: white;" type="text"
					class="form-control" id="name"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td><div class="form-group">
						<label for="exampleInputName2">健康状态:</label>
					</div></td>
				<td><input style="width: 90px; height: 30px; background: white;" type="text"
					class="form-control" id="state"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td><div class="form-group">
						<label for="exampleInputName2">电话:</label>
					</div></td>
				<td><input style="width: 230px; height: 30px; background: white;" type="text"
					class="form-control" id="phone" value=""
					readonly="readonly"></td>
			</tr>

			<tr>
				<td><div class="form-group">
						<label for="exampleInputName2">身份证号:</label>
					</div></td>
				<td><input style="width: 230px; height: 30px; background: white;" type="text"
					class="form-control" id="Idcard"
					readonly="readonly"></td>
			</tr>

			<tr>
				<td><div class="form-group">
						<label for="exampleInputName2">积分:</label>
					</div></td>
				<td><input style="width: 90px; height: 30px; background: white;" type="text"
					class="form-control" id="Jifen"
					readonly="readonly"></td>
			</tr>

			<tr>
				<td><div class="form-group">
						<label for="exampleInputName2">住址:</label>
					</div></td>
				<td><input style="width: 330px; height: 30px; background: white;" type="text"
					class="form-control" id="address"
					readonly="readonly"></td>
			</tr>

			<!-- <tr>
				<td><div class="form-group">
						<label for="exampleInputName2">收货地址:</label>
					</div></td>
				<td><input style="width: 330px; height: 30px" type="text"
					class="form-control" id="exampleInputName2" name=""
					readonly="readonly"></td>
			</tr> -->
		</table>
		</div>
	</div>
	
</body>
<script type="text/javascript">
$(document).ready(function(){
	$.get({
		 "url":"<c:url value='/UserServlet'/>",
         "data": "method=selectByUsername&user=${username}",
         "dataType":"json",
         "success": function(data){
        	 var imimg = "/Zxiangmu"+data.HeadImg;
        	 $("#imgad").attr('src',<c:url value='imimg'/>);
        		$("#name").val(data.Name);
        		$("#state").html(function(){
        			var state = data.Health;
        			if(state == 1){
        				state = '健康';}
        			if(state == 0){
        				state = '疑似';}
        			if(state == 2){
        				state = '确诊';}
        			$("#state").val(state);
        			});
    			// 电话身份证号隐私显示
    			var pho = data.Phone;
    			pho = pho.substring(0, 3) + "*****" + pho.substring(8, 11);
    			
    			var idn = data.Idnumber
				idn = idn.substring(0, 5) + "*********" + idn.substring(14, 18);
    			
        		//$("#phone").val(data.Phone);
        		$("#phone").val(pho);
        		//$("#Idcard").val(data.Idnumber);
        		$("#Idcard").val(idn);
        		$("#Jifen").val(data.integral);
        		$("#address").val(data.Residence);
		},
	

});
})
</script>
</html>