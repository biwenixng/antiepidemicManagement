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
	
<!-- 导入JQuery.cookie插件 -->
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jquery.cookie.js"/>"></script>	
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet"
	href=<c:url value="/bootstrap/css/fontcolor.css"/> type="text/css">
</head>
<body>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
if ((String)request.getAttribute("msg") == "success") {%>
<script>
alert("预约成功");
 </script>
<%}%>
<%
if ((String)request.getAttribute("msg") == "error") {%>
<script>
alert("预约成功");
 </script>
<%}%>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" title="logoTitle" href="#">预约页面</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation"><a href="<c:url value="/doctor/query_doctor.jsp"/>">医师主页</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row jumbotron">
			<div class="col-lg-offset-5 col-lg-2 col-lg-offset-5 col-md-offset-5 col-md-2 col-md-offset-5">
				<h1>预约</h1>
			</div>
		</div>
		<div class="row jumbotron">
			<div class="left col-lg-5">
				<form action="<%=basePath%>doctorServlet/appointment" method="get">
					<div id="forwardForm">
						<div class="form-group">
							<input type="hidden" class="form-control" name="method" id="method" value="appointment">
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" name="doctorUser" id="doctorUser" value="${username}">
						</div>
						<div class="form-group">
							<label for="patientName">医生姓名</label> <input type="text"
								class="form-control" id="patientName" name="doctorName" readonly="readonly" value="${name}">
						</div>

						<div class="form-group">
							<input type="hidden" class="form-control" id="patientUser" name="patientUser" value="${user.username}">
						</div>

						<div class="form-group">
							<label for="patientName">病人姓名</label> <input type="text"
								class="form-control" id="uidName" readonly="readonly" name="name" value="${user.name}">
						</div>

						<div class="form-group">
							<label for="userPhone">电话</label> <span></span> <input
								type="text" class="form-control" name="phone" id="userPhone" value="${user.phone}">
						</div>

						<div class="form-group">
							<label for="appointmentTime">预约时间</label> <span></span> <input
								type="datetime-local" class="form-control" name="appointmentTime" id="appointmentTime">
						</div>
						<button type="submit" id="submit" class="btn btn-default">预约</button>
					</div>
				</form>
			</div>
			<div class="right col-lg-offset-2 col-lg-5 marg">
				<img alt="" src="<c:url value="/images/forward.jpg"/>" height="300" />
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		var $appointmentTimeFlag;
		$("#appointmentTime").blur(
				function() {
					var $appointmentTime = $("#appointmentTime").val();
					var $date = new Date($appointmentTime);
					var $currentDate = new Date();

					if ($date.getDay() == 0 || $date.getDay() == 6) {
						$("#forwardForm div:eq(6) > span").text("双休日不支持预约");
						$appointmentTimeFlag = false;
						return false;
					}

					if (($date - $currentDate) < 3600000) {
						$("#forwardForm div:eq(6) > span").text("小于一小时无法预约");
						$appointmentTimeFlag = false;
					} else {
						if ((($date - $currentDate) / 86400000) > 7) {
							$("#forwardForm div:eq(6) > span").text(
									"预约时间只能在七天内");
							$appointmentTimeFlag = false;
							return false;
						}

						var $day = $date.getTime() % 86400000;
						$day += 28800000;
						if (($day > 28800000 && $day < 43200000)
								|| ($day > 50400000 && $day < 61200000)) {
							$appointmentTimeFlag = true;
						} else {
							$("#forwardForm div:eq(6) > span").text(
									"预约时间只能是早上八点到中午十二点或者下午两点到下午五点");
							$appointmentTimeFlag = false;
						}
					}
				});

		$("#appointmentTime").focus(function() {
			$("#forwardForm div:eq(5) > span").text("");
		});

		var $userPhoneFlag;
		$("#userPhone").blur(function() {
			var $patt = /^1[3-9]\d{9}$/;
			if ($patt.test($("#userPhone").val())) {
				$userPhoneFlag = true;
			} else {
				$userPhoneFlag = false;
			}

			if ($userPhoneFlag == false) {
				$("#forwardForm div:eq(5) > span").text("电话号码不符合标准");
			} else {
				$("#forwardForm div:eq(5) > span").text("");
			}
		});

		$("#submit").click(function() {
			if ($userPhoneFlag) {

			} else {
				$("#forwardForm div:eq(5) > span").text("电话号码不能为空");
				return false;
			}

			if ($appointmentTimeFlag) {

			} else {
				$("#forwardForm div:eq(6) > span").text("预约时间有误，请重新选择");
				return false;
			}
		});
	});
</script>
</html>