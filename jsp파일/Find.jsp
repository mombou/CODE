<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>

<script>
	function passCheck(form){
		const sel = document.querySelector("#sel")
		
		const askOpt = document.querySelector("#optVal")
		
		const optVal = sel.options[sel.selectedIndex]
		
		if(form.id.value.length === 0){
			alert("아이디를 입력하세요")
			return false	
		}
		if(sel.selectedIndex === 0){
			alert("질문을 선택하세요")
			return false
		}
		if(form.answer.value.length === 0){
			alert("답변을 입력하세요")
			return false
		}
		console.log(optVal)
		console.log(askOpt)
		
		askOpt.value = optVal.value
	}
	
	function validateForm(form){
		if(form.newPass.value === "" || form.rePass.value === ""){
			alert("비밀빈호를 입력하세요")
			return false
		}
		if(form.newPass.value != form.rePass.value){
			alert("비밀번호가 일치하지 않습니다")
			return false
		}
	}
</script>

</head>
<body>

<jsp:include page="Index.jsp"/>

<div id="wrap" width="50%" align="center">
	<h2>비밀번호 찾기</h2>
	<c:choose>
		<c:when test="${isChk == null || isChk != 'true' }">
			<form action="/member/find.do" name="findFrm" method="post" 
				onsubmit="return passCheck(this)">
				<input type="hidden" id="optVal" name="optVal">
				<table>
				<tr>
					<td><input type="text" name="id" placeholder="아이디"></td>
				</tr>
				<tr>
					<td>
					<select name="sel" id="sel">
						<option>질문을 선택해주세요.</option>
							<option value="제일 좋아하는 장소는?">제일 좋아하는 장소는?</option>
							<option value="소중하게 여기는 보물은?">소중하게 여기는 보물은?</option>
							<option value="제일 좋아하는 인물은?">제일 좋아하는 인물은?</option>
							<option value="제일 좋아하는 음식은?">제일 좋아하는 음식은?</option>
					</select>
					</td>
				</tr>
				<tr>
				<td><input type="text" name="answer" placeholder="답변"></td>
				</tr>
				</table>
				<input type="submit" value="확인" >
			</form>
		</c:when>
		<c:otherwise>
			<form action="/member/update.do" method="post" onsubmit="return validateForm(this)">
				<input type="hidden" name="id" value="${id }">
				<table>
				<tr>
					<td><input type="password" name="newPass" placeholder="새로운 비밀번호"></td>
				</tr>
				<tr>
					<td><input type="password" name="rePass" placeholder="비밀번호 확인"></td>
				</tr>
				</table>
				<input type="submit" value="확인">
			</form>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>