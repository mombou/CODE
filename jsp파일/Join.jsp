<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#id_used, #id_notUsed, #nick_used, #nick_notUsed {
	display: none;
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
// 폼 내용 검증
	function validateForm(form) {
		if (form.user_id.value == "") {
			alert("아이디를 입력하세요.");
			user_id.focus();
			return false;
		}
		if (user_id.value.length < 3 || user_id.value.length > 20) {
			alert("아이디 글자수가 맞지 않습니다.");
			user_id.value = ""
			user_id.focus();
			return false;
		}
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
		if (form.name.value == "") {
			alert("이름을 입력하세요.");
			form.name.focus();
			return false;
		}
		if (form.answer.value == "") {
			alert("답변을 입력하세요.");
			form.answer.focus();
			return false;
		}
		
		//select에서 선택 안했을 때
		if(form.birth.selectedIndex === 0 || form.month.selectedIndex === 0 
				|| form.day.selectedIndex === 0){
			alert("생년월일을 선택하세요")
			return false
		}
		if(form.ask.selectedIndex === 0){
			alert("질문을 선택하세요")
			return false
		}
		if(form.domain.selectedIndex === 0){
			alert("도메인을 선택하세요")
			return false
		}
	};
	
	//1) 아이디, 닉네임 중복 체크 => ajax
	//2) 중복된 아이디이거나 중복 체크 안했을 때 가입하기 버튼 disabled = false 처리
	//아이디 중복 체크
	function idCheck(){
		const id = document.querySelector("#user_id");
		
		if (id.value == "") {
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		if (id.value.length < 3 || id.value.length > 20) {
			alert("아이디 글자수가 맞지 않습니다.");
			id.value = ""
			id.focus();
			return false;
		}
		
		const param = "?id="+id.value + "&mode=idCheck";
		
		const req = new XMLHttpRequest()
		
		req.open("GET", "/mvcMember/check.do" + param);
		req.send()
		req.onreadystatechange = function(){
			if(req.status === 200 && req.readyState === 4){
				if(req.responseText === "1"){
					//alert("중복된 아이디입니다")
					id.value = ""
					document.querySelector("#id_used").style.display = "block";
					document.querySelector("#id_notUsed").style.display = "none";
					document.querySelector("#submitBtn").disabled = true
				}
				else if(req.responseText === "0"){
					//alert("사용 가능한 아이디입니다")
					document.querySelector("#id_used").style.display = "none";
					document.querySelector("#id_notUsed").style.display = "block";
					//document.querySelector("#submitBtn").disabled = false
				}
			}
		}
	}
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

	<form name="writeFrm" method="post" action="/mvcMember/join.do"
		onsubmit="return validateForm(this);">
		<table width="50%" align="center">
			<tr>
				<td colspan="4" align="center" bgcolor="#e9e9e9"><h3>회원가입</h3>
					<p class="side">가입을 통해 더 다양한 서비스를 만나보세요!</p></td>
			</tr>
			<tr>
				<td colspan="4" align="left">
					<p class="main">
						<font color="#E33333">*</font> 표시는 필수값입니다.
					<hr>
					</p>
				</td>
			</tr>
			<tr>
				<td width="20%" rowspan="2" align="center">
					<p class="main">
						<font color="#E33333">*</font> 아이디
					</p>
				</td>
				<td width="40%"><input class="text" type="text" id="user_id"
					name="user_id" placeholder="아이디 중복체크를 눌러주세요."> <input
					class="button" type="button" id="idChkBtn" value="중복체크"
					onclick="idCheck()">
					<hr></td>

				<td width="40%" colspan="2"></td>
			</tr>
			<tr>
				<td colspan="4"><p class="side">회원 ID는 3~20자 사이의 영문+숫자로
						이루어져야 하며 영문으로 시작해야 합니다.</p></td>
			</tr>

			<!-- 아이디 중복체크용 -->
			<tr id="id_used">
				<td colspan="4">중복된 아이디 입니다.</td>
			</tr>
			<tr id="id_notUsed">
				<td colspan="4">사용가능한 아이디 입니다.</td>
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
				<td><input class="text" type="text" id="nick_id" name="nick_id">
					<input class="button" type="button" id="nickChkBtn" value="중복체크" onclick="nickCheck()">
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
						<font color="#E33333">*</font> 이름
					</p>
				</td>
				<td colspan="3"><input class="text" type="text" id="name"
					name="name"></td>
			</tr>

			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<!-- 생년월일 -->
			<!-- 이거 반복문으로 할 수 있겠죠? 지혜를 부탁합니다.. -->
			<tr>
				<td align="center">
					<p class="main">
						<font color="#E33333">*</font> 생년월일
					</p>
				</td>
				<td colspan="3">
				<select name="birth" >
						<option>=== 년도 ===</option>
						<option value="2023">2023</option>
						<option value="2022">2022</option>
						<option value="2021">2021</option>
						<option value="2020">2020</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
				</select> 
				<select name="month" >
						<option>=== 월 ===</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
				</select> 
				<select name="day" >
						<option>=== 일 ===</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
				</select>
			</tr>

			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<!-- 질문 -->
			<tr>
				<td align="center"><p class="main">
						<font color="#E33333">*</font> 질문
					</p></td>
				<td colspan="3"><select class="select" id="ask" name="ask">
						<option>질문을 선택해주세요.</option>
						<option id="ask" value="제일 좋아하는 장소는?">제일 좋아하는 장소는?</option>
						<option id="ask" value="소중하게 여기는 보물은?">소중하게 여기는 보물은?</option>
						<option id="ask" value="제일 좋아하는 인물은?">제일 좋아하는 인물은?</option>
						<option id="ask" value="제일 좋아하는 음식은?">제일 좋아하는 음식은?</option>
				</select></td>
			<tr>
				<td align="center">
					<p class="main">
						<font color="#E33333">*</font> 답변
					</p>
				</td>
				<td colspan="3"><input class="text" type="text" id="answer"
					name="answer" placeholder="정보를 찾기위해 꼭 기억해주세요."></td>
			</tr>

			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<!-- 전화번호 -->
			<tr>
				<td align="center"><p class="main">전화번호</p></td>
				<td colspan="3"><input type="tel" name="tel"></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>

			<tr>
				<td align="center"><p class="main">이메일</p></td>
				<td colspan="3"><input class="text" type="text" name="email">
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

			<!-- 좋아하는 장르 -->
			<tr>
				<td align="center"><p class="main">좋아하는 장르</p></td>
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
			<!-- 클래스 -->
			<tr>
				<td align="center"><p class="main">클래스</p></td>
				<td colspan="3"><input class="text" type="text" id="user_class"
					name="user_class"></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<button type="submit" id="submitBtn" class="button">가입하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>