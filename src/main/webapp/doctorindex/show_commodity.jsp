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
<script type="text/javascript" src="<c:url value="/bootstrap/js/add.js"/>"></script>
<link rel="stylesheet" href=<c:url value="/bootstrap/css/fontcolor.css"/> type="text/css">
</head>
<body>
	<div class="container-fluid">
		<div class="jumbotron">
			<h2 class="sub-header">查询商品</h2>
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
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>