<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>防疫新闻管理</title>
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
			<div class="panel-heading">
				<h3 class="panel-title">防疫新闻管理</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
			<div>
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					<a href="<c:url value='add_knowledge.jsp'/>"><input
						type="button" value="添加新闻" class="btn btn-info"></a>
				</div>
				<select id = "xiala" class="form-control" style="width: 45%;border-left-width: 35px">
  					<option>按时间查询</option>
  					<option>按标题查询</option>
				</select>
				<div id="timee" class="input-group" style="width: 100%;">
					<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<div class="input-group" >
					<input type="text" class="form-control" placeholder="请输入上传时间" name="times"/>
					</div>
					<div class="input-group" >
						<input type="hidden" class="form-control" name="method" value="selectTimen"/>
					</div>
						<input type="submit" value = "查询" class="btn btn-default">
				</form>
				</div>
				<div id="tit" class="input-group" style="width: 100%;">
					<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<div class="input-group" >
						<input type="text" class="form-control" placeholder="请输入标题" name="titles"/>
					</div>
					<div class="input-group" >
						<input type="hidden" class="form-control" name="method" value="selectTitlen"/>
					</div>
						<input type="submit" value = "查询" class="btn btn-default">
				</form>
				</div>
				<c:if test="${not empty msg}">
					<p style="red">${msg}</p>
				</c:if>
			</div>
		</div>
		<br />
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">查询新闻</h3>
			</div>
			<table id="admin" class="table table-striped table-hover"
				style="margin: 10px; width: 97%;">
				<tr style="border-bottom: solid 2px #DDDDDD">
					<td>编号</td>
					<td>标题(点击查看详情)</td>
					<td>添加时间</td>
					<td>删除</td>
				</tr>
				<c:if test="${not empty page}">
        			
		        		<c:forEach var="item" items="${page}">
		        			<tr>
		        				<td>${item.pid}</td>
		        				<td><a href='<c:url value='/admin/adminServlet?method=newsDetails&pid=${item.pid}'/>'>${item.title}</a></td>
		        				<td>${item.addTime}</td>
		        				<c:choose>
		        					<c:when test="${item.show == '1'}">
		        					<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=removeNewsTow&show=0&pid=${item.pid}"/>' role="button">删除</a></td>
		        					</c:when>
		        					<c:otherwise>
		        					<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=removeNewsTow&show=1&pid=${item.pid}"/>' role="button">恢复</a></td>
		        					</c:otherwise>
		        				</c:choose>
		        			</tr>
		        		</c:forEach>
        			</c:if>
			</table>
			<ul class="pagination">
		
		</ul>
		</div>
		
		</div>
</body>
<script type="text/javascript">
$("#tit").hide();
	$("#xiala").change(function(){
		var $text = $(this).find('option:selected').text();
		var $tit = $("#tit").text();
		if($text == '按时间查询') {
			$("#timee").show();
			$("#tit").hide();
			
		} else if($text == '按标题查询') {
			$("#timee").hide();
			$("#tit").show();
		}
	})
	
	
	$("#btn1").click(function(){
		var $time = $("#input1").val();
		alert($time);
		
	})
	
	$("#tit > button").click(function(){
		var $tit = $("#tit").text();
	})
</script>
</html>