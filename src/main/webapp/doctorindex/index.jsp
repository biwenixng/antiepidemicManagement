<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理界面首页</title>
<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jQuery1.12.4.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<link href="<c:url value="/bootstrap/css/main.css"/>" rel="stylesheet" type="text/css">
</head>
<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 导航部分-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" href="#">药品后台管理</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                    <a href="#">欢迎您，管理员：<span class="badge">${username}</span></a>
                </li>
                <li>
                    <!-- <a href="<c:url value="/user/user_login/doctor_login.jsp"/>"> -->
                    <a href="<%=basePath%>/doctorServlet/exit">
                        <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 中间主体内容部分 -->
<div class="pageContainer">
    <!-- 左侧导航栏 -->
    <div class="pageSidebar">
        <ul class="nav nav-stacked nav-pills">
            <!-- 开始 -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" target="mainFrame">
                    <span class="glyphicon glyphicon-wrench">预约管理</span><span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<c:url value="/doctorindex/query_message.jsp"/>" target="mainContent">
                            <span class="glyphicon glyphicon-asterisk"></span>查看预约消息</a>
                    </li>
                </ul>
            </li>
            <!-- 结束 -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" target="mainFrame">
                    <span class="glyphicon glyphicon-plus">药品管理</span><span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<c:url value="/doctorindex/query_commodity.jsp"/>" target="mainContent">
                            <span class="glyphicon glyphicon-search"></span>查询商品</a>
                    </li>
                    <li>
                        <a href="<c:url value="/doctorindex/append_commodity.jsp"/>" target="mainContent">
                            <span class="glyphicon glyphicon-plus"></span>添加商品</a>
                    </li>
                    <li>
                        <a href="<c:url value="/doctorindex/alter_commodity.jsp"/>" target="mainContent">
                            <span class="glyphicon glyphicon-arrow-up"></span>修改商品</a>
                    </li>
                    <li>
                        <a href="<c:url value="/doctorindex/remove_commodity.jsp"/>" target="mainContent">
                            <span class="glyphicon glyphicon-minus"></span>删除商品</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- 左侧导航和正文内容的分隔线 -->
    <div class="splitter"></div>
    <!-- 正文内容部分 -->
    <div class="pageContent">
    <iframe name="mainContent" width="100%" height="100%" src="<c:url value="/doctorindex/welcome.jsp"/>">
   	</iframe>
    </div>
</div>
<!-- 底部页脚部分 -->
<div class="footer">
    <p class="text-center">
        	biwenxing@版权所有
    </p>
</div>
</body>
<script type="text/javascript">
	$(".nav li").click(function() {
   	$(".active").removeClass('active');
    	$(this).addClass("active");
	});
</script>
</html>