<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的订单</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.min.css"/>">
    <script type="text/javascript" src=<c:url value="/bootstrap/js/jq.js"/>></script>
    <script src=<c:url value="/bootstrap/js/bootstrap.min.js"/>></script>
    <style>
        .pg-header {
            height: 25px;
            background-color: #dddddd;
        }

        .btn-del-1:hover {
            border: 1px solid red;
            color: red;
        }

        .pay {
            width: 150px;
            border: 1px solid silver;
        }

        .pay:hover {
            border: 2px solid red;
            color: red;
        }

        .order {
            margin-top: 5px;
            margin-left: 630px;
            font-size: x-small;
        }

        .order1 {
            margin-top: 23px;
            float: left;
            margin-left: 763px;
            font-size: x-small;
        }

        .order2 {
            float: right;
            margin-right: 0px;
            font-weight: 600
        }
    </style>
</head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<body>
<div class=" pg-header">
    <div style="width: 1280px;margin: 0 auto">
        <div class="pg-hover-blue" style="float: left;margin-left: 150px">
            <a href='<c:url value='/index.jsp'/>'><font color="#778899">首页</font></a>
        </div>
        <div style="float: right">
            <a style="display: inline-block;width: 80px;"
            ><font color="#778899"><span id="name">${username}</span></font></a>
            <a style="display: inline-block;width: 80px;"
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
<div style="float:left; margin-left: 195px;margin-top: 30px; width: 900px;height: 220px;border: 1px solid silver">
    <p style="margin-top: 5px;margin-left: 60px;font-weight: 700">收货人信息</p>
    <p style="margin-left:60px;">
        收货人：<input type="text" id="name1" style="width: 100px;height: 20px;margin-left:13px;">
    </p>
    <p style="margin-left:60px;">
        联系方式：<input type="text" id="phone" style="width: 100px;height: 20px;">
    </p>
    <p style="margin-left:60px;">
        <label for="province">校区：</label>
        <select id="province" name="province" class="form" required
                style="width: 120px; height: 30px; border: 1px solid red; border-radius: 4px;">
        </select>
        <label for="city">楼层：</label>
        <select id="city" name="city" required
                style="width: 120px; height: 30px; border: 1px solid red; border-radius: 4px;">
        </select>
        <label for="area">寝室：</label>
        <select id="area" name="area" required
                style="width: 120px; height: 30px; border: 1px solid red; border-radius: 4px;">
        </select>
    <input type="button" value="确认" class="pay" id="address" style="width: 50px;height: 22px">
    </p>
    <p style="margin-left:60px;font-weight: 700">配送地址：<span id="adds" style="font-weight: 500"><span
            id="address1"></span><span id="address2"></span><span id="address3"></span></span></p>
    <p style="margin-left:60px;font-weight: 700">收货人：<span id="name-get" style="font-weight: 500"></span></p>
    <p style="margin-left:60px;font-weight: 700">联系方式：<span id="phone-get" style="font-weight: 500"></span></p>
</div>
<div style="float:left; margin-left: 195px;margin-top: 30px;width: 900px;height: 100px;border: 1px solid silver">
    <p style="margin-top: 5px;margin-left: 60px;font-weight: 700">配送方式</p>
    <p style="margin-left:60px;">
        <input type="button" value="1.逼哥快递" class="pay" id="way1">
        <input type="button" value="0.上门自提" class="pay" id="way2"></p>
    <p style="margin-left:60px;"><span style="font-weight: 700">您选择的是： </span><span id="sel-way"></span></p>
</div>

<div style="float:left; margin-left: 195px;margin-top: 30px;width: 900px;height: 200px;border: 1px solid silver">

    <table id="table" class="table  table-striped table-hover table-condensed">
        <tr>
            <td style="float:left; margin-left: 60px;">商品</td>
            <td>编号</td>
            <td>单价</td>
            <td>数量</td>
            <td>小计</td>
            <td>库存</td>

        </tr>
        <tr class="warning">
            <td id="pic"><img src="" style="width: 100px;height: 60px;float:left; margin-left: 60px;"></td>
            <td id="cid"></td>
            <td id="price"></td>
            <td id="num"></td>
            <td id="count">0</td>
            <td id="inventory"></td>
        </tr>

    </table>
</div>

<div style="float:left; margin-left: 195px;margin-top: 30px;width: 900px;height: 280px;border: 1px solid silver">
    <p class="order">订单编号：<span class="order2" id="ID"></span></p>
    <p class="order">下单时间：<span class="order2"><span id="ordertime"></span></span></p>
    <p class="order"><span style="color: red" id="num-1">2 </span>件商品，总商品金额：<span class="order2"><span>￥</span><span
            id="count1"></span></span></p>
    <p class="order">运费（南校区￥4.90，其他校区￥9.90）：<span class="order2"><span>￥</span><span id="count2">0</span></span></p>
    <p class="order">优惠（满50减10）：<span class="order2"><span>-￥</span><span id="count3">0</span></span></p>
    <p class="order">应付金额：<span
            style="float: right; margin-right: 0px;font-weight: 900;font-size: x-large;color: red"><span>￥</span><span
            id="counts"></span></span></p>
    <p class="order1">
        <button id="orderto"
                style="width: 135px;height: 35px;font-weight: 900;font-size: large;background: red;color:white;border: hidden">
            提交订单
        </button>
    </p>
</div>
<div style="margin-top: 1000px;height: 100px;background: url('<c:url value='/images/shopping/look-down.png'/>') ;">
</div>
<div style="height: 55px;background: url('<c:url value='/images/shopping/look-down-2.png'/>') ;">
</div>
</body>
<script src="<c:url value="/bootstrap/js/jquery-3.4.1.min.js"/>"></script>
<script>

    $("#cid").text(getCookie("ck4"));
    $("#price").text("￥" + getCookie("ck1"));
    $("#num").text(getCookie("ck2"));
    $("#count").text("￥" + getCookie("ck3"));
    $('#pic>img').attr("src", getCookie("ck5"));

    $("#count1").text(getCookie("ck3"));
    $("#num-1").text(getCookie("ck2"));
    $("#inventory").text(getCookie("ck7"));


    $(document).ready(function () {
        getprovince();//网页加载完成时自动执行 此方法
        $("#province").change(function () {//表示id="province"的标签中的值改变时调用此方法
            getcity($(this).eq(0).val());
        });
        $("#city").change(function () {//以上同理
            getarea($(this).eq(0).val());
        });

        function getprovince() {//使用ajax获取后台返回的数据
            $.get({
                "url": "<%=basePath%>userRegisteredServlet/findSchool",
                "data": null,
                "dataType": "json",
                "success": function (data) {
                    if (data != "null") {
                        for (var i = 0; i < data.length; i++) {
                            var obj = data[i];
                            var $option = $("<option>" + obj.schoolname + "</option>");
                            $("#province").append($option);
                        }
                    }
                }
            });
        };

        function getcity(name) {
            $("#city").empty();//清空之前的数据
            $.get({
                "url": "<%=basePath%>userRegisteredServlet/findFloor",
                "data": "tower=" + name,
                "dataType": "json",
                "success": function (data) {
                    if (data != "null") {
                        for (var i = 0; i < data.length; i++) {
                            var obj = data[i];
                            var $option = $("<option>" + obj.floorname + "</option>");
                            $("#city").append($option);
                        }
                    }
                }
            });
        };

        function getarea(name) {
            $("#area").empty();
            $.get({
                "url": "<%=basePath%>userRegisteredServlet/findDormitory",
                "data": "floor=" + name,
                "dataType": "json",
                "success": function (data) {
                    if (data != "null") {
                        for (var i = 0; i < data.length; i++) {
                            var obj = data[i];
                            var $option = $("<option>" + obj.dormitoryname + "</option>");
                            $("#area").append($option);
                        }
                    }
                }
            });
        };
    });

    function getCookie(name) {
        var strcookie = document.cookie;//获取cookie字符串
        var arrcookie = strcookie.split("; ");//分割
        // 遍历匹配
        for (var i = 0; i < arrcookie.length; i++) {
            var arr = arrcookie[i].split("=");
            if (arr[0] == name) {
                return arr[1];
            }
        }
        return "";
    }

    var isMblNum = /^(((1[3-9][0-9]))+\d{8})$/;
    $("#phone").blur(function () {
        if (!isMblNum.test($(this).val())) {
            alert("请正确填写手机号");
            $("#phone").val("");
        }
    });


    // var pres = ["南校区 ", "北校区 "];
    // var cities = [
    //     ["启智楼 ", "求实楼 ", ],
    //     ["知行楼 ", "致用楼", ],
    //
    // ];
    // var area = [
    //     [
    //         ["101 ", "102","103","104","201 ","202","203","301 ","302","401","501"],
    //         ["101 ", "102","103","104","201 ","202","203","301 ","302","401","501"],
    //     ],
    //     [
    //     	["101 ", "102","103","104","201 ","202","203","301 ","302","401","501"],
    //     	["101 ", "102","103","104","201 ","202","203","301 ","302","401","501"],
    //     ],
    //
    // ];
    var preEle = document.getElementById("pre");
    var cityEle = document.getElementById("city");
    var areaEle = document.getElementById("area");
    // for (var i = 0; i < pres.length; i++) {
    //     var op = new Option(pres[i], i);
    //     preEle.options.add(op);
    // }
    ;

    var val01;

    function chg(obj) {
        val01 = obj.value;
        var citiesval = cities[val01];
        var areaval = area[val01][0];

        cityEle.options.length = 0;
        areaEle.options.length = 0;
        for (i = 0; i < citiesval.length; i++) {
            var op = new Option(citiesval[i], i);
            cityEle.options.add(op);
        }
        for (i = 0; i < areaval.length; i++) {
            var op = new Option(areaval[i], i);
            areaEle.options.add(op);
        }
    };

    function chg2(obj) {
        var val = obj.value;
        var areav = area[val01][val];
        areaEle.options.length = 0;
        for (i = 0; i < areav.length; i++) {
            var op = new Option(areav[i], i);
            areaEle.options.add(op);
        }
    }

    $("#address").click(function () {
        var date = new Date();
        $("#ordertime").text(date.toLocaleString());
        $("#address1").text($("#province").val())
        $("#address2").text($("#city").val())
        $("#address3").text($("#area").val())
        var name = $("#name1").val();
        $("#name-get").text(name);
        var phone = $("#phone").val();
        $("#phone-get").text(phone);
        // if (s == 0) {
        //     $("#count2").text("4.90");
        // } else {
        //     $("#count2").text("9.90");
        // }


        var count1 = $("#count1").text();
        var c1 = parseFloat(count1);
        var count2 = $("#count2").text();
        var c2 = parseFloat(count2);
        var count3s = parseInt(count1 / 50) * 10;
        $("#count3").text(count3s);
        var count3 = $("#count3").text();
        var c3 = parseFloat(count3);
        var counts = (c1 + c2 - c3).toFixed(2);
        $("#counts").text(counts);

        var vNow = new Date();
        var sNow = "";
        sNow += String(vNow.getFullYear());
        sNow += String(vNow.getMonth() + 1);
        sNow += String(vNow.getDate());
        sNow += String(vNow.getHours());
        sNow += String(vNow.getMinutes());
        sNow += String(vNow.getSeconds());
        sNow += String(vNow.getMilliseconds());
        $("#ID").text(sNow);

    });
    $("#way1").click(function () {
        $("#sel-way").text("1");
    })
    $("#way2").click(function () {
        $("#sel-way").text("0");
    })

    $("#orderto").click(function () {
        var ordernumber = $("#ID").text();
        var username = $("#name").text();
        var username1 = $("#name1").val();
        var ordertime = $("#ordertime").text();

        var coupon = $("#count3").text();
        var actualamount = $("#counts").text();
        var totalmoney = $("#count1").text();
        var totalquantity = $("#num-1").text();
        var distribution = $("#sel-way").text();
        var address = $("#adds").text();
        var phone = $("#phone").val();

        var cid = $("#cid").text();
        var number = $("#num").text();
        var picture = $("#pic>img")[0].src;

        var inventory = $("#inventory").text();
        if (username1 == null || username1 == "") {
            alert("请输入收货人姓名");
            return;
        }
        if (username == null || username == "") {
            alert("请登录");
            return;
        }
        if (phone == null || phone == "") {
            alert("请输入联系方式");
            return;
        }
        if (address == null || address == "") {
            alert("请确认收货地址");
            return;
        }
        if (distribution == null || distribution == "") {
            alert("请确认配送方式");
            return;
        }

        location.href = "<c:url value='../shopcarServlet/orderAdd?ordernumber="+ordernumber+"&username="+
            username+"&ordertime="+ordertime+"&coupon="+coupon+"&actualamount="+
            actualamount+"&totalmoney="+totalmoney+"&totalquantity="+totalquantity+"&distribution="+
            distribution+"&address="+address+"&phone="+phone+"&cid="+cid+"&number="+number+"&picture="+picture+"&inventory="+inventory+" '/>"
    });


</script>
</html>