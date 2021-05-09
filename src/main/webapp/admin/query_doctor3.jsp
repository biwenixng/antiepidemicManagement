<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>校医管理here</title>
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
	<div style="width: 97%;">
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">校医管理</h3>
			</div>
		</div>

		<div>
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			<a href="<c:url value='add_doctor.jsp'/>"><input type="button"
				value="添加校医" class="btn btn-info"></a>
		</div>
		
		<br />
		<div class="row">
				<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<div class="input-group" >
						<input type="text" class="form-control" placeholder="请输入姓名" name="selname"/>
						<input type="hidden" class="form-control" name="method" value="selectNamed"/>
					</div>
						<input type="submit" value = "查询" class="btn btn-default">

				</form>
		</div>
		<c:if test="${not empty msg}">
		<p style="color: red"> ${msg}</p>
		</c:if>
		<br />

		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">校医</h3>
			</div>
			<table id = "doctor" class="table table-striped table-hover"
				style="margin: 10px; width: 97%;">
				<tr style="border-bottom: solid 2px #DDDDDD">
					<td>用户名</td>
					<td>姓名</td>
					<td>简介</td>
					<td>图片</td>
					<td>是否删除</td>
					<td>修改</td>
					
				</tr>
				<c:if test="${not empty page}">
		        		<c:forEach var="item" items="${page}">
		        			<tr>
		        				<td>${item.userName}</td>
		        				<td>${item.name}</td>
		        				<td>${item.synopsis}</td>
		        				<td><img src="<c:url value="${item.imgPath}"/>" width='70' height='50'/></td>
		        				<c:choose>
		        					<c:when test="${item.show == '1'}">
		        					<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=removeDoctorTow&show=0&userName=${item.userName}"/>' role="button">删除</a></td>
		        					</c:when>
		        					<c:otherwise>
		        					<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=removeDoctorTow&show=1&userName=${item.userName}"/>' role="button">恢复</a></td>
		        					</c:otherwise>
		        				</c:choose>
		        				<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=revamapDoctor&userName=${item.userName}"/>' role="button">修改</a></td>
		        			</tr>
		        		</c:forEach>
        			</c:if>
			</table>
		</div>
	
	</div>

</body>
</html>