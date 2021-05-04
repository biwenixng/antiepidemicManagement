<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jQuery1.12.4.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
</head>
<body>
	<%
		if ((String) request.getAttribute("message") == "error") {
	%>
	    
	<script>
		    alert("今天暂无预约消息！");
	</script>
	<%
		}
	%>
	<div class="container-fluid">
		<div class="jumbotron">
			<div class="table-responsive row">
				<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
					<h1>预约消息</h1>
					<a class="btn btn-default" href="#" role="button">获取当天预约信息</a> <br />
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
							<c:if test="${not empty msg}">
								<c:forEach var="item" items="${message}">
									<tr>
										<td>${item.auser}</td>
										<td>${item.appointmentTime}</td>
										<td>${item.appointTime}</td>
										<td>${item.phone}</td>
										<td><a class="btn btn-danger"
											href="<c:url value='/doctor/doctorServlet?method=removeReservation&fid=${item.fid}&show=0'/>"
											role='button'>删除</a></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>