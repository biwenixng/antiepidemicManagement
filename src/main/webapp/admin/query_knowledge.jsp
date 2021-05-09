<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>防疫新闻管理</title>
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
			<div class="panel-heading">
				<h3 class="panel-title">防疫新闻管理</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<div>
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					<a href="<c:url value='add_knowledge.jsp'/>"><input
						type="button" value="添加新闻" class="btn btn-info"></a>
				</div>
				<br/>
				
				<select id = "xiala" class="form-control" style="width: 45%;border-left-width: 35px">
  					<option>按时间查询</option>
  					<option>按标题查询</option>
				</select>
				<div id="timee" class="input-group" style="width: 100%;">
					<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						<div class="input-group" >
						<input type="text" class="form-control" placeholder="请输入上传时间" name="times"/>
						</div>
						<div class="input-group" >
							<input type="hidden" class="form-control" name="method" value="selectTimen"/>
						</div>
							<input type="submit" value = "查询" class="btn btn-default">
					</form>
				</div>
				<div id="tit" class="input-group" style="width: 100%;">
					<form action="<c:url value='/admin/adminServlet'/>" method="get" class="navbar-form navbar-left">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<div class="input-group" >
						<input type="text" class="form-control" placeholder="请输入标题" name="titles"/>
					</div>
					<div class="input-group" >
						<input type="hidden" class="form-control" name="method" value="selectTitlen"/>
					</div>
						<input type="submit" value = "查询" class="btn btn-default">
				</form>
				</div>
				
			</div>
		</div>
		<br />
		<div class="panel panel-primary">
			<div class="panel-heading" style="margin-top: -1px;">
				<h3 class="panel-title">查询新闻</h3>
			</div>
			<table id="admin" class="table table-striped table-hover"
				style="margin: 10px; width: 97%;">
				<tr style="border-bottom: solid 2px #DDDDDD">
					<td>编号</td>
					<td>标题(点击查看详情)</td>
					<td>添加时间</td>
					<td>删除</td>
				</tr>
				
			</table>
			<ul class="pagination">
		
		</ul>
		</div>
	</div>
</body>
<script type="text/javascript">

$.get({
		"url":"<c:url value='/admin/adminServlet?method=newsAll&currentPage=1&pageTotal=1'/>",
		"data":null,
		"dataType":"json",
		"success":function(data) {
			for(var i = 0;i < data.pages.length;i ++) {
				var $tr = $("<tr></tr>");
				var $pid = $("<td>"+data.pages[i].pid+"</td>");
				var $title = $("<td><a href = '<c:url value='/admin/adminServlet?method=newsDetails&pid=\"+data.pages[i].pid+\"'/>'>"+data.pages[i].title+"</a></td>");
				var $addTime = $("<td>"+data.pages[i].addTime+"</td>");
				$tr.append($pid);
				$tr.append($title);
				$tr.append($addTime);
				if(data.pages.show == '1') {
					var $show = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=removeNews&show=0&currentPage=\"+data.currentPage+\"&pageTotal=1&pid=\"+data.pages[i].pid+\"'/>' role='button'>删除</a></td>");
					$tr.append($show);
				} else {
					var $show = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=removeNews&show=1&currentPage=\"+data.currentPage+\"&pageTotal=1&pid=\"+data.pages[i].pid+\"'/>' role='button'>恢复</a></td>");
					$tr.append($show);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
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
			var $Previous = $("<li id='previous'><a href='<c:url value='/admin/adminServlet?method=newsPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
			$(".pagination").append($Previous);
			for(var i = start;i <= end;i ++) {
				if(data.currentPage == i) {
					var $li = $("<li class='active'><a href='<c:url value='/admin/adminServlet?method=newsPageAll&currentPage=\"+i+\"&pageTotal=1'/>'>"+i+"</a></li>");
					$(".pagination").append($li);
				} else {
					var $li = $("<li><a href='<c:url value='/admin/adminServlet?method=newsPageAll&currentPage=\"+i+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>"+i+"</span></a></li>");
					$(".pagination").append($li);
				}
				
			}
			var $s = data.currentPage + 1;
			var $Next = $("<li id='next'><a href='<c:url value='/admin/adminServlet?method=newsPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
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
	
	
	$("#tit").hide();
	$("#xiala").change(function(){
		var $text = $(this).find('option:selected').text();
		var $tit = $("#tit").text();
		if($text == '按时间查询') {
			$("#timee").show();
			$("#tit").hide();
			
		} else if($text == '按标题查询') {
			$("#timee").hide();
			$("#tit").show();
		}
	})
	
	
	$("#btn1").click(function(){
		var $time = $("#input1").val();
		alert($time);
		
	})
	
	$("#tit > button").click(function(){
		var $tit = $("#tit").text();
	})
</script>
</html>