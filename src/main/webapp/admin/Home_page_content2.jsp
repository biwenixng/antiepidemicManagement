<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
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
			<div class="panel-heading">
				<h3 class="panel-title" style="font-size: 30px; color: #222222">校内状态</h3>
			</div>
		</div>
		<div class="row" style="width: 100%;">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"
					style="background-color: #06B025; height: 100px">
					<p style="font-size: 25px; color: #FFFFFF;text-align: center;">正常人数</p>
					<p id = "numyes" style="font-size: 20px; color: #222222;text-align: center;">&nbsp;</p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"
					style="background-color: #F9D877; height: 100px">
					<p style="font-size: 25px; color: #FFFFFF;text-align: center;">疑似人数</p>
					<p id = "numnot" style="font-size: 20px; color: #222222;text-align: center;">&nbsp;</p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"
					style="background-color: #FC0502; height: 100px">
					<p style="font-size: 25px; color: #FFFFFF ;text-align: center;" >确诊人数</p>
					<p id = "numdel" style="font-size: 20px; color:#222222;text-align: center;">&nbsp;</p>
				</div>

			</div>
			<br /> <br />
			<div class="panel panel-primary">
				<div class="panel-heading" style="margin-top: -1px;">
					<h3 class="panel-title">今日上传</h3>
				</div>
				<table id ="homeadmin" class="table table-striped table-hover"
					style="margin: 10px; width: 97%;">
					<tr style="border-bottom: solid 2px #DDDDDD">
						<td>用户名</td>
						<td>姓名</td>
						<td>体温</td>
						<td>状态</td>
						<td>行程</td>
						<td>上传时间</td>
						<td></td>
						<td></td>
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
		        				<td>${item.userName.userName}</td>
		        				<td>${item.userName.name}</td>
		        				<td>${item.temperature}</td>
		        				<c:choose>
		        					<c:when test="${item.state == '1'}">
		        					<td>健康</td>
		        					</c:when>
		        					<c:otherwise>
		        					<c:if test="${item.state == '0'}"><td>疑似</td></c:if>
		        					<c:if test="${item.state == '2'}"><td>确诊</td></c:if>
		        					</c:otherwise>
		        				</c:choose>
		        				<td>${item.journey}</td>
		        				<td>${item.uploadtime}</td>

		        			</tr>
		        		</c:forEach>
        			</c:if>
        		</c:if>
    		</table> 
    		<ul class="pagination">
			    <c:choose>
			    	<c:when test="${page.currentPage == 1}">
			    		
			    	</c:when>
			    	<c:otherwise>
			    		<li>
				    		<a href='<c:url value='/admin/adminServlet?method=homePageAll&currentPage=${page.currentPage - 1}&pageTotal=1'/>' aria-label='Previous'>
				    			<span aria-hidden='true'>上一页</span>
				    		</a>
			    		</li>
			    	</c:otherwise>
			    </c:choose>
			    <c:forEach var="item" begin="${start}" end="${end}">
			    	<c:choose>
			    		<c:when test="${page.currentPage == item}">
				    		<li class='active'>
						    	<a href='<c:url value='/admin/adminServlet?method=homePageAll&currentPage=${item}&pageTotal=1'/>'>
						    		${item}
						    	</a>
					    	</li>
			    		</c:when>
			    		<c:otherwise>
			    			<li>
						    	<a href='<c:url value='/admin/adminServlet?method=homePageAll&currentPage=${item}&pageTotal=1'/>'>
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
				    		<a href='<c:url value='/admin/adminServlet?method=homePageAll&currentPage=${page.currentPage + 1}&pageTotal=1'/>' aria-label='Next'>
				    			<span aria-hidden='true'>下一页</span>
				    		</a>
			    		</li>
			    	</c:otherwise>
			    </c:choose>
			</ul>
		</div>
	</div>
	
</body>
<script type="text/javascript">
$.get({
	"url":"<c:url value='/admin/adminServlet?method=homeNum'/>",
	"data":null,
	"dataType":"json",
	"success":function(data) {
		$("#numyes").text(data.numyess);
		$("#numnot").text(data.numnots);
		$("#numdel").text(data.numdels);
	}
})
</script>
</html>