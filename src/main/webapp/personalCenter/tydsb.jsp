<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#imageId{
display:block;
position:relative;
margin:auto;
}
</style>
</head>
<body>
<h1 align="center" style="color: #B1191A" >欢迎来到个人中心</h1>
<img id="imageId" width="800" height="580" src='<c:url value="/personalCenter/images/studentInfo.jpg"/>'>
</body>
</html>