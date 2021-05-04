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
<script type="text/javascript" src="<c:url value="/bootstrap/js/modify.js"/>"></script>
<link rel="stylesheet" href=<c:url value="/bootstrap/css/fontcolor.css"/> type="text/css">
</head>
<body>
<%
if ((String)request.getAttribute("msg") == "success") {%>
    <script>
    alert("修改成功"); 
    </script>
<%}%>
<%
if ((String)request.getAttribute("msg") == "error") {%>
    <script>
    alert("修改失败"); 
    </script>
<%}%>
	<div class="container-fluid">
		<div class="jumbotron">
			<h2 class="sub-header">修改商品</h2>
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
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<ul class="pagination">
			        
			    </ul>
			</div>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">修改商品</h4>
		      </div>
		      <div class="modal-body">
	        		<form action="<c:url value="/doctor/doctorServlet"/>" method="get">
						<div id="modifyFrom">
							<hr/>
							<div class="form-group">
								<label for="productName">商品名称*</label> <span></span> <input type="text"
									class="form-control" name="productName" value="" required="required" id="productName" placeholder="2-10个字包含数字">
							</div>
							
							<div class="form-group">
								<label for="price">价格*</label> <span></span> <input type="text"
									class="form-control" name="price" value="" required="required" id="price" placeholder="整数或小数">
							</div>
							
							<div class="form-group">
								<label for="inventory">库存*</label> <span></span> <input type="number"
									class="form-control" name="inventory" value="" required="required" id="inventory" placeholder="二位数到三位数">
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
								<textarea id="synopsis" name="synopsis" placeholder="物品简介20到100字，包含标点符号" required="required" class="form-control" rows="3">${commodity.synopsis}</textarea>
							</div>
							
							<div class="form-group">
								<label for="classify">分类</label> <select
									class="form-control" name="classify" id="classify">
								</select>
							</div>
							
							<div class="form-group">
								<label for="weight">重量*</label> <span></span> <input type="text"
									class="form-control" name="weight" value="" required="required" id="weight" placeholder="示例：xxx或xx">
							</div>
							
							<div class="form-group">
								<label for="expirationDate">保质期*</label> <span></span> <input type="text"
									class="form-control" name="expirationDate" value="" required="required" id="expirationDate" placeholder="示例：x年或xx个月">
							</div>
							
							<div>
								<input type="hidden" class="form-control" id="cid" name="cid">
							</div>
							
							<div>
								<input type="hidden" class="form-control" name="method" value="confirmModification">
							</div>
							<button type="submit" id="modifyProduct" class="btn btn-warning">修改</button>
						</div>
					</form>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#exampleModal').on('show.bs.modal', function (e) {
		var $cid = $(e.relatedTarget).attr("cid");
		var $currentPage = $(e.relatedTarget).attr("currentPage");
		var $pageTotal = $(e.relatedTarget).attr("pageTotal");
		$.get({
			"url":"<c:url value='/doctor/doctorServlet?method=queryCommodityId'/>",
			"data":"cid=" + $cid,
			"dataType":"json",
			"success":function(data){
				$("#productName").val(data.commodityName);
				$("#price").val(data.price);
				$("#inventory").val(data.inventory);
				$("#synopsis").val(data.synopsis);
				$("#weight").val(data.weight);
				$("#expirationDate").val(data.vaildty);
				$("#cid").val($cid);
			}
		})
	})

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
				var $modify = $("<td><button type='button' data-toggle='modal' data-target='#exampleModal' cid="+data.pages[i].cid+" currentPage="+data.currentPage+" pageTotal=1>修改</button></td>");
				
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
				$tr.append($modify);

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
	        $begin = $("<li id='begin'><a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+$previous+\"&pageTotal=1&transmit=alter_commodity2.jsp'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
	        $end = $("<li id='end'><a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+$next+\"&pageTotal=1&transmit=alter_commodity2.jsp'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
	        $(".pagination").append($begin);
	        
	        for(var i = start;i <= end;i ++) {
				$li = $("<li></li>");
				$a = $("<a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=\"+i+\"&pageTotal=1&transmit=alter_commodity2.jsp'/>'>"+i+"</a>")
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