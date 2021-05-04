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
			<form class="form-inline" action="<c:url value="/doctor/doctorServlet"/>" method="get">
			  <div class="form-group">
			    <input type="text" class="form-control" name="name" placeholder="请输入药品名称">
			  </div>
			  <div class="form-group">
			    <input type="hidden" class="form-control" name="method" value="queryDrug">
			  </div>
			  <div class="form-group">
			    <input type="hidden" class="form-control" name="page" value="query_commodity.jsp">
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
						
					</tbody>
				</table>
				<ul class="pagination">
			        
			    </ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$.get({
		"url":"<c:url value='/doctor/doctorServlet?method=showCommodity&currentPage=1&pageTotal=1'/>",
		"data":null,
		"dataType":"json",
		"success":function(data){
			for(var i = 0;i < data.pages.length;i ++) {
				var $tr = $("<tr></tr>");
				var $shoppingImg = "/Zxiangmu/" + data.pages[i].shoppingImg;
				var $shoppingImg = $("<td><img alt='' src=\"<c:url value='\"+$shoppingImg+\"'/>\" width='70' height='50'></td>")
				var $commodityName = $("<td>"+data.pages[i].commodityName+"</td>");
				var $synopsis = $("<td>"+data.pages[i].synopsis+"</td>");
				var $price = $("<td>"+data.pages[i].price+"</td>");
				var $inventory = $("<td>"+data.pages[i].inventory+"</td>");
				var $specialName = $("<td>"+data.pages[i].special.specialName+"</td>");
				var $useName = $("<td>"+data.pages[i].use.useName+"</td>");
				var $productname = $("<td>"+data.pages[i].classify.productname+"</td>");
				var $weight = $("<td>"+data.pages[i].weight+"</td>");
				var $vaildty = $("<td>"+data.pages[i].vaildty+"</td>")

				$tr.append($shoppingImg);
				$tr.append($commodityName);
				$tr.append($synopsis);
				$tr.append($price);
				$tr.append($inventory);
				$tr.append($specialName);
				$tr.append($useName);
				$tr.append($productname);
				$tr.append($weight);
				$tr.append($vaildty);

				$("table").append($tr);
			}

			var start = 1;
			var end = data.pageCount;
			if(end <= 10) {
				end = data.pageCount;
			} else {
				start = data.currentPage - 5;
				end = data.currentPage + 4;
			}
			
			//边界溢出
			if(start < 1) {
				start = 1;
				end = 10;
			}

			if(end > data.pageCount) {
				end = data.pageCount;
				start = end - 9;
			}
			var $previous;
			if(data.currentPage > start) {
				$previous = data.currentPage - 1;
			} else {
				$previous = start;
			}
			var $next;
			if(data.currentPage < end) {
				$next = data.currentPage + 1;
			} else {
				$next = end;
			}
	        $begin = $("<li id='begin'><a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+$previous+\"&pageTotal=1&transmit=query_commodity2.jsp'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
	        $end = $("<li id='end'><a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+$next+\"&pageTotal=1&transmit=query_commodity2.jsp'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
	        $(".pagination").append($begin);
	        
	        for(var i = start;i <= end;i ++) {
				$li = $("<li></li>");
				$a = $("<a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+i+\"&pageTotal=1&transmit=query_commodity2.jsp'/>'>"+i+"</a>")
				$li.append($a);
				if(i == data.currentPage) {
					$a.css({"background":"blue",
							"color":"red"});
				}
				$(".pagination").append($li);
			}
	        $(".pagination").append($end);

			if(data.currentPage == 1) {
				$("#begin").hide();
			} else {
				$("#begin").show();
			}

			if(data.currentPage == data.pageCount) {
				$("#end").hide();
			} else {
				$("#end").show();
			}
		}
	})
</script>
</html>