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
	<style type="text/css" >
		
	</style>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<body>
<div style="width: 97%;height: 900px">
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
				<table id = "messadmin" class="table table-striped table-hover"
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
				</table>
				<ul class="pagination">
			</ul>
			</div>
			</div>
	
</body>
<script type="text/javascript">
$.get({
	"url":"<%=basePath%>adminServlet/homeAll",
	"data":"currentPage=1&pageTotal=1",
	"dataType":"json",
	"success":function(data) {
		for(var i = 0;i < data.pages.length;i ++) {
			var $tr = $("<tr></tr>");
			var $userName = $("<td>"+data.pages[i].username+"</td>");
			var $name = $("<td>"+data.pages[i].name+"</td>");
			var $temperature = $("<td>"+data.pages[i].temperature+"</td>");

			if(data.pages[i].state == '1') {
				var $state = $("<td>健康</td>");
				$tr.append($state);
			} else if(data.pages[i].state == '0'){
				var $state = $("<td>疑似</td>");
				$tr.append($state);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
			} else if(data.pages[i].state == '2'){
				var $state = $("<td>确诊</td>");
				$tr.append($state); 
				}
			var $journey = $("<td>"+data.pages[i].journey+"</td>");
			var $uploadtime = $("<td>"+data.pages[i].uploadtime+"</td>");
			$tr.append($userName);
			$tr.append($name);
			$tr.append($temperature);
			$tr.append($state);
			$tr.append($journey);
			$tr.append($uploadtime);

			$("#messadmin").append($tr);
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
		var $Previous = $("<li id='previous'><a href='<c:url value='../adminServlet/homePageAll?currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
		$(".pagination").append($Previous);
		for(var i = start;i <= end;i ++) {
			if(data.currentPage == i) {
				var $li = $("<li class='active'><a href='<c:url value='../adminServlet/homePageAll?currentPage=\"+i+\"&pageTotal=1'/>'>"+i+"</a></li>");
				$(".pagination").append($li);
			} else {
				var $li = $("<li><a href='<c:url value='../adminServlet/homePageAll?currentPage=\"+i+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>"+i+"</span></a></li>");
				$(".pagination").append($li);
			}
			
		}
		var $s = data.currentPage + 1;
		var $Next = $("<li id='next'><a href='<c:url value='../adminServlet/homePageAll?currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
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
$.get({
		"url":"<%=basePath%>adminServlet/homeNum",
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