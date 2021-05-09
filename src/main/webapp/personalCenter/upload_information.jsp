<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>信息上传</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap.min.css'/>'
	type="text/css">
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/jquery-1.12.4.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap.js'/>'></script>
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/bootstrap-multiselect.js'/>'></script>
<link rel="stylesheet"
	href='<c:url value='/personalCenter/css/bootstrap-multiselect.css'/>'
	type="text/css" />
<script type="text/javascript"
	src='<c:url value='/personalCenter/js/require-2.3.5.min.js'/>'></script>
<link type="text/css" rel="stylesheet"
	href='<c:url value='/personalCenter/css/up_info.css'/>'>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 信息上传 -->
<body>
	<div class="page-header"
		style="margin: 0px 15px 0px 15px; padding: 0px;">
		<h2 style="color: #DDDDDD">信息上传</h2>
	</div>
	<div class="upload_info_center">
	<!-- 每个form表单uname cookie 获取用户名 -->
		<form action="<%=basePath%>sucessUploadInfoServlet/uploadInfo"
			method="post" class="form-inline">
			<div class="uploadBJ" style="width: 500px; height: 500px; margin: 0px auto; padding-left: 80px;">
			<p>
				<input type="hidden" value="" id="userName" name="userName" />
			</p>
			<p>
				<input type="hidden" value="" id="name" name="name" />
			</p>
			<div class="form-group">
				<p class="p1">
					<label for="exampleInputName2">今日体温：</label> <input
						class="form-control" style="width: 65px;" type="text" value=""
						autocomplete="off" id="userCelsius" name="userCelsius"
						maxlength="4" required="required" /><label for="exampleInputName2">℃
					</label><span id="uctext"
						style="font-size: 12px; color: red; display: none;">请输入有效体温信息（在30.0~45.9℃）</span>
				</p>
			</div>
			
			<p>
				<input type="hidden" value="" id="statu" name="statu" />
			</p>
			<br />
			<div class="form-group">
				<div class="slt">
					<p class="p2">
						<label for="exampleInputName2">今日行程:</label> 
						
						<select name="itinerary" class="itinerary" style="width: 100%;" multiple="multiple" required>
							<!-- bootstrap-multiple.min.js select option 控制变量 431行 -->
							<!-- options -->
								
						</select>
						<input type="hidden" value="" id="LuCheng" name="LuCheng" />
					</p>
				</div>

				<p>
					<input type="hidden" value="" id="uploadDade" name="uploadDade" />
				</p>
				<p>
					<input class="btn btn-success" id="btn-sb" type="submit" value="上传"
						name="submit" />
				</p>
				</div>
			</div>
		</form>
	</div>
</body>

<script type="text/javascript">
	var $userCelsiusFlag;
	$("#userCelsius").blur(function() {
		var uc = $("#userCelsius");
		var celsius = /^(3\d|4[0-5])(\.\d)?$/i;
		if ($("#userCelsius").val() != "") {
			if (!celsius.test(uc.val())) {
				$("#uctext").css("display", "block");
				$userCelsiusFlag = false;
			} else {
				$("#uctext").css("display", "none");
				$userCelsiusFlag = true;
			}
		} else {
			$("#uctext").css("display", "none");
		}
	});
	$("#btn-sb").click(function() {
		if ($("#userCelsius").val() != "") {
			if ($userCelsiusFlag) {
			} else {
				$("#uctext").css("display", "block");
				alert("温度输入错误");
				$("#userCelsius").val("");
				return false;
			}
		}
	});
	
	$("select[name='itinerary']").multiselect({
		enableClickableOptGroups: true,
		enableCollapsibleOptGroups: true,
		enableCollapsibleOptGroups: true,
		buttonWidth:'auto',  //选择框的大小
		includeSelectAllOption: true,
		selectAllJustVisible:true,
		 //下拉回调函数 
		onDropdownShow: function (event) { 
		addOption();
		},  
	});
	function addOption(){
		$.get({
			"url" : "<%=basePath%>userServlet/selectSiteAll",
			"data" : null,
			"dataType" : "json",
			"success" : function(data) {
					var sj = [];
					for (var i = 0; i < data.length; i++) {
						var ssjj = {};
						var obj = data[i];
						ssjj.value = obj.Sname;
						ssjj.text = obj.Sid;
						sj.push(ssjj)
					}
					$("select[name='itinerary']").multiselect('dataprovider',sj);
			},
		});
		
		//var data=[{value:'1',label:'一室一厅',selected:true},{value:'2',label:'两室一套'}];
		
	}
	$("select[name='itinerary']").change(function(){
		$("#LuCheng").val($("select[name='itinerary']").val());
		});
		
		

	$('#example-multiple-selected').multiselect();


/* 	$("#btn-sb").click(function(){
		var np = $("#userCelsius").val();
		var ap = $("#LuCheng").val();
		if (!np) {
			alert("温度信息为空");
			return false;
		}else if(!ap) {
			alert("地点信息为空");
			return false;
		}else{
			alert("上传成功");
		}
	}); */
	

	$(document).ready(function(){
		var time = new Date();
		var newtime = time.getHours();
		var sjd = newtime-9;
		
		if(sjd == 0 || sjd == 1){
			$("#btn-sb").click(function(){
				var np = $("#userCelsius").val();
				var ap = $("#LuCheng").val();
				if (!np) {
					alert("温度信息为空");
					return false;
				}else if(!ap) {
					alert("地点信息为空");
					return false;
				}else{
					alert("上传成功");
				}
			});
			
		}else{
			$("#btn-sb").click(function(){
				alert("每晚21:00:00至23:00:00才可上传信息");
				return false;	
			});
		}
		
	});
	
</script>


</html>