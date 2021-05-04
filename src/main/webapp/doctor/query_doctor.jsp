<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>医生预约</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value="/bootstrap/css/main1.css" />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/bootstrap/css/responsive.css" />" type="text/css">
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/jQuery1.12.4.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" title="logoTitle" href="#">预约医生</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation"><a href="<c:url value="/index.jsp"/>">主页</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-12">
				<section id="teams" class="section teams">
					<div class="container">
						<div class="section-header">
							<h2 class="wow fadeInDown animated">医生列表</h2>
						</div>
						<div class="row" id="add">
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$.get({
		"url" : "<%=basePath%>doctorServlet/queryDoctor",
		"data" : null,
		"dataType" : "json",
		"success" : function(data) {
			for (var i = 0; i < data.length; i++) {
				var $div = $("<div class='col-md-3 col-sm-6'></div>");
				var $twodiv = $("<div class='person'></div>");
				var $imgPath = "/antiepidemic_war/" + data[i].imgPath;
				var $img = $("<img src=\"<c:url value='\"+$imgPath+\"'/>\" alt='' class='img-responsive'/>");
				var $threediv = $("<div class='person-content'></div>");
				var $name = $("<h4></h4>");
				$name.text(data[i].name);
				var $p = $("<p></p>");
				$p.text(data[i].synopsis);
				var $a = $("<a class='btn btn-default' href=\"<c:url value='../doctorServlet/subScribe?username=\"+data[i].userName+\"&name=\"+data[i].name+\"'/>\" role='button'>预约</a>");

				$threediv.append($name);
				$threediv.append($p);

				$twodiv.append($img);
				$twodiv.append($threediv);
				$twodiv.append($a);
				
				$div.append($twodiv);

				$("#add").append($div);
			}
		}
	})
</script>
</html>