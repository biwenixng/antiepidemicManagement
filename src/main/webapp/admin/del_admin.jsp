<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>对管理员管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" type="text/css">
<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.js'/>"></script>
<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body>
<div style="width: 97%;height: 900px" >
			<div class="panel panel-primary">		
    		<div class="panel-heading" style="margin-top:-1px;">
        		<h3 class="panel-title">对管理员管理页面</h3>
    		</div>
    		</div>
    		
    		<div>
    		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
    		<a href="<c:url value='add_admin.jsp'/>"><input type="button" class="btn btn-info" value="添加管理员"></a>
    		</div>

    		<br/>
    		
		<div class="panel panel-primary">		
    		<div class="panel-heading" style="margin-top:-1px;">
        		<h3 class="panel-title">删除管理员</h3>
    		</div>
    		<br/>
    		
    		<table id="admin" class="table table-striped table-hover" style="margin: 10px;width: 97%;">
        		<tr style="border-bottom: solid 2px #DDDDDD">
            		<td>用户名</td>
            		<td>密码</td>
            		<td>管理员权限</td>
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
		"url":"<c:url value='/admin/adminServlet?method=adminAll&currentPage=1&pageTotal=1'/>",
		"data":null,
		"dataType":"json",
		"success":function(data) {
			for(var i = 0;i < data.pages.length;i ++) {
				var $tr = $("<tr></tr>");
				var $userName = $("<td>"+data.pages[i].userName+"</td>");
				var $passWord = $("<td>"+data.pages[i].passWord+"</td>");
				var $juisdIction = $("<td>"+data.pages[i].juisdIction+"</td>");
				$tr.append($userName);
				$tr.append($passWord);
				$tr.append($juisdIction);
				if(data.pages.show == '1') {
					var $show = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=removeAdmin&show=\"+data.pages[i].show+\"&currentPage=\"+data.currentPage+\"&pageTotal=1&userName=\"+data.pages[i].userName+\"'/>' role='button'>删除</a></td>");
					$tr.append($show);
				} else {
					var $show = $("<td><a class='btn btn-default' href='<c:url value='/admin/adminServlet?method=removeAdmin&show=\"+data.pages[i].show+\"&currentPage=\"+data.currentPage+\"&pageTotal=1&userName=\"+data.pages[i].userName+\"'/>' role='button'>恢复</a></td>");
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
				start = data.pageCurrent - 5;
				end = data.pageCurrent + 4;
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
			var $Previous = $("<li id='previous'><a href='<c:url value='/admin/adminServlet?method=adminPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Previous'><span aria-hidden='true'>上一页</span></a></li>");
			$(".pagination").append($Previous);
			for(var i = start;i <= end;i ++) {
				if(data.currentPage == i) {
					var $li = $("<li class='active'><a href='<c:url value='/admin/adminServlet?method=adminPageAll&currentPage=\"+i+\"&pageTotal=1'/>'>"+i+"</a></li>");
					$(".pagination").append($li);
				} else {
					var $li = $("<li><a href='<c:url value='/admin/adminServlet?method=adminPageAll&currentPage=\"+i+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>"+i+"</span></a></li>");
					$(".pagination").append($li);
				}
				
			}
			var $s = data.currentPage + 1;
			var $Next = $("<li id='next'><a href='<c:url value='/admin/adminServlet?method=adminPageAll&currentPage=\"+$s+\"&pageTotal=1'/>' aria-label='Next'><span aria-hidden='true'>下一页</span></a></li>");
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