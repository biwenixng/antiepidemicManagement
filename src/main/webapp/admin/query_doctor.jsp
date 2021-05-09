<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>校医管理</title>
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
<%
	if ((String)request.getAttribute("msgs")=="修改成功"){%>
	<script>
	alert("修改成功!");
	</script>
<%}%>
<%
	if ((String)request.getAttribute("msgs")=="修改失败"){%>
	<script>
	alert("修改失败");
	</script>
<%}%>
	<div style="width: 97%; height: 700px" >
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">校医管理</h3>
			</div>
		</div>

		<div>
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			<a href="<c:url value='add_doctor.jsp'/>">
				<input type="button" class="btn btn-info" value="添加校医">
			</a>
		</div>
		
		<br />
		<div class="row">
				<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<div class="input-group" >
						<input type="text" class="form-control" placeholder="请输入姓名" name="selname"/>
						<input type="hidden" class="form-control" name="method" value="selectNamed"/>
					</div>
						<input type="submit" value = "查询" class="btn btn-default">

				</form>
		</div>
		<c:if test="${not empty msg}">
        <span>${msg}</span>
        </c:if>
		<br />

		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">校医</h3>
			</div>
			<table id = "doctor" class="table table-striped table-hover"
				style="margin: 10px; width: 97%;">
				<tr style="border-bottom: solid 2px #DDDDDD">
					<td>用户名</td>
					<td>姓名</td>
					<td>简介</td>
					<td>图片</td>
					<td>是否删除</td>
					<td>修改</td>
				</tr>
			</table>
		</div>
		<ul class="pagination">
		
		</ul>
	</div>

</body>
<script type="text/javascript">

$.get({
	"url":"<c:url value='/admin/adminServlet?method=doctorAll&currentPage=1&pageTotal=1'/>",
	"data":null,
	"dataType":"json",
	"success":function(data) {
		for(var i = 0;i < data.pages.length;i ++) {
			var $tr = $("<tr></tr>");
			var $userName = $("<td>"+data.pages[i].userName+"</td>");
			var $synopsis = $("<td>"+data.pages[i].synopsis+"</td>");
			var $img = "/EP/" + data.pages[i].imgPath;
			var $imgpath = $("<td><img alt='' src=\"<c:url value='\"+$img+\"'/>\" width='70' height='50'></td>");
			$tr.append($userName);
			$tr.append("<td>"+data.pages[i].name+"</td)");
			$tr.append($synopsis);
			$tr.append($imgpath);
			if(data.pages.show == '1') {
				var $show = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=removeDoctor&show=0&&currentPage=\"+data.currentPage+\"&pageTotal=1&userName=\"+data.pages[i].userName+\"'/>' role='button'>删除</a></td>");
				$tr.append($show);
			} else {
				var $show = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=removeDoctor&show=1&currentPage=\"+data.currentPage+\"&pageTotal=1&userName=\"+data.pages[i].userName+\"'/>' role='button'>恢复</a></td>");
				$tr.append($show);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
			}
			var $modify = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=revamapDoctor&userName=\"+data.pages[i].userName+\"'/>' role='button'>修改</a></td>");
			$tr.append($modify);
			$("#doctor").append($tr);
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
		var $Previous = $("<li id='previous'><a href='<c:url value='/admin/adminServlet?method=doctorPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
		$(".pagination").append($Previous);
		for(var i = start;i <= end;i ++) {
			if(data.currentPage == i) {
				var $li = $("<li class='active'><a href='<c:url value='/admin/adminServlet?method=doctorPageAll&currentPage=\"+i+\"&pageTotal=1'/>'>"+i+"</a></li>");
				$(".pagination").append($li);
			} else {
				var $li = $("<li><a href='<c:url value='/admin/adminServlet?method=doctorPageAll&currentPage=\"+i+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>"+i+"</span></a></li>");
				$(".pagination").append($li);
			}
			
		}
		var $s = data.currentPage + 1;
		var $Next = $("<li id='next'><a href='<c:url value='/admin/adminServlet?method=doctorPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
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