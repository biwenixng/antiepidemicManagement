<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--导入css库-->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
    <!--导入jq-->
    <script type="text/javascript" src="bootstrap/js/jq.js"></script>
    <!--导入js库-->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{ text-align: center}
        .div{
            margin: 0 auto;}
        body{
            margin: 0px;
        }
        .zhezhao{
            position: fixed;
            left: 0px;
            top: 0px;
            background: #000;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);

        }
        .tankuang{
            position: relative;
            background: #fff;
            width: 50%;
            height: 80%;
            border-radius: 5px;
            margin: 5% auto;
        }
        #header{
            height: 40px;
        }
        #header-right{
            position: absolute;
            width: 25px;
            height: 25px;
            border-radius: 5px;
            background: red;
            color: #adf3ff;
            right: 5px;
            top: 5px;
            text-align: center;
        }
        td, th {
            padding: 0;
            width: 5px;
        }
    </style>
</head>
<body style="background: url(<c:url value="/video/b1.jpg"/> )" >
<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">校园防疫</a>

            </div>
            <div id="navbar" class="navbar-collapse collapse ">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">防疫专区</a></li>
                    <li>预约看病</li>
                    <li>防疫商城</li>
                    <li>个人中心</li>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${not empty username}">
                            <li class="active"><a href="#">欢迎您 <span class="sr-only">(current)</span></a></li>
                            <li>退出</li>
                        </c:when>
                        <c:otherwise>
                            <li class="active"><a href="<c:url value="/user/user_login/user_login.jsp"/>">登入 <span class="sr-only">(current)</span></a></li>
                            <li><a href="<c:url value="/user/user_login/user_registered.jsp"/>">注册</a></li>
                        </c:otherwise>
                    </c:choose>

                </ul>
            </div>
        </div>
    </nav>

    <div >
        <video width="1100" height="500" loop="loop" autoplay muted  >
            <source src="<c:url value="/video/mp4.webm"/>" type="video/webm">
        </video>
    </div>
</div>

<div>
    <hr>
</div>
<div class="container row=6" >
    <table class="table" id="tab">
        <caption><a href="#">全国疫情状况</a></caption>
    </table>
</div>
<hr>
<div class="container" >
    <div class="row" id="pop">
        <h4><b>热点新闻</b></h4>
        <hr />
    </div>
</div>
<%--滑动照片--%>
<script type="text/javascript">
    guanggao = function (id, _top, _left) {
        var me = id.charAt ? document.getElementById(id) : id, d1 = document.body, d2 = document.documentElement;
        d1.style.height = d2.style.height = '100%'; me.style.top = _top ? _top + 'px' : 0; me.style[(_left > 0 ? 'left' : 'right')] = _left ? Math.abs(_left) + 'px' : 0;
        me.style.position = 'absolute';
        setInterval(function () { me.style.top = parseInt(me.style.top) + (Math.max(d1.scrollTop, d2.scrollTop) + _top - parseInt(me.style.top)) * 0.1 + 'px'; }, 10 + parseInt(Math.random() * 20));
        return arguments.callee;
    };
    window.onload = function () {
        guanggao
        ('demo1', 200, 10)
    }
</script>
<a href="<c:url value="/doctor/query_doctor.jsp"/>"><img src="<c:url value="/video/yuyue.jfif"/>"id="demo1"  width="380" height="222"/></a>
<div style="overflow: hidden;position: fixed;right: 10px;bottom: 20px;z-index: 10;">
    <div style="overflow: hidden;">
        <div style="padding-top:20px;padding-right:50px;padding-bottom:50px;">
            <a href="#" style="float: right;display:none" class="btns maoDian" id="goToTop" ><img src="<c:url value="/video/top.jpg"/>" alt="" width="55px" height="75px">
                <br>回到顶部</a>
        </div>
    </div>
</div>


</body>
<%--疫情详情--%>
<script type="text/javascript">
    $(function() {
        $.ajax({
            "url" : "https://interface.sina.cn/news/wap/fymap2020_data.d.json",
            "type" : "GET",
            "dataType":"jsonp",
            "success" : function(data) {

                var $tr = $("<tr>" +
                    "<td><font size='5' color='#ff7f50'>"+data.data.econNum+"</font><br/>目前确诊</td>"+
                    "<td><font size='5' color='#6495ed'>"+data.data.jwsrNum+"</font><br/>累计境外输入</td>"+
                    "<td><font size='5' color='#ff7f50'>"+data.data.asymptomNum+"</font><br/>无症状</td>"+
                    "<td><font size='5' color='#a9a9a9'>"+data.data.sustotal+"</font><br/>目前重症</td>"+
                    "</tr>");
                $("#tab").append($tr)

                var $tr = $("<tr>" +
                    "<td><font size='5' color='red'>"+data.data.gntotal+"</font><br/>累计确诊</td>"+
                    "<td><font size='5' color='gray'>"+data.data.deathtotal+"</font><br/>累计死亡</td>" +
                    "<td><font size='5' color='#32cd32'>"+data.data.curetotal+"</font><br/>累计治愈</td>"+
                    "<td><font size='5' color='#ffd700'>"+data.data.heconNum+"</font><br/>目前疑似</td>"+
                    "</tr>");
                $("#tab").append($tr)

                var $tr = $(
                    "<td><font size='5' color='#A9A9A9'>"+"截至"+data.data.mtime+"</font></td>"
                    )
                $("#tab").append($tr)
            }
        })
    }, $.ajax({
            "url" : 'popularlzation/selectAll',
            "type" : "post",
            "dataType":"application/json",
            "success" : function(data) {
                <%--for(var i = 0; i < data.length;i ++) {--%>
                <%--    var $div = $("<div class='one col-lg-6'></div>");--%>
                <%--    // var $ep = "/Zxiangmu/" + data[i].imageurl;--%>
                <%--    &lt;%&ndash;var $img = $("<img src=\"<c:url value='\"+$ep+\"'/>\" width='200px' height='150px' style='margin-bottom: 2%;'/><br/>");&ndash;%&gt;--%>
                <%--    var $h6 = $("<a href=\"/popularlzation/doget?pid=\"+data[i].pid>"+data[i].title+"</a>");--%>

                <%--    $div.append($img);--%>
                <%--    $div.append($h6);--%>
                <%--    $("#pop").append($div);--%>
                <%--}--%>
                console.log(data)
                alert("11")
            }
        })
        ,
        $(window).scroll(function(){
            if ($(window).scrollTop()>1){
                $("#goToTop").fadeIn();
            }
            else
            {
                $("#goToTop").fadeOut();
            }
        }),
        /*回到顶部*/
        $('#goToTop a').click(function(){
        $('html,body').animate({scrollTop:0},'slow');
    })
    )
</script>

</html>
