<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jQuery1.12.4.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<body>
	<div class="container-fluid">
		<div class="jumbotron">
			<div class="table-responsive row">
				<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
					<h1>预约消息</h1>
					<a class="btn btn-default" href="<%=basePath%>/doctorServlet/showTimeMessage" role="button">获取当天预约信息</a>
					<br />
					<table id="sub" class="table table-striped">
						<thead>
							<tr>
								<th>病人姓名</th>
								<th>预约看病时间</th>
								<th>预约时间</th>
								<th>电话</th>
								<th>是否删除</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$.get({
		"url":"<%=basePath%>/doctorServlet/showMessage",
		"data":null,
		"dataType":"json",
		"success":function(data){
			if(data.length == 0) {
				alert("当前没有预约消息");
				return;
			}
			for(var i = 0;i < data.length;i ++) {
				var $tr = $("<tr></tr>");
				var $auser = $("<td>"+data[i].auser+"</td>");
				var $appointmentTime = $("<td>"+data[i].appointmentTime+"</td>");
				var $appointTime = $("<td>"+data[i].appointTime+"</td>");
				var $phone = $("<td>"+data[i].phone+"</td>");
				var $a = $("<td><a class=\"btn btn-danger\" href=\"<c:url value='../doctorServlet/removeReservation?fid=\"+data[i].fid+\"&show=0'/>\" role='button'>删除</a></td>")

				$tr.append($auser);
				$tr.append($appointmentTime);
				$tr.append($appointTime);
				$tr.append($phone);
				$tr.append($a);

				$("#sub").append($tr);
			}
		}
	})
</script>
</html>