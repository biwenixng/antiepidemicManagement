<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>对管理员管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" type="text/css">
<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body>
<div style="width: 97%;height: 900px" >
			<div class="panel panel-primary">		
    		<div class="panel-heading" style="margin-top:-1px;">
        		<h3 class="panel-title">对管理员管理页面</h3>
    		</div>
    		</div>
    		
    		<div>
    		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
    		<a href="<c:url value='add_admin.jsp'/>"><input type="button" class="btn btn-info" value="添加管理员"></a>
    		</div>

    		<br/>
    		
		<div class="panel panel-primary">		
    		<div class="panel-heading" style="margin-top:-1px;">
        		<h3 class="panel-title">删除管理员</h3>
    		</div>
    		<br/>
    		
    		<table id="admin" class="table table-striped table-hover" style="margin: 10px;width: 97%;">
        		<tr style="border-bottom: solid 2px #DDDDDD">
            		<td>用户名</td>
            		<td>密码</td>
            		<td>管理员权限</td>
            		<td>删除</td>           		
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
		        					<c:set var="end" value="${data.pageCount}"></c:set>
		        					<c:set var="start" value="${end - 9}"></c:set>
		        				</c:if>
		        			</c:otherwise>
		        		</c:choose>
		        		<c:forEach var="item" items="${page.pages}">
		        			<tr>
		        				<td>${item.userName}</td>
		        				<td>${item.passWord}</td>
		        				<td>${item.juisdIction}</td>
		        				<c:choose>
		        					<c:when test="${item.show == '1'}">
		        					<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=removeAdmin&show=0&currentPage=${page.currentPage}&pageTotal=1&userName=${item.userName}"/>' role="button">删除</a></td>
		        					</c:when>
		        					<c:otherwise>
		        					<td><a class="btn btn-default" href='<c:url value="/admin/adminServlet?method=removeAdmin&show=1&currentPage=${page.currentPage}&pageTotal=1&userName=${item.userName}"/>' role="button">恢复</a></td>
		        					</c:otherwise>
		        				</c:choose>
		        				
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
				    		<a href='<c:url value='/admin/adminServlet?method=adminPageAll&currentPage=${page.currentPage - 1}&pageTotal=1'/>' aria-label='Previous'>
				    			<span aria-hidden='true'>上一页</span>
				    		</a>
			    		</li>
			    	</c:otherwise>
			    </c:choose>
			    <c:forEach var="item" begin="${start}" end="${end}">
			    	<c:choose>
			    		<c:when test="${page.currentPage == item}">
				    		<li class='active'>
						    	<a href='<c:url value='/admin/adminServlet?method=adminPageAll&currentPage=${item}&pageTotal=1'/>'>
						    		${item}
						    	</a>
					    	</li>
			    		</c:when>
			    		<c:otherwise>
			    			<li>
						    	<a href='<c:url value='/admin/adminServlet?method=adminPageAll&currentPage=${item}&pageTotal=1'/>'>
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
				    		<a href='<c:url value='/admin/adminServlet?method=adminPageAll&currentPage=${page.currentPage + 1}&pageTotal=1'/>' aria-label='Next'>
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