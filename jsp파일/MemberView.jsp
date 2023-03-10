<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
#nick_used, #nick_notUsed {
	display: none;
	color: red;
}
#false {
	color: red;
}
#true {
	color: red;
}
.side {
	font-size: 12px;
	color: #5D5D5D;
}
.main {
	font-size: 13px;
	color: #5D5D5D;
	font-weight: bold;
}
.text {
	width: 200px;
	height: 32px;
	font-size: 12px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 15px;
	background-color: rgb(233, 233, 233);
}
.button {
	width: 110px;
	height: 32px;
	font-size: 12px;
	color: #ffffff;
	border: 0;
	border-radius: 15px;
	outline: none;
	align-content: center;
	background-color: #E33333;
}
.select {
	width: 200px;
	height: 32px;
	font-size: 12px;
	border: 0;
	padding: 5px 30px 5px 10px;
	border-radius: 15px;
	outline: none;
	background-color: rgb(233, 233, 233);
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script>
	function validateForm(form) {
		if (form.user_pass.value == "") {
		alert("비밀번호를 입력하세요.");
		form.user_pass.focus();
		return false;
		}
		if (form.user_pass.value.length > 10) {
		alert("비밀번호 글자수가 맞지 않습니다.");
		form.user_pass.focus();
		return false;
		}
		if (form.user_pass2.value == "") {
		alert("비밀번호를 입력하세요.");
		form.user_pass2.focus();
		return false;
		}
		if (form.user_pass2.value.length > 10) {
		alert("비밀번호 글자수가 맞지 않습니다.");
		form.user_pass2.focus();
		return false;
		}
		if (form.user_pass.value != form.user_pass2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.user_pass.focus();
		return false;
		}
		if (form.nick.value == "") {
		alert("닉네임을 입력하세요.");
		form.nick.focus();
		return false;
		}
		if (form.nick.value.length > 10) {
		alert("닉네임 글자수가 맞지 않습니다.");
		form.nick.focus();
		return false;
		}
		if (form.answer.value == "") {
			alert("답변을 입력하세요.");
			form.answer.focus();
			return false;
		}
	};
	
	// 닉네임 중복 체크
	function nickCheck(){
		const nick_id = document.querySelector("#nick_id");
		
		if (nick_id.value == "") {
			alert("닉네임을 입력하세요.");
			nick_id.focus();
			return false;
		}
		if (nick_id.value.length < 3 || nick_id.value.length > 10) {
			alert("닉네임 글자수가 맞지 않습니다.");
			nick_id.value = ""
			nick_id.focus();
			return false;
		}
		const param = "?nick_id="+nick_id.value + "&mode=nickCheck";
		const req = new XMLHttpRequest()
		
		req.open("GET", "/mvcMember/check.do" + param);
		req.send()
		req.onreadystatechange = function(){
			if(req.status === 200 && req.readyState === 4){
				if(req.responseText === "1"){
					//alert("중복된 닉네임입니다")
					nick_id.value = ""
					document.querySelector("#nick_used").style.display = "block";
					document.querySelector("#nick_notUsed").style.display = "none";
					document.querySelector("#submit").disabled = true
				}
				else if(req.responseText === "0"){
					//alert("사용 가능한  닉네임입니다")
					document.querySelector("#nick_used").style.display = "none";
					document.querySelector("#nick_notUsed").style.display = "block";
					//document.querySelector("#submit").disabled = false
				}
			}
		}
	}
	
    </script>
</head>

<body>
	<jsp:include page="Index.jsp"/>

	<form name="writeFrm" method="post" action="/member/edit.do"
		onsubmit="return validateForm(this);">
		<table width="50%" align="center">
			<tr>
				<td colspan="4" align="center" bgcolor="#e9e9e9"><h3>회원 정보</h3>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="left">
					<p class="main">
						<font color="#E33333">*</font> 표시는 수정 가능합니다.
					<hr>
					</p>
				</td>
			</tr>
			<tr>
				<td width="20%" rowspan="1" align="center">
					<p class="main">아이디</p>
				</td>
				<td width="40%"><input class="text" type="text" value="${dto.user_id }" disabled></td>

				<td width="40%" colspan="2"></td>
			</tr>
			<td colspan="3"><hr></td>
			<!-- 비밀번호 -->
			<tr>
				<td rowspan="2" align="center">
					<p class="main">
						<font color="#E33333">*</font> 비밀번호
					</p>
				</td>
				<td><input class="text" type="password" id="user_pass"
					name="user_pass">
					<hr></td>

				<td></td>
			</tr>
			<tr>
				<td colspan="4"><p class="side">비밀번호는 6자리 이상이어야 하며 영문과 숫자를
						반드시 포함해야 합니다.</p></td>
			</tr>
			<td colspan="3"><hr></td>
			<tr>
				<td align="center" rowspan="2">
					<p class="main">
						<font color="#E33333">*</font> 비밀번호 확인
					</p>
				</td>
				<td><input class="text" type="password" id="user_pass2"
					name="user_pass2">
					<hr></td>

				<td></td>
			</tr>
			<tr>
				<td colspan="4"><p class="side">비밀번호를 재입력 해주세요.</p></td>
			</tr>
			</tr>
			<td colspan="3"><hr></td>
			<!-- 닉네임 -->
			<tr>
			<tr>
				<td rowspan="2" align="center">
					<p class="main">
						<font color="#E33333">*</font> 닉네임
					</p>
				</td>
				<td><input class="text" type="text" id="nick_id" name="nick_id" value="${dto.nick }">
					<input class="button" type="button" id="idcheckBtn"
					value="중복체크" onclick="nickCheck();">
					<hr></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="4"><p class="side">닉네임은 최대 10글자 사용가능합니다.</p></td>
			</tr>
			<tr id="nick_used">
				<td colspan="4">중복된 닉네임 입니다.</td>
			</tr>
			<tr id="nick_notUsed">
				<td colspan="4">사용가능한 닉네임 입니다.</td>
			</tr>
			<!-- 이름 -->
			<td colspan="3"><hr></td>
			<tr>
				<td align="center">
					<p class="main">
						이름
					</p>
				</td>
				<td colspan="3"><input class="text" type="text" value="${dto.name }" disabled></td>
			</tr>

			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center">
					<p class="main">
						생년월일
					</p>
				</td>
				<td colspan="3">
					<input type="text" class="text" value="${dto.birth }" disabled> 
				</td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center"><p class="main">
						<font color="#E33333">*</font> 질문
					</p></td>
				<td colspan="3">
					<select class="select" id="ask" name="ask">
							<option>질문을 선택해주세요.</option>
							<option class="ask" value="제일 좋아하는 장소는?">제일 좋아하는 장소는?</option>
							<option class="ask" value="소중하게 여기는 보물은?">소중하게 여기는 보물은?</option>
							<option class="ask" value="제일 좋아하는 인물은?">제일 좋아하는 인물은?</option>
							<option class="ask" value="제일 좋아하는 음식은?">제일 좋아하는 음식은?</option>
					</select>
				</td>
			<tr>
				<td align="center">
					<p class="main">
						<font color="#E33333">*</font> 답변
					</p>
				</td>
				<td colspan="3"><input class="text" type="text" id="answer"
					name="answer" placeholder="정보를 찾기위해 꼭 기억해주세요."></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center"><p class="main"><font color="#E33333">*</font> 전화번호</p></td>
				<td colspan="3"><input type="tel" name="tel" value="${dto.tel }"></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>

			<tr>
				<td align="center"><p class="main"><font color="#E33333">*</font> 이메일</p></td>
				<td colspan="3"><input class="text" type="text" name="email" ${dto.email }>
					<select name="domain">
						<option>E-Mail 선택</option>
						<option value="naver.com" id="naver.com">naver.com</option>
						<option value="hanmail.net" id="hanmail.net">hanmail.net</option>
						<option value="gmail.com" id="gmail.com">gmail.com</option>
						<option value="nate.com" id="nate.com">nate.com</option>
						<option value="직접입력하기" id="textEmail">직접입력하기</option>
				</select>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center"><p class="main"><font color="#E33333">*</font> 좋아하는 장르</p></td>
				<td colspan="3">
					<p class="side">
						<input type="checkbox" name="fav_movie" value="로맨스">로맨스
						<input type="checkbox" name="fav_movie" value="액션">액션
						<input type="checkbox" name="fav_movie" value="드라마">드라마
						<input type="checkbox" name="fav_movie" value="애니메이션">애니메이션
						<input type="checkbox" name="fav_movie" value="공포">공포
					    <input type="checkbox" name="fav_movie" value="코미디">코미디
				    </p>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" class="button" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>