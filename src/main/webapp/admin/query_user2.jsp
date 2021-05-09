<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<body>
	<div style="width: 97%;">
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">用户管理页面</h3>
			</div>
		</div>
		<div class="row">

			<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="请输入用户姓名" name="selname"/>
					</div>
					<div class="input-group">
						<input type="hidden" class="form-control" name="method" value="selectNameu"/>
					</div>
						<input type="submit" class="btn btn-default" value = "查询">
				</form>

		</div>
		<br/> 
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">用户信息</h3>
			</div>
			<table id= "useradmin" class="table table-striped table-hover"
				style="margin: 10px; width: 97%;">
				<tr style="border-bottom: solid 2px #DDDDDD">
					<td>用户名</td>
					<td>收货地址</td>
					<td>住址</td>
					<td>姓名</td>
					<td>电话</td>
					<td>身份证号</td>
					<td>积分</td>
					<td>健康状态</td>
					<td>账号状态</td>
					<td>修改</td>
				</tr>
			<c:if test="${not empty page}">
        			<c:if test="${not empty page.pages}">
	        			<c:choose>
		        			<c:when test="${page.pageCount <= 10}">
		        				<c:set var="start" value="1"></c:set>
		        				<c:set var="end" value="${page.pageCount}"></c:set>
		        			</c:when>
		        			<c:otherwise>
		        				<c:set var="start" value="${page.currentPage - 5}"></c:set>
		        				<c:set var="end" value="${page.currentPage + 4}"></c:set>
		        				<c:if test="${start < 1}">
		        					<c:set var="start" value="1"></c:set>
		        					<c:set var="end" value="10"></c:set>
		        				</c:if>
		        				<c:if test="${end > data.pageCount}">
		        					<c:set var="end" value="${data.pageCount-1}"></c:set>
		        					<c:set var="start" value="${end - 9}"></c:set>
		        				</c:if>
		        			</c:otherwise>
		        		</c:choose>
		        		<c:forEach var="item" items="${page.pages}">
		        			<tr>
		        				<td>${item.userName}</td>
		        				<td>${item.address.address}</td>
		        				<td>${item.residence}</td>
		        				<td>${item.name}</td>
		        				<td>${item.phone}</td>
		        				<td>${item.idNumber}</td>
		        				<td>${item.integral}</td>
		        				<c:choose>
		        					<c:when test="${item.health == '1'}">
		        					<td>健康</td>
		        					</c:when>
		        					<c:otherwise>
		        					<c:if test="${item.health == '0'}"><td>疑似</td></c:if>
		        					<c:if test="${item.health == '2'}"><td>确诊</td></c:if>
		        					</c:otherwise>
		        				</c:choose>
		        				<c:choose>
		        					<c:when test="${item.state == '1'}">
		        					<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=removeUseradmin&currentPage=${page.currentPage}&pageTotal=1&state=0&userName=${item.userName}"/>' role="button">删除</a></td>
		        					</c:when>
		        					<c:otherwise>
		        					<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=removeUseradmin&currentPage=${page.currentPage}&pageTotal=1&state=1&userName=${item.userName}"/>' role="button">恢复</a></td>
		        					</c:otherwise>
		        				</c:choose>
		        				<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=revamapUser&userName=${item.userName}"/>' role="button">修改</a></td>
		        			</tr>
		        		</c:forEach>
        			</c:if>
        		</c:if>
    		</table> 
    		<ul class="pagination">
			    <c:choose>
			    	<c:when test="${page.currentPage == 1}">
			    		
			    	</c:when>
			    	<c:otherwise>
			    		<li>
				    		<a href='<c:url value='/admin/adminServlet?method=useradminPageAll&currentPage=${page.currentPage - 1}&pageTotal=1'/>' aria-label='Previous'>
				    			<span aria-hidden='true'>上一页</span>
				    		</a>
			    		</li>
			    	</c:otherwise>
			    </c:choose>
			    <c:forEach var="item" begin="${start}" end="${end}">
			    	<c:choose>
			    		<c:when test="${page.currentPage == item}">
				    		<li class='active'>
						    	<a href='<c:url value='/admin/adminServlet?method=useradminPageAll&currentPage=${item}&pageTotal=1'/>'>
						    		${item}
						    	</a>
					    	</li>
			    		</c:when>
			    		<c:otherwise>
			    			<li>
						    	<a href='<c:url value='/admin/adminServlet?method=useradminPageAll&currentPage=${item}&pageTotal=1'/>'>
						    		${item}
						    	</a>
					    	</li>
			    		</c:otherwise>
			    	</c:choose>
			    	
			    </c:forEach>
			    <c:choose>
			    	<c:when test="${page.currentPage == page.pageCount}">
			    	</c:when>
			    	<c:otherwise>
			    		<li>
				    		<a href='<c:url value='/admin/adminServlet?method=useradminPageAll&currentPage=${page.currentPage + 1}&pageTotal=1'/>' aria-label='Next'>
				    			<span aria-hidden='true'>下一页</span>
				    		</a>
			    		</li>
			    	</c:otherwise>
			    </c:choose>
			</ul>
		</div>
	</div>
</body>
</html>