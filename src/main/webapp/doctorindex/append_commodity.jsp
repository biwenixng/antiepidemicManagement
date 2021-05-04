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
<%
if ((String)request.getAttribute("msg") == "success") {%>
    <script>
    alert("添加商品成功！"); 
    </script>
<%}%>
<%
if ((String)request.getAttribute("msg") == "select") {%>
    <script>
    alert("已存在该商品，请勿重复添加"); 
    </script>
<%}%>
<%
if ((String)request.getAttribute("msg") == "format") {%>
    <script>
    alert("文件格式不支付上传！"); 
    </script>
<%}%>
<%
if ((String)request.getAttribute("msg") == "size") {%>
    <script>
    alert("文件大小过大！"); 
    </script>
<%}%>
	<div class="container-fluid">
		<div class="jumbotron">
			<h2 class="sub-header">添加商品</h2>
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
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">添加</button>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">添加新商品</h4>
		      </div>
		      <div class="modal-body">
		      <form action="<c:url value="/doctor/doctorServlet"/>" method="POST" enctype="multipart/form-data">
		        <div id="addForm">
					<h1>添加新商品</h1>
					<hr/>
					<div class="form-group">
						<label for="productName">商品名称*</label> <span></span> <input type="text"
							class="form-control" name="productName" required="required" id="productName" placeholder="2-10个字包含数字">
					</div>
					
					<div class="form-group">
						<label for="price">价格*</label> <span></span> <input type="text"
							class="form-control" name="price" required="required" id="price" placeholder="整数或小数">
					</div>
					
					<div class="form-group">
						<label for="inventory">库存*</label> <span></span> <input type="number"
							class="form-control" name="inventory" required="required" id="inventory" placeholder="二位数到三位数">
					</div>
					
					<div class="form-group">
						<label for="special">专冶</label> <select
							class="form-control" name="special" id="special">
						</select>
					</div>
					
					<div class="form-group">
						<label for="use">用途</label> <select
							class="form-control" name="use" id="use">
						</select>
					</div>
					
					<div class="form-group">
						<label for="synopsis">简介*</label> <span></span>
						<textarea id="synopsis" name="synopsis" placeholder="物品简介20到100字，包含标点符号" required="required" class="form-control" rows="3"></textarea>
					</div>
					
					<div class="form-group">
						<label for="classify">分类</label> <select
							class="form-control" name="classify" id="classify">
						</select>
					</div>
					
					<div class="form-group">
						<label for="weight">重量*</label> <span></span> <input type="text"
							class="form-control" name="weight" required="required" id="weight" placeholder="示例：xxx或xx">
					</div>
					
					<div class="form-group">
						<label for="expirationDate">保质期*</label> <span></span> <input type="text"
							class="form-control" name="expirationDate" required="required" id="expirationDate" placeholder="示例：x年或xx个月">
					</div>
					
					<div class="form-group">
						<label for="productImg">商品图片*</label> <span></span> <input type="file"
							name="productImg" required="required" id="productImg">
					</div>
					<button type="submit" id="addProduct" class="btn btn-default">添加</button>
				</div>
				</form>
		      </div>
		    </div>
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
				var $vaildty = $("<td>"+data.pages[i].vaildty+"</td>");
				
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
	        $begin = $("<li id='begin'><a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+$previous+\"&pageTotal=1&transmit=append_commodity2.jsp'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
	        $end = $("<li id='end'><a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+$next+\"&pageTotal=1&transmit=append_commodity2.jsp'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
	        $(".pagination").append($begin);
	        
	        for(var i = start;i <= end;i ++) {
				$li = $("<li></li>");
				$a = $("<a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+i+\"&pageTotal=1&transmit=append_commodity2.jsp'/>'>"+i+"</a>")
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
	
	$.get({
		"url":"<c:url value='/doctor/doctorServlet?method=queryClassify'/>",
		"data":null,
		"dataType":"json",
		"success":function(data){
			for(var i = 0;i < data.length;i ++) {
				$("#classify").append("<option>"+data[i].productname+"</option>");
			}
		}
	});
	
	$.get({
		"url":"<c:url value='/doctor/doctorServlet?method=querySpecial'/>",
		"data":null,
		"dataType":"json",
		"success":function(data){
			for(var i = 0;i < data.length;i ++) {
				$("#special").append("<option>"+data[i].specialName+"</option>");
			}
		}
	});
	
	$.get({
		"url":"<c:url value='/doctor/doctorServlet?method=queryUse'/>",
		"data":null,
		"dataType":"json",
		"success":function(data){
			for(var i = 0;i < data.length;i ++) {
				$("#use").append("<option>"+data[i].useName+"</option>");
			}
		}
	});
</script>
</html>