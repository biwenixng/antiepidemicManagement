<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单详情</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" type="text/css">
<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body>
	<div class="panel panel-primary">
    		<div class="panel-heading" style="margin-top:-1px;">
        		<h3 class="panel-title">订单详情</h3>
    		</div>
    		<table class="table table-striped table-hover" style="margin: 10px;width: 97%;">
        		<tr style="border-bottom: solid 2px #DDDDDD">
            		<td>订单编号</td>
            		<td>用户姓名</td>
            		<td>下单时间</td>
            		<td>实际金额</td>
            		<td>支付状态</td>
        		</tr>
    		</table> 
    		<div class="panel-heading" style="margin-top:-1px;">
        		<h2 class="panel-title">订单商品</h2>
    		</div>
    		<table class="table table-striped table-hover" style="margin: 10px;width: 97%;">
    		<tr>
        			<td>订单商品</td>
            		<td>商品数量</td>
            		<td>商品单价</td>
            		<td>商品总价</td>
        		</tr>   
        		</table>
		</div>
</body>
</html>