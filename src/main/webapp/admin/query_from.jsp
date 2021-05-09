<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div style="width: 97%;height: 900px">
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
			<table id="admin" class="table table-striped table-hover"
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
			
			</table>
			<ul class="pagination">
				
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript">




$.get({
		"url":"<c:url value='/admin/adminServlet?method=fromAll&currentPage=1&pageTotal=1'/>",
		"data":null,
		"dataType":"json",
		"success":function(data) {
			for(var i = 0;i < data.pages.length;i ++) {
				var $tr = $("<tr></tr>");
				var $orderNumber = $("<td>"+data.pages[i].orderNumber+"</td>");
				var $userName = $("<td>"+data.pages[i].userName+"</td>");
				var $orderTime = $("<td>"+data.pages[i].orderTime+"</td>");
				var $coupon = $("<td>"+data.pages[i].coupon+"</td>");
				var $actualamount = $("<td>"+data.pages[i].actualamount+"</td>");
				var $totalmoney = $("<td>"+data.pages[i].totalmoney+"</td>");
				var $totalquantity = $("<td>"+data.pages[i].totalquantity+"</td>");
				$tr.append($orderNumber);
				$tr.append($userName);
				$tr.append($orderTime);
				$tr.append($coupon);
				$tr.append($actualamount);
				$tr.append($totalmoney);
				$tr.append($totalquantity);
				if(data.pages[i].paystatus == '1') {
					var $paystatus = $("<td>已支付</td>");
					$tr.append($paystatus);
				} else {
					var $paystatus = $("<td>未支付</td>");
					$tr.append($paystatus);
				}
				$("#admin").append($tr);
			}

			var start = 1;
			var end = data.pageCount;
			if(data.pageCount <= 10) {
				start = 1;
				end = data.pageCount;
			} else {
				start = data.currentPage - 5;
				end = data.currentPage + 4;
			}

			if(start < 1) {
				start = 1;
				end = 10;
			}

			if(end > data.pageCount) {
				end = data.pageCount;
				start = end - 9;
			}
			
		    var $s = data.currentPage - 1;
			var $Previous = $("<li id='previous'><a href='<c:url value='/admin/adminServlet?method=fromPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
			$(".pagination").append($Previous);
			for(var i = start;i <= end;i ++) {
				if(data.currentPage == i) {
					var $li = $("<li class='active'><a href='<c:url value='/admin/adminServlet?method=fromPageAll&currentPage=\"+i+\"&pageTotal=1'/>'>"+i+"</a></li>");
					$(".pagination").append($li);
				} else {
					var $li = $("<li><a href='<c:url value='/admin/adminServlet?method=fromPageAll&currentPage=\"+i+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>"+i+"</span></a></li>");
					$(".pagination").append($li);
				}
				
			}
			var $s = data.currentPage + 1;
			var $Next = $("<li id='next'><a href='<c:url value='/admin/adminServlet?method=fromPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
			$(".pagination").append($Next);

			if(data.currentPage == 1) {
				$("#previous").hide();
			} else {
				$("#previous").show();
			}

			if(data.currentPage == data.pageCount) {
				$("#next").hide();
			} else {
				$("#next").show();
			}
		}
	})
</script>
</html>