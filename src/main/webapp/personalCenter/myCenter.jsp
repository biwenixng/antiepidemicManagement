<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 查看健康码 -->
<title>个人中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse"
				style="border-radius: 0px; margin: 0px;">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">校园健康防疫平台</a>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href='<c:url value='/web/index.jsp'/>'>首页<span class="sr-only">(current)</span></a></li>
							<li><a href='<c:url value='/shop/look_shopping.jsp'/>'>购物首页<span class="sr-only">(current)</span></a></li>
							<li class="active"><a href="#">个人中心</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
						<c:choose>
						<c:when test="${not empty username}">
           <li class="active"><a href="#">${username} <span class="sr-only">(current)</span></a></li>
                <li>
                
                    <a href="<c:url value="/UserQuitServlet"/>"><!-- 返回未登录首页 -->
                        <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </c:when>
            <c:otherwise>
            <li class="active"><a href="<c:url value="/user/user_login/user_login.jsp"/>">登入 <span class="sr-only">(current)</span></a></li>
            </c:otherwise>
          </c:choose>
            </ul>
					</div>
				</div>
			</nav>

			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"
				style="background-color: #DDDDDD; height: 700px; padding: 0px;">
				<div style="height: 15px"></div>
				<div class="list-group">
					<a id=center href='<c:url value='/personalCenter/myCenter.jsp'/>' class="list-group-item active"
						style="border-radius: 0px">个人中心</a> <a target="body"
						href='<c:url value='/personalCenter/query_personal_message.jsp'/>'
						class="list-group-item"
						style="border-radius: 0px; background-color: #DDDDDD; color: #458CCA; margin-top: 25px;">查看个人信息</a>
					<a target="body"
						href='<c:url value='/personalCenter/modify_personal_message.jsp'/>'
						class="list-group-item"
						style="border-radius: 0px; background-color: #DDDDDD; color: #458CCA;">修改个人信息</a>
					<a target="body"
						href='<c:url value='/personalCenter/upload_information.jsp'/>'
						class="list-group-item"
						style="border-radius: 0px; background-color: #DDDDDD; color: #458CCA;">信息上传</a>
					<a target="body"
						href='<c:url value='/personalCenter/query_upload_information.jsp'/>'
						class="list-group-item"
						style="border-radius: 0px; background-color: #DDDDDD; color: #458CCA;">查看上传记录</a>
					<a target="body"
						href='<c:url value='/personalCenter/upload_code.jsp'/>'
						class="list-group-item"
						style="border-radius: 0px; background-color: #DDDDDD; color: #458CCA; margin-top: 15px;">上传健康码</a>
					<a target="body"
						href='<c:url value='/personalCenter/query_code.jsp'/>'
						class="list-group-item"
						style="border-radius: 0px; background-color: #DDDDDD; color: #458CCA;">查看健康码</a>
					<a target="body"
						href='<c:url value='/personalCenter/query_make.jsp'/>'
						class="list-group-item"
						style="border-radius: 0px; background-color: #DDDDDD; color: #458CCA;">查看预约记录</a>
					<a target="body"
						href='<c:url value='/personalCenter/query_order.jsp'/>'
						class="list-group-item"
						style="border-radius: 0px; background-color: #DDDDDD; color: #458CCA;">查看购买记录</a>
				</div>
			</div>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 row"
				style="margin: 0px;">
				<iframe name="body" width="100%" height="700" src="<c:url value="/personalCenter/tydsb.jsp"/>"></iframe>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#center~a").hover(function() {
			var index = $("#center~a").index(this);
			$("#center~a:eq(" + index + ")").css({
				"background-color" : "#5bc0de",
				"color" : "black"
			})
		}, function() {
			var index = $("#center~a").index(this);
			$("#center~a:eq(" + index + ")").css({
				"background-color" : "#DDDDDD",
				"color" : "#458CCA"
			})
		});
	});
</script>
</html>