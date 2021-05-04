<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"  href="<c:url value="/bootstrap/css/bootstrap.min.css"/>">
    <script type="text/javascript" src=<c:url value="/bootstrap/js/jq.js"/>></script>
    <script src=<c:url value="/bootstrap/js/bootstrap.min.js"/>></script>
    <style>
        .pg-header {
            height: 25px;
            background-color: #dddddd;
        }
         .btn-del-1:hover{
            border: 1px solid red;
            color: red;
        }
        </style>
</head>
<body >
<div class=" pg-header">
    <div style="width: 1280px;margin: 0 auto">
        <div class="pg-hover-blue" style="float: left">
            <a href='<c:url value='/index.jsp'/>' ><font color="#778899">首页</font></a>
        </div>
        <div style="float: right">
        <a  style="display: inline-block;width: 80px;"
                ><font color="#778899">${username}</font></a>
             <a  style="display: inline-block;width: 80px;"
                href="<c:url value="/shop/look_shopping.jsp"/>" class="hover-blue"><font color="#778899">返回药店</font></a>
            <a style="display: inline-block;width: 80px;"
               href="<c:url value="/shop/myorder.jsp"/>"><font color="#778899" class="hover-blue">我的订单</font></a>
            <a style="display: inline-block;width: 80px;"
               href="<c:url value="/personalCenter/myCenter.jsp"/>"><font color="#778899" class="hover-blue">个人中心</font></a>
        </div>
        <div style="clear: both"></div>
    </div>
</div>

<div class="container">
    <div class="table-responsive">
        <table id="table" class="table  table-striped table-hover table-condensed">
            <tr>
                <td style="width: 100px">商品</td>
                <td ></td>
                <td style="width: 100px">商品编号</td>	
                <td style="width: 100px">单价</td>
                <td style="width: 100px">数量</td>
                <td style="width: 100px">小计</td>
                <td style="width: 100px">库存</td>
                <td style="width: 100px">操作</td>
            </tr>
           <c:forEach items="${shoponlines}" var="shoponline">
			<tr class="warning" id="tr">
            	<td id="pic"><img src="/antiepidemic_war/${shoponline.shoppingimg}"  style="width: 100px;height: 60px" ></td>
            	<td style="font-weight:200" id="synopsis">${shoponline.synopsis}</td>
            	<td id="cid"> ${shoponline.cid}</td>	
            	<td class="price">￥<span class="price-1" id="price">${shoponline.price}</span></td>
            	<td class="num"><button class="del">-</button><span class="zero" id="num">0</span><button class="add">+</button></td>
            	<td class="count" style="font-weight:700" id="count"></td>
            	<td id="inventory"> ${shoponline.inventory}</td>
            	<td><button class="btn-sure" >确认</button><button class="btn-del-1" >删除</button></td>
        	</tr> 
        	</c:forEach>
        	
        
		
        </table>
    </div>
</div>
<div style="margin-top: 500px; height: 100px;background: url('<c:url value='/images/shopping/look-down.png'/>') ;">
    </div>
    <div style="height: 55px;background: url('<c:url value='/images/shopping/look-down-2.png'/>') ;">
    </div>
</body>
<script src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>
<script>

    $(".add").each(function(){
        $(this).click(function(){
            var obj=$(this).siblings(".zero");
            var num=obj.text();
            num++;
            obj.text(num);

            var obj1=$(this).parent().siblings(".price").children(".price-1");
            var price=obj1.text();
            var count=(num*price).toFixed(2);
            var obj2=$(this).parent().siblings(".count");
            obj2.text(count);

        })
    });

    $(".del").each(function(){
        
        $(this).click(function(){
            var obj=$(this).siblings(".zero");
            var num=obj.text();
            if (num > 0) {
                num--;
                obj.text(num);
                var obj1=$(this).parent().siblings(".price").children(".price-1");
                var price=obj1.text();
                var count=(num*price).toFixed(2);
                var obj2=$(this).parent().siblings(".count");
                obj2.text(count);
            }
        })
    });
     $(".btn-sure").each(function(){
    	 $(this).click(function(){
    	 /*var ck1 =  $("#price").html();
		 var ck2 =  $("#num").html();
		 var ck3 =  $("#count").html();
		 var ck4 =  $("#cid").html();
		 var ck5 = $("#pic>img")[0].src;
		 var ck6=$("#inventory").html();*/

		 var ck1 =  $(this).parent().siblings(".price").children(".price-1").html();
		 var ck2 =  $(this).parent().siblings(".num").children("#num").html();
		 var ck3 =  $(this).parent().siblings("#count").html();
		 var ck4 =  $(this).parent().siblings("#cid").html();
		 var ck5 = $(this).parent().siblings("#pic").children("img")[0].src;
		 var ck6=$(this).parent().siblings("#inventory").html();
		 var ck7=ck6-ck2;
		 if(ck2<1){
			 alert("请加入商品！");
			 return;
			 }
		 if(ck7<0){
			 alert("库存不足！");
			 return;
			 };
	        var date = new Date();
	        date.setDate(date.getDate()+7);          
	        document.cookie = "ck1="+ck1;
	        document.cookie = "ck2="+ck2;
	        document.cookie = "ck3="+ck3;
	        document.cookie = "ck4="+ck4;
	        document.cookie = "ck5="+ck5;
	        document.cookie = "ck7="+ck7;
	        //alert(document.cookie);
	       
    	 location.href = "<c:url value="/shop/order.jsp"/>";
    	 });
     });
     $(".btn-del-1").each(function(){
         $(this).click(function(){
             $(this).parents("tr").remove();
         })
     });

    </script>
</html>