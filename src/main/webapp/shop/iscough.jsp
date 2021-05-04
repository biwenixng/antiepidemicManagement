<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>药店</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"  href="<c:url value="/bootstrap/css/bootstrap.min.css"/>">
    <script type="text/javascript" src=<c:url value="/bootstrap/js/jq.js"/>></script>
    <script src=<c:url value="/bootstrap/js/bootstrap.min.js"/>></script>
   <style>
        .pg-header {
            height: 25px;
            background-color: #dddddd;
        }


        .pg-picture {
            width: 270px;
            height: 190px;
        }
        /*设置整个按钮区域的宽度和相对区域*/
        .button {
            width: 150px;
            height: 18px;
            position: absolute; /*绝对定位相对于banner div*/
            bottom: -10px;
            right: 5px;
        }
        /*设置点击数字的时候就换一个背景颜色*/
        .one {
            background-color: #ac2925;
        }
        /*将数字按钮变为圆的指针漂浮*/
        .button ul li {
            background-color: #000000; /*黑色*/
            color: #ffffff;
            list-style-type: none;
            width: 18px;
            height: 18px;
            float: left;
            border-radius: 9px; /*变成圆的*/
            text-align: center;
            line-height: 18px;
            cursor: pointer; /*鼠标移动变手指状态*/
            margin-left: 5px;
            margin-top: 10px;

        }
        /*设置一下所有图片的相对位置，都在一个位置*/
        .picture .pg-picture {
            display: block; /*默认有图片不显示*/
            position: absolute; /*绝对定位.对应的是.pic这个div*/
            top: 0;
            float: left;
            margin-left: 30px;
            margin-top: 10px;

        }

        .pg-content-img {
            height: 370px;
            width: 270px;
            float: left;
            float: top;
            margin-left: 40px;
            margin-top: 40px;
        }
        .pg-content-img:hover {
        border: 1px solid silver;
        }

        .pg-content-img-img {
            height: 265px;
            width: 260px;
            padding-left: 1px;
            padding-top: 1px;
        }
        .hover-red:hover {
            color: #FF0000;
        }
        .hover-blue:hover {
            background: #bce8f1;
        }    
          #addcar{
            margin-left: 60px;
            border: 1px solid silver;
            width: 95px;
            height: 25px;
            background: url("<c:url value='/images/shopping/buycar.png'/>");
        }
        #addcar:hover{
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
<body>
<div class=" pg-header">
    <div style="width: 1280px;margin: 0 auto">
        <div class="pg-hover-blue" style="float: left">
            <a href='<c:url value='/web/index.jsp'/>' class="hover-blue"><font color="#778899">首页</font></a>
        </div>
        <div style="float: right">
        <a  style="display: inline-block;width: 80px;"
                ><font color="#778899">${username}</font></a>
            <a  style="display: inline-block;width: 80px;"
                href="<c:url value="/shop/look_shopping.jsp"/>" class="hover-blue"><font color="#778899">返回药店</font></a>
            <a style="display: inline-block;width: 80px;"
               href="<c:url value="/shop/myorder.jsp"/>"><font color="#778899" class="hover-blue">我的订单</font></a>
            <a style="display: inline-block;width: 80px;"
               href='<c:url value='/personalCenter/myCenter.jsp'/>'><font color="#778899" class="hover-blue">个人中心</font></a>
        </div>
        <div style="clear: both"></div>
    </div>
</div>



<div>
   <div style="width: 900px;margin: 0 auto;height: 75px;line-height: 75px">
        <div style="float: left;width: 80px;height: 75px">
            <img src="<c:url value="/images/shopping/hongmao.jpg"/>" style="width: 80px;height: 74px ">
        </div>
      <div style="float: left;padding-left: 140px;padding-top:-5px;">
            <input id="select" type="text" placeholder="搜一搜" style="width: 400px;height: 40px;border: 2px solid red;outline-style: none;">
        </div>
        <div style="float: left;padding-left: 0px;padding-top: 17px;">
            <input id="btn-select" type="button" class="pg-logo" value=" " style=" height: 40px;width: 60px; background: url('<c:url value='/images/shopping/search.png'/>');border: 2px solid red;outline-style: none;">
        </div>
        <div style="float: left;padding-left: 105px;padding-top: 17px" class="shopcar">
            <a href="<c:url value="/ShopcarServlet?method=selectshopcar&cid=0"/>">
            <input type="button" id="myshopcar"></a>
        </div>
    </div>
    </div>

<div class="container">

        <table class="table table-striped table-hover table-condensed" style="width: 1240px;float: left;padding-left: -30px;border-bottom: 1px solid silver">
            <tr>
                <td style="font-weight: 900;font-size: large;">使用方法:</td>
                <td><a href="<c:url value="/shop/isoutuse.jsp"/>" class="hover-red">外用</a></td>
                <td><a href="<c:url value="/shop/isincludeuse.jsp"/>" class="hover-red">含服</a></td>
                <td><a href="<c:url value="/shop/isoral.jsp"/>" class="hover-red">口服</a></td>
                <td></td>
            </tr>
            <tr>
                <td style="font-weight: 900;font-size: large;">类别:</td>
                <td><a href="<c:url value="/shop/isChinese.jsp"/>" class="hover-red">中药</a></td>
                <td><a href="<c:url value="/shop/iswest.jsp"/>" class="hover-red">西药</a></td>
                <td></td>
                <td></td>
            </tr>

            <tr id="usename">
                <td style="font-weight: 900;font-size: large;" >专治:</td>
                <td><a href="<c:url value="/shop/iscough.jsp"/>" class="hover-red">咳嗽</a></td>
                <td><a href="<c:url value="/shop/iscold.jsp"/>" class="hover-red">感冒</a></td>
                <td><a href="<c:url value="/shop/isfever.jsp"/>" class="hover-red">发烧</a></td>
                <td><a href="<c:url value="/shop/isdizzy.jsp"/>" class="hover-red">头晕</a></td>
            </tr>
        </table>

</div>

<div class="row">
    <div class="col-md-3" style="border-right: 1px solid silver;">
        <div style="padding-left: 40px;padding-top: 20px;font-weight: 900;">
            <p style="padding-left: 70px;float:top;margin-top:-30px;font-weight: 900;font-size: large;">药品精选</p>
            <p></p>
            </div>
        <div  id="banner" style="width: 300px;height: 200px;margin: 0 auto;position: relative">
            <div class="picture" >
            
                <a href="<c:url value="/ShopcarServlet?method=selectOne&cid=7"/>">
                    <img src="<c:url value='/images/shopping/yao-7.png'/>" class="pg-picture" id="yao-1-1">
                </a>
                <a href="<c:url value="/ShopcarServlet?method=selectOne&cid=9"/>" style="display: none">
                    <img src="<c:url value='/images/shopping/yao-9.png'/>" class="pg-picture">
                </a>
                <a href="<c:url value="/ShopcarServlet?method=selectOne&cid=11"/>" style="display: none">
                    <img src="<c:url value='/images/shopping/yao-11.png'/>" class="pg-picture">
                </a>
                <a href="<c:url value="/ShopcarServlet?method=selectOne&cid=12"/>" style="display: none">
                    <img src="<c:url value='/images/shopping/yao-12.png'/>" class="pg-picture">
                </a>
            </div>
            <div class="button">
                <ul>
                    <li class="one">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                </ul>
            </div>
        </div>
        </div>


        <div class="col-md-3" >
             
            </div>
            
            <div class="col-md-3">
           
            </div>
            
            <div class="col-md-3">
            
            </div>
            
    </div>
<div style="position: relative;bottom: 0px; height: 100px;background: url('<c:url value='/images/shopping/look-down.png'/>') ;">
    </div>
    <div style="position: relative;bottom: 0; height: 55px;background: url('<c:url value='/images/shopping/look-down-2.png'/>') ;">
    </div>

<script src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>
<script>
    //    页面加载完成之后执行的函数
    $(function () {
        //手动播放图片
        $(".button ul li").hover(function () {
            $(this).addClass("one").siblings().removeClass("one");
            var index = $(this).index();
            i = index;
            $(".picture a").eq(index).stop().fadeIn(500).show().siblings().stop().fadeIn(500).hide();
        });
        //自动播放图片
        var i = 0;
        var t = setInterval(autoplay, 2000);

        function autoplay() {
//            索引自动循环，从1到5再循环回来
            i++;
            if (i > 3) i = 0;
//            找到数字的按钮标签，并将它的背景色加上，兄弟标签的背景色除掉
            $(".button ul li").eq(i).addClass("one").siblings().removeClass("one");
//            找到图片的标签，停止渐入显示，停止渐入隐藏
            $(".picture a").eq(i).stop().fadeIn(500).show().siblings().stop().fadeOut(500).hide();
        }

//        hover进入时停止定时器，进入时设置定时器
        $("#banner").hover(function () {
            clearInterval(t);
        }, function () {
            t = setInterval(autoplay, 2000);
        });
    });
    $('#i2').click(function () {

        var obj = $('#i3');
        var num = obj.text();
        if (num > 0) {
            num--;
            obj.text(num);
        }
    });
    $('#i4').click(function () {
        var obj = $('#i3');
        var num = obj.text();
        num++;
        obj.text(num);
    });
		$(document)
				.ready(
						function() {
							$.get({
								 "url":"<c:url value='/ShopcarServlet'/>",
										"data" : "method=selectBy&specialname=咳嗽",
										"dataType" : "json",
										"success" : function(data) {										
											var n = 0;
											for (var i = 0; i < data.length; i++) {
												 var  obj = data[i];
							                     var path="/Zxiangmu/"+obj.shoppingimg;
							                     var  $div = $("<div class='pg-content-img' >"+
							                             "<a href='<c:url value='/ShopcarServlet?method=selectOne&cid=\"+obj.cid+\"'/>' ><img src='<c:url value='\"+path+\"'/>' class='pg-content-img-img'></a>"+
							                             "<span style='color: red;font-size: x-large'>￥ "+obj.price+"</span>"+
							                             " <span><a href='<c:url value='/ShopcarServlet?method=selectshopcar&cid=\"+obj.cid+\"'/>' ><button id='addcar'></button></a></span>"+
							                             "<p><a href='<c:url value='/ShopcarServlet?method=selectOne&cid=\"+obj.cid+\"'/>' class='hover-red'>"+obj.synopsis+"</a></p></div>");

												n++;
												if (n > 3) {
													n = 1;
												}
												;
												$(".row>div").eq(n)
														.append($div);
											}

										}
									});

						});
		$("#btn-select").click(function () {
			
	    	 var $value=$("#select").val();
	    	 $(".row>div").eq(1).empty();
	    	 $(".row>div").eq(2).empty();
	    	 $(".row>div").eq(3).empty();
	    	// alert($value);
	        $.get({
	          "url":"<c:url value='/ShopcarServlet'/>",
	          "data": "method=selectLike&synopsis=" + $value,
	          "dataType":"json",
	          "success": function(data){
	        	 
	        	     var n=0;
	                 for(var i = 0 ; i < data.length ; i++){
	                	 var  obj = data[i];
	                     var path="/Zxiangmu/"+obj.shoppingimg;
	                     var  $div = $("<div class='pg-content-img' >"+
	                             "<a href='<c:url value='/ShopcarServlet?method=selectOne&cid=\"+obj.cid+\"'/>' ><img src='<c:url value='\"+path+\"'/>' class='pg-content-img-img'></a>"+
	                             "<span style='color: red;font-size: x-large'>￥ "+obj.price+"</span>"+
	                             " <span><a href='<c:url value='/ShopcarServlet?method=selectshopcar&cid=\"+obj.cid+\"'/>' ><button id='addcar'></button></a></span>"+
	                             "<p><a href='<c:url value='/ShopcarServlet?method=selectOne&cid=\"+obj.cid+\"'/>' class='hover-red'>"+obj.synopsis+"</a></p></div>");

	                      n++;    
	                      if(n>3){n=1;};     
	                     $(".row>div").eq(n).append($div); 
	            }
	               
	           }
	        
	        });
	        
	 });
	</script>
</body>
</html>