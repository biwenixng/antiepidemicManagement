<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"  href="<c:url value="/bootstrap/css/bootstrap.min.css"/>">
    <script type="text/javascript" src=<c:url value="/bootstrap/js/jq.js"/>></script>
    <script src=<c:url value="/bootstrap/js/bootstrap.min.js"/>></script>
    <style>
        .pg-header {
            height: 25px;
            background-color: #dddddd;
        }

        .pg-content-img {
            height: 370px;
            width: 370px;
            float: left;
            float: top;
            margin-left: 40px;
            margin-top: 60px;

        }
        .pg-content-img1 {
            height: 230px;
            width: 230px;
            float: left;
            float: top;
            margin-left: 140px;
            margin-top: 80px;

        }


        .pg-content-img-img {
            height: 350px;
            width:350px;
            padding-left: 1px;
            padding-top: 1px;
        }
        .pg-content-img-img1 {
            height: 200px;
            width:230px;
            padding-left: 1px;
            padding-top: 1px;
        }
        .pg-content-img1:hover {
        border: 1px solid silver;
        }
        .hover-red:hover {
            color: #FF0000;
        }
        .hover-blue:hover {
            background: #bce8f1;
        }
        #col-1:hover{
            border: 1px solid silver;
        }

        #infor-name{
            font-size: 18px;
            font-weight:900;
        }
        #infor-use{
            color: red;
            font-size: 14px;
            font-weight:400;
        }
        #infor-font{
            background: linear-gradient(to right,hotpink,#ebcccc);
            width: 450px;
            height: 30px;
            font-size: 20px;
            color: white
        }
        #infor-price{
            color: red;
            font-size: x-large
        }
        
         #addcar{
            border: 1px solid silver;
            width: 95px;
            height: 25px;
           background: url("<c:url value='/images/shopping/buycar.png'/>");
                  
        }
        #addcar1{
            border: 1px solid silver;
            width: 95px;
            height: 25px;
           background: url("<c:url value='/images/shopping/buycar.png'/>");
           float: right; 
           float:top;
            margin-top: 3px;
           }
        #addcar:hover{
            border: 1px solid red;
        }
        #addcar1:hover{
            border: 1px solid red;
            
        }
        
        #myshopcar{
        height: 40px;
        width: 115px;
        background: url("<c:url value='/images/shopping/shopcar-1.png'/>") ;
        border: 1px solid silver;
        outline-style: none;
        }
         #myshopcar:hover{
         border: 1px solid red;
         }

    </style>
</head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<body>
<div class=" pg-header">
    <div style="width: 1280px;margin: 0 auto">
        <div class="pg-hover-blue" style="float: left">
            <a href='<c:url value='/index.jsp'/>' class="hover-blue"><font color="#778899">首页</font></a>
        </div>
        <div style="float: right">
        <a  style="display: inline-block;width: 80px;"
                ><font color="#778899">${username}</font></a>
            <a  style="display: inline-block;width: 80px;"
                href="<c:url value='/shop/look_shopping.jsp'/>" class="hover-blue"><font color="#778899">返回药店</font></a>
            <a style="display: inline-block;width: 80px;"
               href="<c:url value="/shop/myorder.jsp"/>"><font color="#778899" class="hover-blue">我的订单</font></a>
            <a style="display: inline-block;width: 80px;"
               href='<c:url value="/personalCenter/myCenter.jsp"/>'><font color="#778899" class="hover-blue">个人中心</font></a>
        </div>
        
    </div>
</div>



<div >
    <div style="width: 1280px;margin: 0 auto;height: 75px;line-height: 75px;">
        <div style="float: left;padding-left: 0px;width: 80px;height: 75px">
            <img src="<c:url value="/images/shopping/tianmao.png"/>"  style="width: 170px;height: 70px ">
        </div>


        <div style="float: left;padding-left: 950px;padding-top: 17px">
            <a href="">
            <input type="button" id="myshopcar"></a>
        </div>
    </div>
</div>

<div class="row" >
    <div class="col-md-4" >
        <div >
            <div class="pg-content-img"  >
            <img src="/antiepidemic_war/${shoponline.shoppingimg}" class="pg-content-img-img" >
        </div>
            </div>
        </div>



    <div class="col-md-4">
        <div >
            <div id="infor-name">
              ${shoponline.synopsis}
                <p></p>
                <p id="infor-use">用于治疗${shoponline.specialname} 使用症状:${shoponline.specialname}  使用方法:${shoponline.usename}</p>
            </div>
            <div id="infor-font" >
                <p> ⏰ 限时秒杀</p>
                </div>
            <div>
            <p></p>
            <p><span style="font-weight: 300">秒 杀 价</span> : <span id="infor-price">￥${shoponline.price}</span></p>
                <p></p>
                <p><span style="font-weight: 300">促  销</span> : 新人首单免运费</p>
                <p><span style="font-weight: 300">配  送 至</span> : <span >长沙</span></p>
                <p>支持 预约收货 送货上门 99元免基础运费（10kg以内）</p>
                <p>由 <span style="color: #FF0000"> 逼哥大药房 </span> 发货，并提供售后服务，下单后2-3天发货</p>
                <p><span style="font-weight: 300">重  量 </span>: ${shoponline.weight}g</p>
                <p><span style="font-weight: 300">保  质  期</span> : ${shoponline.vaildty} </p>
                <p><a href=<c:url value="../shopcarServlet/selectshopcar?cid=${shoponline.cid}"/>><button id="addcar"></button></a> </p>
                <p style="font-weight: 300"><span >温馨提示 ： </span >不支持7天无理由退货,图片为实物拍摄,可能会出现新旧包装更换,包装不影响药物质量,请以收到实物为准。 
                请按药品说明书或在药师指导下购买和使用。</p>
                <p style="font-weight: 300"><span >售后保障：</span >1.如果符合退货条件，请您在线联系客服；经客服审核通过后可为您办理退货。</p>
                <p style="font-weight: 300">2.请您将完整药品及包装（药品外包装、说明书）发票原件、发货凭证等一并退回药品仓库。</p>
                <P style="font-weight: 300">3.药品批次存在更新，涉及外包装、内置、说明书等收货以实际为准。</P>
                </div>
        </div>
    </div>

<div class="col-md-4">
        <div id="test" style="float:top;margin-top:-70px;">
            
        </div>
    </div>
    </div>
    <div style="height: 100px;background: url('<c:url value='/images/shopping/look-down.png'/>') ;">
    </div>
    <div style="height: 55px;background: url('<c:url value='/images/shopping/look-down-2.png'/>') ;">
    </div>
    
<script src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>
<script>
 $(document).ready(function(){
        $.get({
          "url":"<%=basePath%>shopcarServlet/selectAll_online",
          "data": null,
          "dataType":"json",
          "success": function(data){
        	  var num=Math.floor(Math.random()*10+1);
        	    
                 for(var i = num ; i < num+2 ; i++){
                      var  obj = data[i];
                      var path="/antiepidemic_war/"+obj.shoppingimg;
                      var  $div = $("<div class='pg-content-img1' >"+
                               "<a href='<c:url value='/ShopcarServlet?method=selectOne&cid=\"+obj.cid+\"'/>' ><img src='<c:url value='\"+path+\"'/>' class='pg-content-img-img1'></a>"+
                               "<span style='color: red;font-size: x-large'>￥ "+obj.price+"</span>"+
                               " <span><a href='<c:url value='/ShopcarServlet?method=selectshopcar&cid=\"+obj.cid+\"'/>' ><button id='addcar1'></button></a></span>"+
                               "<p><a href='<c:url value='/ShopcarServlet?method=selectOne&cid=\"+obj.cid+\"'/>' class='hover-red'>"+obj.synopsis+"</a></p></div>");
                     // n++;    
                     // if(n>3){n=0;};     
                     $("#test").append($div); 
            }
                
           }
        });
 });
 </script>
</body>
</html>