<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的订单</title>
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
        .pay{
            width: 150px;
            border: 1px solid silver;
        }
        .pay:hover{
            border: 2px solid red;
            color: red;
        }
        .order{
            margin-top: 5px;
            margin-left: 650px;
            font-size: x-small;
        }
        .order1{
            margin-top: 23px;
            float: left;
            margin-left: 763px;
            font-size: x-small;
        }
        .order2{
            float: right;
            margin-right: 0px;
            font-weight: 600
        }
    </style>
</head>
<body >
<div class=" pg-header">
    <div style="width: 1280px;margin: 0 auto">
        <div class="pg-hover-blue" style="float: left;margin-left: 150px">
            <a href='<c:url value='/web/index.jsp'/>' ><font color="#778899">首页</font></a>
        </div>
        <div style="float: right">
         <a  style="display: inline-block;width: 80px;"
                ><font color="#778899">${username}</font></a>
            <a  style="display: inline-block;width: 80px;"
                href="<c:url value='/shop/look_shopping.jsp'/>"><font color="#778899">返回药店</font></a>
            <a style="display: inline-block;width: 80px;"
               href="<c:url value="/shop/myorder.jsp"/>"><font color="#778899">我的订单</font></a>
            <a style="display: inline-block;width: 80px;"
               href='<c:url value="/personalCenter/myCenter.jsp"/>'><font color="#778899">个人中心</font></a>
        </div>
    </div>
</div>
<div style="float:left; margin-left: 195px;margin-top: 50px; background: cornsilk;width: 900px;height: 30px;border: 1px solid yellow">
<p style="margin-top: 5px;margin-left: 60px;font-weight: 300">温馨提示：订单中存在不支持7天无理由退货商品，请确认相关商品信息后提交订单。</p>
</div>
<div style="float:left; margin-left: 195px;margin-top: 30px; width: 900px;height: 250px;border: 1px solid silver">
    <p style="margin-top: 5px;margin-left: 60px;font-weight: 700">收货人信息 </p>
    <p style="margin-left:60px;font-weight: 700">输入订单编号：<input type="text" id="username"value="${shoporder.ordernumber}"><input type="button" value="确认" class="pay" style="width: 50px;height: 26px;"id="ordersure"></p>
    <p style="margin-left:60px;font-weight: 700">用户姓名：<span style="font-weight: 500">${shoporder.username}</span></p>
    <p style="margin-left:60px;font-weight: 700">配送地址：<span style="font-weight: 500">${shoporder.address}</span></p>
    <p style="margin-left:60px;font-weight: 700">联系方式：<span style="font-weight: 500">${shoporder.phone}</span></p>
    <p style="margin-top: 5px;margin-left: 60px;font-weight: 700">配送方式</p>
    <p style="margin-left:60px;">
<input type="button" value="1.虹猫快递" class="pay" >
        <input type="button" value="0.上门自提" class="pay" ></p>
    <p style="margin-left:60px;"><span style="font-weight: 700">您选择的是：${shoporder.distribution} </span></p>
</div>

<div style="float:left; margin-left: 195px;margin-top: 30px;width: 900px;height: 280px;border: 1px solid silver">
    <p class="order">订单编号：<span class="order2" id="ID">${shoporder.ordernumber}</span></p>
    <p class="order">下单时间：<span class="order2" id="time">${shoporder.ordertime}</span></p>
    <p class="order"><span id="number" style="color: red">${shoporder.totalquantity}</span>件商品，总商品金额：<span class="order2">￥${shoporder.totalmoney}</span></p>
    <p class="order">优惠：<span class="order2"><span>-￥</span><span id="count3">${shoporder.coupon}</span></span></p>
    <p class="order">应付金额（包含快递费）：<span style="float: right; margin-right: 0px;font-weight: 900;font-size: x-large;color: red">￥<span id="pay-money">${shoporder.actualamount}</span></span></p>
    <p class="order1"><button id="pay" style="width: 135px;height: 35px;font-weight: 900;font-size: large;background: red;color:white;border: hidden">支付</button></p>
</div>

<div style="margin-top: 700px;height: 100px;background: url('<c:url value='/images/shopping/look-down.png'/>') ;">
    </div>
    <div style="height: 55px;background: url('<c:url value='/images/shopping/look-down-2.png'/>') ;">
    </div>

</body>
<script src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>
<script>
$("#ordersure").click(function () {
	var $value=$("#username").val();
	window.location.href = "<c:url value='/ShopcarServlet?method=selectOrder&ordernumber='/>" + $value;
	
    });  
var id1 =  $("#ID").html();
if(id1==null||id1==""){
	 alert("请输入正确的订单号！");
	 
	 };

$("#pay").click(function(){
	 var id1 =  $("#ID").html();
	 var id2 =  $("#time").html();
	 var id3 =  $("#pay-money").html();
	 var id4=$("#number").html();
	 //var id4=("云南白药云南白药云南白药");
	 if(id1==null||id1==""){
		 alert("请输入正确的订单编号");
		 return ;
		 };
	
        var date = new Date();
        date.setDate(date.getDate()+7);          
        document.cookie = "id1="+id1;
        document.cookie = "id2="+id2;
        document.cookie = "id3="+id3;
        document.cookie = "id4="+id4;
        //alert(document.cookie);
        location.href = "<c:url value='/pay/index.jsp'/>";           // 页面跳转
    });
 
</script>
</html>