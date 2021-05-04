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
				            <a href="<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=${page.currentPage - 1}&pageTotal=1&transmit=append_commodity2.jsp'/>" aria-label="Previous">
				                <span aria-hidden="true">上一页</span>
				            </a>
				        </li>
			        </c:if>
			        <c:forEach var="index" begin="${start}" end="${end}">
			        	<c:choose>
			        		<c:when test="${index == page.currentPage}">
			        			<li>
					        		<a style="background: blue;color: red;" href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=${index}&pageTotal=1&transmit=append_commodity2.jsp'/>'>${index}</a>
					        	</li>
			        		</c:when>
			        		<c:otherwise>
			        			<li>
					        		<a href='<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=${index}&pageTotal=1&transmit=append_commodity2.jsp'/>'>${index}</a>
					        	</li>
			        		</c:otherwise>
			        	</c:choose>
				        	
			        </c:forEach>
			        <c:if test="${page.currentPage != page.pageCount}">
				        <li id="end">
				            <a href="<c:url value='/doctor/doctorServlet?method=showCurrentPage&currentPage=${page.currentPage + 1}&pageTotal=1&transmit=append_commodity2.jsp'/>" aria-label="Next">
				                <span aria-hidden="true">下一页</span>
				            </a>
				        </li>
			        </c:if>
			    </ul>
			</div>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">添加</button>
			<c:if test="${not empty msg}">
				<p id="msg" style="color:red">${msg}</p>
			</c:if>
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