<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
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
	<div style="width: 97%;height: 900px">
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">用户管理页面</h3>
			</div>
		</div>
		<div class="row">

			<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="请输入用户姓名" name="selname"/>
					</div>
					<div class="input-group">
						<input type="hidden" class="form-control" name="method" value="selectNameu"/>
					</div>
						<input type="submit" class="btn btn-default" value = "查询">
				</form>

		</div>
		<br/> 
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">用户信息</h3>
			</div>
			<table id = "useradmin" class="table table-striped table-hover"
				style="margin: 10px; width: 97%;">
				<tr style="border-bottom: solid 2px #DDDDDD">
					<td>用户名</td>
					<td>收货地址</td>
					<td>住址</td>
					<td>姓名</td>
					<td>电话</td>
					<td>身份证号</td>
					<td>积分</td>
					<td>健康状态</td>
					<td>账号状态</td>
					<td>修改</td>
				</tr>
			</table>
			<ul class="pagination">
			</ul>
		</div>
	</div>
	
</body>
<script type="text/javascript">


$.get({
	"url":"<c:url value='/admin/adminServlet?method=useradminAll&currentPage=1&pageTotal=1'/>",
	"data":null,
	"dataType":"json",
	"success":function(data) {
		for(var i = 0;i < data.pages.length;i ++) {
			var $tr = $("<tr></tr>");
			var $userName = $("<td>"+data.pages[i].userName+"</td>");
			$usernames = data.pages[i].userName;
			var $address = $("<td>"+data.pages[i].address.address+"</td>");
			var $residence = $("<td>"+data.pages[i].residence+"</td>");
			var $name = $("<td>"+data.pages[i].name+"</td>");
			var $phone = $("<td>"+data.pages[i].phone+"</td>");
			var $idNumber = $("<td>"+data.pages[i].idNumber+"</td>");
			var $integral = $("<td>"+data.pages[i].integral+"</td>");
			$tr.append($userName);
			$tr.append($address);
			$tr.append($residence);
			$tr.append($name);
			$tr.append($phone);
			$tr.append($idNumber);
			$tr.append($integral);
			if(data.pages[i].health == '1') {
				var $health = $("<td>健康</td>");
				$tr.append($health);
			} else if(data.pages[i].health == '0'){
				var $health = $("<td>疑似</td>");
				$tr.append($health);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
			} else if(data.pages[i].health == '2'){
				var $health = $("<td>确诊</td>");
				$tr.append($health); 
				}
			if(data.pages.state == '1') {
				var $state = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=removeUseradmin&currentPage=\"+data.currentPage+\"&pageTotal=1&state=\"+data.pages[i].state+\"&userName=\"+data.pages[i].userName+\"'/>' role='button'>删除</a></td>");
				$tr.append($state);
			} else {
				var $state = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=removeUseradmin&currentPage=\"+data.currentPage+\"&pageTotal=1&state=\"+data.pages[i].state+\"&userName=\"+data.pages[i].userName+\"'/>' role='button'>恢复</a></td>");
				$tr.append($state);
			}
			var $update = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=revamapUser&userName=\"+data.pages[i].userName+\"'/>' role='button'>修改</a></td>");
				$tr.append($update);
				$("#useradmin").append($tr);
		}

		var start = 1;
		var end = data.pageCount-1;
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
		var $Previous = $("<li id='previous'><a href='<c:url value='/admin/adminServlet?method=useradminPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
		$(".pagination").append($Previous);
		for(var i = start;i <= end;i ++) {
			if(data.currentPage == i) {
				var $li = $("<li class='active'><a href='<c:url value='/admin/adminServlet?method=useradminPageAll&currentPage=\"+i+\"&pageTotal=1'/>'>"+i+"</a></li>");
				$(".pagination").append($li);
			} else {
				var $li = $("<li><a href='<c:url value='/admin/adminServlet?method=useradminPageAll&currentPage=\"+i+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>"+i+"</span></a></li>");
				$(".pagination").append($li);
			}
			
		}
		var $s = data.currentPage + 1;
		var $Next = $("<li id='next'><a href='<c:url value='/admin/adminServlet?method=useradminPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
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