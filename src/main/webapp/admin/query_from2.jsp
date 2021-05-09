<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
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
				<h3 class="panel-title">订单管理</h3>
			</div>
		</div>
		<div class="row">
					<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						<div class="input-group" >
						<input type="text" class="form-control" placeholder="请输入订单日期" name="times"/>
						</div>
						<div class="input-group" >
						<input type="hidden" class="form-control" name="method" value="selectfromt"/>
						</div>
							<input type="submit" value = "查询" class="btn btn-default">
					</form>
			</div>
		<br />
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">每日订单</h3>
			</div>
			<table class="table table-striped table-hover"
				style="margin: 10px; width: 97%;">
				<tr style="border-bottom: solid 2px #DDDDDD">
					<td>订单编号</td>
					<td>用户姓名</td>
					<td>下单时间</td>
					<td>优惠金额</td>
					<td>实际金额</td>
					<td>总金额</td>
					<td>总数量</td>
					<td>支付状态</td>
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
		        				<td>${item.orderNumber}</td>
		        				<td>${item.userName}</td>
		        				<td>${item.orderTime}</td>
		        				<td>${item.coupon}</td>
		        				<td>${item.actualamount}</td>
		        				<td>${item.totalmoney}</td>
		        				<td>${item.totalquantity}</td>
		        				<c:choose>
		        					<c:when test="${item.paystatus == '1'}">
		        					<td>已支付</td>
		        					</c:when>
		        					<c:otherwise>
		        					<td>未支付</td>
		        					</c:otherwise>
		        				</c:choose>
		        			</tr>
		        		</c:forEach>
        			</c:if>
        		</c:if>
			</table>
		</div>
		<ul class="pagination">
			   <c:choose>
			    	<c:when test="${page.currentPage == 1}">
			    		
			    	</c:when>
			    	<c:otherwise>
			    		<li>
				    		<a href='<c:url value='/admin/adminServlet?method=fromPageAll&currentPage=${page.currentPage - 1}&pageTotal=1'/>' aria-label='Previous'>
				    			<span aria-hidden='true'>上一页</span>
				    		</a>
			    		</li>
			    	</c:otherwise>
			    </c:choose>
			    <c:forEach var="item" begin="${start}" end="${end}">
			    	<c:choose>
			    		<c:when test="${page.currentPage == item}">
				    		<li class='active'>
						    	<a href='<c:url value='/admin/adminServlet?method=fromPageAll&currentPage=${item}&pageTotal=1'/>'>
						    		${item}
						    	</a>
					    	</li>
			    		</c:when>
			    		<c:otherwise>
			    			<li>
						    	<a href='<c:url value='/admin/adminServlet?method=fromPageAll&currentPage=${item}&pageTotal=1'/>'>
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
				    		<a href='<c:url value='/admin/adminServlet?method=fromPageAll&currentPage=${page.currentPage + 1}&pageTotal=1'/>' aria-label='Next'>
				    			<span aria-hidden='true'>下一页</span>
				    		</a>
			    		</li>
			    	</c:otherwise>
			    </c:choose>
			</ul>
	
		</div>

</body>
</html>