<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<style>
#welcome {
	width: 600px;
	height: 260px;
	background-color: #e9e9e9;
	text-align: center;
	border-radius: 30px;
	align-self: center;
	position: absolute;
 	left: 25%;
}
</style>
</head>
<body>
<%-- <jsp:include page="../common/Category.jsp" /> --%>
<%-- <jsp:include page="../common/Link.jsp" /> --%>
<jsp:include page="Index.jsp"/>
<div id = "welcome" > 
<img src = "https://i.imgur.com/EhOMFjo.png"><br/>
회원가입을 환영합니다! <br/> 
다시 로그인해주세요. 
</div>
</body>
</html>