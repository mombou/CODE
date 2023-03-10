<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}
a {
  text-decoration: none;
  color: black;
}
li {
  list-style: none;
}
.wrap {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
}
.login {
  width: 30%;
  height: 600px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
h2 {
  color: tomato;
  font-size: 2em;
}
.login_sns {
  padding: 20px;
  display: flex;
}
.login_sns li {
  padding: 0px 15px;
}
.login_sns a {
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px;
  border-radius: 50px;
  background: white;
  font-size: 20px;
  box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px rgba(0, 0, 0, 0.1);
}
.login_id {
  margin-top: 20px;
  width: 80%;
}
.login_id input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}
.login_pw {
  margin-top: 20px;
  width: 80%;
}
.login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}
.login_etc {
  padding: 10px;
  width: 80%;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}
.submit {
  margin-top: 50px;
  width: 80%;
}
.submit input {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
}
</style>

<script>
	function validateForm(form){
		if(form.userid.value.length === 0){
			alert("아이디를 입력하세요")
			return false
		}
		if(form.userpass.value.length === 0){
			alert("비밀번호를 입력하세요")
			return false
		}
	}
</script>

</head>
<body>

<div class="wrap">
	<div class="login">
		<c:choose>
			<c:when test="${UserId eq null}">
			       <h2>Log-in</h2>
			       <form action="/mvcMember/login.do" method="post" onsubmit="return validateForm(this)">
			       <div class="login_sns">
				       <li><a href=""><i class="fab fa-instagram"></i></a></li>
				       <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
				       <li><a href=""><i class="fab fa-twitter"></i></a></li>
			       </div>
			       <div class="login_id">
			           <input type="text" name="userid" id="userid" placeholder="아이디">
			       </div>
			       <div class="login_pw">
			           <input type="password" name="userpass" id="userpass" placeholder="비밀번호">
			       </div>
			       <div class="login_etc">
			           <div class="forgot_pw">
			           <a href="/mvcMember/find.do?mode=pass">Forgot Password?</a>
			   			</div>
			       </div>
			       <div class="submit">
			           <input type="submit" value="Login"><br><br>
			           <input type="button" value="Join" onclick="location.href='Join.jsp'">
			       </div>
			       </form>
		       </c:when>
		       <c:otherwise>
		       		<h2>${UserId }(${UserName })님 안녕하세요</h2>
		       		<div class="submit">
		       		<input type="button" value="Logout" onclick="location.href='/mvcMember/login.do';">
		       		<c:if test="${UserId eq 'admin' }">
		       		<br><br><input type="button" value="Member List" onclick="location.href='/mvcMember/list.do';">
		       		</c:if>
		       		</div>
		       </c:otherwise>
	       </c:choose>
	</div>
</div>
</body>
</html>
