<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>查看上传记录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
</head>
<!-- 查看上传记录 -->
<body>
<div class="page-header"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: #DDDDDD">查看上传记录</h2>
	</div>
	<table class="table table-bordered table-striped table-hover" id="new">
		<tr>
			<th>体温</th>
			<th>行程</th>
			<th>状态</th>
			<th>上传时间</th>
		</tr>
	<c:if test="${not empty page}">
				    <c:if test="${not empty page.pages}">
				        <c:forEach var="news" items="${page.pages}">
				            <tr>
				                <td>${news.temperature}</td>
				                <td>${news.journey}</td>
				                <td>${news.state}</td>
				                <td>${news.uploadtime}</td>
				            </tr>
				        </c:forEach>
				    </c:if>
				</c:if>
			</table>
			<nav>
				<ul class="pagination">
				    <c:if test="${not empty page}">
				       <c:if test="${page.currentPage != 1}">
					   <li>
					      <a href='<c:url value='../myCenter/selectAllPage?username=${username}&pageCount=3&currentPage=${page.currentPage -1}'/>' aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					      </a>
					   </li>
					   </c:if>
					   <c:choose>
					       <c:when test="${page.pageTotal <= 10}">
					           <c:set var="start" value="1"></c:set>
					           <c:set var="end" value="${page.pageTotal}"></c:set>
					       </c:when>
					       <c:otherwise>
					           <c:set var="start" value="${page.currentPage - 5}"></c:set>
					           <c:set var="end" value="${page.currentPage + 4}"></c:set>
					           <c:if test="${start < 1}">
					               <c:set var="start" value="1"></c:set>
					               <c:set var="end" value="10"></c:set>
					           </c:if>
					           <c:if test="${end > page.pageTotal}">
					               <c:set var="start" value="${page.pageTotal-9}"></c:set>
					               <c:set var="end" value="${page.pageTotal}"></c:set>
					           </c:if>
					       </c:otherwise>
					   </c:choose>
			
					   <c:forEach var="index" begin="${start}" end="${end}">
					        <li>
					        <c:choose>
					           <c:when test="${page.currentPage == index}">
                               <a href='<c:url value='../myCenter/selectAllPage?username=${username}&pageCount=3&currentPage=${index}'/>' style='background-color: blue;color: white;'>${index}</a>
					           </c:when>
					           <c:otherwise>
                               <a href='<c:url value='../myCenter/selectAllPage?username=${username}&pageCount=3&currentPage=${index}'/>'>${index}</a>
                               </c:otherwise>
					        </c:choose> 
					        </li>
					   </c:forEach>
					   <c:if test="${page.currentPage != end}">
					    <li>
					      <a href='<c:url value='../myCenter/selectAllPage?username=${username}&pageCount=3&currentPage=${page.currentPage +1}'/>' aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					      </a>
					   </li>
					   </c:if>
					</c:if>		
				</ul>
			</nav>
</body>
</html>