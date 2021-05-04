<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>订单详情</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
</head>
<!-- 订单详情 -->
<body>
<div class="page-header"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: #DDDDDD;display: inline-block">查看订单详情</h2>
		<a href='<c:url value='/MyQueryOrder?method=selectAllPage&username=${username}&pageCount=1&currentPage=1'/>' style="display: inline-block;font-size: 18px;font-weight: bold; margin-left: 550px;">返回</a>
	</div>
	<ul style="list-style: none; padding: 0px 30px ">
	<li style="padding: 10px 10px;color: red;font-size: 25px;">订单号：${ordernumber}</li>
	<c:if test="${not empty page}">
				    <c:if test="${not empty page.pages}">
				        <c:forEach var="news" items="${page.pages}">
				            <li style="padding: 10px 0px; border-bottom: 1px #999999 dashed;
                                                  overflow: hidden;">
                               <div style="float: left"><img src='<c:url value='${news.picture}'/>' alt="#" style=" height:80px;width: 80px; border-radius: 50%;"></div>
                              <p style="display: inline-block;margin-right: 10px;font-size: 20px;">名称:${news.commodityname}</p>
                              <p style="display: inline-block;margin-right: 10px;font-size: 20px;">单价:${news.price}</p>
                              <p style="display: inline-block;margin-right: 10px;font-size: 20px;">数量:${news.number}</p>
                              <p style="display: inline-block;margin-right: 10px;font-size: 20px;">总价:${news.number * news.price}</p>
                            </li>
				        </c:forEach>
				    </c:if>
				</c:if>				
	</ul>
	<nav>
				<ul class="pagination">
				    <c:if test="${not empty page}">
				       <c:if test="${page.currentPage != 1}">
					   <li>
					      <a href='<c:url value='/MyQueryOrder?method=selectOne&ordernumber=${ordernumber}&pageCount=1&currentPage=${page.currentPage -1}'/>' aria-label="Previous"> <span
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
                               <a href='<c:url value='/MyQueryOrder?method=selectOne&ordernumber=${ordernumber}&pageCount=1&currentPage=${index}'/>' style='background-color: blue;color: white;'>${index}</a>
					           </c:when>
					           <c:otherwise>
                               <a href='<c:url value='/MyQueryOrder?method=selectOne&ordernumber=${ordernumber}&pageCount=1&currentPage=${index}'/>'>${index}</a>
                               </c:otherwise>
					        </c:choose> 
					        </li>
					   </c:forEach>
					   <c:if test="${page.currentPage != end}">
					    <li>
					      <a href='<c:url value='/MyQueryOrder?method=selectOne&ordernumber=${ordernumber}&pageCount=1&currentPage=${page.currentPage +1}'/>' aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					      </a>
					   </li>
					   </c:if>
					</c:if>		
				</ul>
			</nav>
</body>
</html>