<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>查看购买记录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 查看购买记录 -->
<body>
	<div class="page-header"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: #DDDDDD">查看购买记录</h2>
	</div>
	<table class="table table-bordered table-striped table-hover" id="new">
		<tr>
			<th>订单编号</th>
			<th>用户姓名</th>
			<th>总数量</th>
			<th>实际金额</th>
			<th>下单时间</th>
			<th>配送地址</th>
			<th>联系电话</th>
			<th>删除记录</th>
		</tr>
	</table>
	<nav>
		<ul class="pagination">
			
		</ul>
	</nav>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$.get({
        "url":"<%=basePath%>myQueryOrder/selectAll",
        "data": "username=${username}&pageCount=1&currentPage=1",
        "dataType":"json",
        "success": function(data){    	  
      	  var news = data.pages;
               for(var i = 0 ; i <  news.length ; i++){
              	 var  obj = news[i];
                    var  $tr = $("<tr>"+
                             "<td><a href='<c:url value='/MyQueryOrder?method=selectOne&ordernumber="+obj.ordernumber+"&pageCount=1&currentPage=1'/>'>"+obj.ordernumber+"</a></td>"+                 
                             "<td>"+obj.name+"</td>"+
                             "<td>"+obj.totalquantity+"</td>"+
                             "<td>"+obj.actualamount+"</td>"+
                             "<td>"+obj.ordertime+"</td>"+
                             "<td>"+obj.address+"</td>"+
                             "<td>"+obj.phone+"</td>"+
                             "<td><a href='<c:url value='../myQueryOrder/updateAllPage?ordernumber="+obj.ordernumber+"&username=${username}&pageCount=1&currentPage="+data.currentPage+"'/>'>删除</a></td>"+
                            +"</tr>");
                   $("#new").append($tr);
               }
               var start =  1 ;
               var end = data.pageTotal;
               if(end>1){
               if(data.pageTotal <= 10){
                   end = data.pageTotal;
               }else{
                   start = data.currentPage - 5;
                   end = data.currentPage + 4;
               }
               //边界溢出
               if(start < 1 ){
                     start = 1;
                     end = 10;
               }
               if(end > data.pageTotal){
                     end = data.pageTotal;
                     start = end - 9;
               }

               if(data.currentPage != start ){
		         var $fost =$(" <li>"
   	              +"<a href='<c:url value='../myQueryOrder/selectAllPage?username=${username}&pageCount=1&currentPage="+(data.currentPage-1)+"'/>' aria-label='Previous'>"
   	              +"<span aria-hidden='true'>&laquo;</span>"
   	              +"</a>"
   	              +"</li>")
               $(".pagination").append($fost); 
               }
               //遍历输出页码
               for(var i = start ; i <= end; i++){
                   if(i == data.currentPage){
                       var $li= $("<li><a href='<c:url value='../myQueryOrder/selectAllPage?username=${username}&pageCount=1&currentPage="+i+"'/>' style='background-color: blue;color: white;'>"+i+"</a></li>");    
              	     $(".pagination").append($li);
              	     }else{
                   var $li= $("<li><a href='<c:url value='../myQueryOrder/selectAllPage?username=${username}&pageCount=1&currentPage="+i+"'/>'>"+i+"</a></li>");    
              	 $(".pagination").append($li);
              	     } 
               } 
               if(data.currentPage != end ){ 
               var $last =$(" <li>"
         	          +"<a href='<c:url value='../myQueryOrder/selectAllPage?username=${username}&pageCount=1&currentPage="+(data.currentPage+1)+"'/>' aria-label='Next'>"
         	          +"<span aria-hidden='true'>&raquo;</span>"
         	          +"</a>"
         	          +"</li>")
               $(".pagination").append($last);
               } 
               }             
         }
	});
});
</script>
</html>