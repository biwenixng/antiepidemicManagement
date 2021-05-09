<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健康防疫后台管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/main.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body>
	<div>
		<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" target="body" href="<c:url value='admin/Home_page_content.jsp'/>">健康防疫后台管理</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                
                    <a href="#">欢迎您，管理员:${username}<span class="badge"></span></a>
                 
                </li>
                <li>
                    <a href="<c:url value='/AdminQuitServlet'/>"><!-- 返回登录页面 -->
                        <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
		
		<div>
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"
				style="background-color: #DDDDDD; height: 900px; padding: 0px">
				
				<ul class="nav nav-sidebar">
				 	<li class="active"><div class="panel-heading" style="margin-top: -1px; background-color:#337AB7 ">
					<h3 class="panel-title">菜单</h3>
					</div></li>
					<li><a target="body" href="<c:url value='/admin/Home_page_content.jsp'/>">主页</a></li>
					<li><a target="body" href="<c:url value='/admin/query_user.jsp'/>">用户管理</a></li>
					<li><a target="body" href="<c:url value='/admin/query_doctor.jsp'/>">校医管理</a></li>
					<li><a target="body" href="<c:url value='/admin/query_knowledge.jsp'/>">防疫新闻管理</a></li>
					<li><a target="body" href="<c:url value='/admin/query_from.jsp'/>">订单管理</a></li>
				</ul>
			</div>
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<iframe name="body" width="100%" id="main1" style="border: 0;" src="<c:url value='/admin/Home_page_content.jsp'/>"></iframe>
			</div>
		</div>

	</div>
</body>
<script type="text/javascript">
	$("#main1").load(function() {
		var mainheight = $(this).contents().find("body").height() + 30;
		$(this).height(mainheight);
	});
</script>
</html>