<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" type="text/css">
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jQuery1.12.4.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
</head>
<body>
<%
if ((String)request.getAttribute("msg") == "error") {%>
    <script>
    alert("请输入商品名称之后再查询!"); 
    </script>
<%}%>
<%
if ((String)request.getAttribute("msg") == "warning") {%>
    <script>
    alert("请输入正确的商品名称!"); 
    </script>
<%}%>
	<div class="container-fluid">
		<div class="jumbotron">
			<h2 class="sub-header">查询商品</h2>
			<form class="form-inline">
			  <div class="form-group">
			    <input type="text" class="form-control" name="name" placeholder="请输入药品名称">
			  </div>
			  <div class="form-group">
			    <input type="hidden" class="form-control" name="method" value="queryDrug">
			  </div>
			  <div class="form-group">
			    <input type="hidden" class="form-control" name="page" value="query_commodity2.jsp">
			  </div>
			  <button type="submit" class="btn btn-default">查询</button>
			</form>
			<hr />
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>商品图片</th>
							<th>商品名称</th>
							<th>商品简介</th>
							<th>价格</th>
							<th>库存</th>
							<th>专冶</th>
							<th>用途</th>
							<th>分类</th>
							<th>重量(克)</th>
							<th>保质期</th>
						</tr>
					</thead>
					<tbody>
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
										<c:if test="${end > page.pageCount}">
											<c:set var="end" value="${page.pageCount}"></c:set>
											<c:set var="start" value="${end - 9}"></c:set>
										</c:if>
									</c:otherwise>
								</c:choose>
								<c:forEach var="item" items="${page.pages}">
									<tr>
										<td><img alt='' src="<c:url value="${item.shoppingImg}"/>" width='70' height='50'></td>
										<td>${item.commodityName}</td>
										<td>${item.synopsis}</td>
										<td>${item.price}</td>
										<td>${item.inventory}</td>
										<td>${item.special.specialName}</td>
										<td>${item.use.useName}</td>
										<td>${item.classify.productname}</td>
										<td>${item.weight}</td>
										<td>${item.vaildty}</td>
									</tr>
								</c:forEach>
							</c:if>
						</c:if>
					</tbody>
				</table>
				<ul class="pagination">
					<c:if test="${page.currentPage != 1}">
				        <li>
				            <a href="<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=${page.currentPage - 1}&pageTotal=1&transmit=query_commodity2.jsp'/>" aria-label="Previous">
				                <span aria-hidden="true">上一页</span>
				            </a>
				        </li>
			        </c:if>
			        <c:forEach var="index" begin="${start}" end="${end}">
			        	<c:choose>
			        		<c:when test="${index == page.currentPage}">
			        			<li>
					        		<a style="background: blue;color: red;" href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=${index}&pageTotal=1&transmit=query_commodity2.jsp'/>'>${index}</a>
					        	</li>
			        		</c:when>
			        		<c:otherwise>
			        			<li>
					        		<a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=${index}&pageTotal=1&transmit=query_commodity2.jsp'/>'>${index}</a>
					        	</li>
			        		</c:otherwise>
			        	</c:choose>
				        	
			        </c:forEach>
			        <c:if test="${page.currentPage != page.pageCount}">
				        <li id="end">
				            <a href="<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=${page.currentPage + 1}&pageTotal=1&transmit=query_commodity2.jsp'/>" aria-label="Next">
				                <span aria-hidden="true">下一页</span>
				            </a>
				        </li>
			        </c:if>
			    </ul>
			</div>
		</div>
	</div>
</body>
</html>