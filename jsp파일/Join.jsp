<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style>
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
.ast {
	font-size: 13px;
	color: #E33333;
	font-weight: bold;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script>
	function validateForm(form) { // 폼 내용 검증
		
		const sel = document.querySelector("#sel")
		const askOpt = document.querySelector("#optVal")
		const optVal = sel.options[sel.selectedIndex].value 
		
		if (form.pass.value == "") {
			alert("비번을 입력하세요.");
			form.pass.focus();
			return false;
		}
		if (form.tel.value == "") {
			alert("전화번호를 입력하세요.");
			form.tel.focus();
			return false;
		}
		if (form.email.value == "") {
			alert("이메일을 입력하세요.");
			form.email.focus();
			return false;
		}
		if(sel.selectedIndex === 0){
			alert("질문을 선택하세요")
			return false
		}
		if(form.answer.value.length === 0){
			alert("답변을 입력하세요")
			return false
		}
		
	};
	
	function getAJAX() {
		const id = $('#id').val();
		alert(id);
		$.ajax({
			type : "GET", // POST, DELETE, PUT
			url : "/",
			data : {
				id : id
			},
			dataType : "json",
			// callback
			success : function(data) {
				const response = data["status"];
				if (response == "false") {
					alert(response);
					$('#true').hide();
					$('#false').show();
				} else {
					alert(response);
					$('#true').show();
					$('#false').hide();
				}
				;
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			},
		});
	}
	$(function() {
		//$('#true').hide();
		//$('#false').hide();
	});
</script>
</head>
<body>
<%-- 	<jsp:include page="../common/Category.jsp" /> --%>
<%-- 	<jsp:include page="../common/Link.jsp" /> --%>
<jsp:include page="Index.jsp"/>
	<form name="writeFrm" method="post" action="#"
		onsubmit="return validateForm(this);">
		<table width="50%" align="center">

			<tr>
				<td colspan="4" align="center"><h3>회원가입</h3>
					<p class="side">가입을 통해 더 다양한 서비스를 만나보세요!</p>
				
				</td>
			</tr>
			<tr>
			<td colspan="4" align = "left">
			<p class="ast">* 표시는 필수값입니다.</p>
			</td>
			</tr>

			<tr>
				<td width="20%" rowspan="2" align="center">
					<p class="main">* 아이디</p></td>
				<td width="35%"><input type="text" id="id" name="id"> <!-- <input
					type="button" id="idcheckBtn" value="ID중복체크" onclick="getAJAX();"> -->
					<button type="button" class="">중복체크</button>
					<hr></td>

				<td width="45%" colspan="2"></td>
			</tr>
			<tr>
				<td colspan="4"><p class="side">회원 ID는 3~20자 사이의 영문+숫자로
						이루어져야 하며 영문으로 시작해야 합니다.</p></td>
			</tr>
			<!-- 			<tr id="true">
				<td colspan="4">중복된 ID 입니다.</td>
			</tr>
			<tr id="false">
				<td colspan="4">사용가능한 ID 입니다.</td>
			</tr> -->
			<td colspan="3"><hr></td>
			<tr>
				<td rowspan="2" align="center">
					<p class="main">* 닉네임</p></td>
				<td><input type="text" id="id" name="id">
					<button type="button" class="btn btn-danger">중복체크</button>
					<hr></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="4"><p class="side">닉네임은 최대 10글자 사용가능합니다.</p></td>
			</tr>
			<td colspan="3"><hr></td>
			<tr>
				<td rowspan="2" align="center">
					<p class="main">* 비밀번호</p></td>
				<td><input type="text" id="id" name="id">
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
					<p class="main">* 비밀번호 확인</p></td>
				<td><input type="text" id="id" name="id">
					<hr></td>

				<td></td>
			</tr>
			<tr>
				<td colspan="4"><p class="side">비밀번호를 재입력 해주세요.</p></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<td align="center">
				<p class="main">* 이름</p></td>
			<td colspan="3"><input type="text" name="name"></td>
			</tr>

			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center">
					<p class="main">* 생년월일</p></td>
				<td colspan="3"><select name="year" form="year">
						<option value="2023">2023</option>
						<option value="2022">2022</option>
						<option value="2021">2021</option>
						<option value="2020">2020</option>
				</select> <select name="month" form="month">
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
				</select> <select name="day" form="day">
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
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center"><p class="main">* 질문</p></td>
				<td colspan="3">
					<select id="sel">
						<option>질문선택</option>
						<option>보물1호</option>
						<option>초등학교</option>
						<option>지역</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center"><p class="main">* 답변</p></td>
				<td colspan="3"><input type="text" name="tel""></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center"><p class="main">전화번호</p></td>
				<td colspan="3"><input type="text" name="tel""></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center"><p class="main">이메일</p></td>
				<td colspan="3"><input type="text" name="email"> <select><optgroup
							label="이메일을 선택해주세요!">
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="gmail">gmail.com</option>
							<option value="self">직접입력</option>
						</optgroup></select></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td align="center"><p class="main">좋아하는 장르</p></td>
				<td colspan="3"><input type="checkbox" name="likemovie">로맨스
					<input type="checkbox" name="likemovie">액션 <input
					type="checkbox" name="likemovie">드라마 <input type="checkbox"
					name="likemovie">애니메이션 <input type="checkbox"
					name="likemovie">로맨스 <input type="checkbox"
					name="likemovie">코미디</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<button type="submit">가입하기</button>
					<button type="button" >
						목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>