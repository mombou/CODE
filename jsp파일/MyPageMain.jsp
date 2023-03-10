<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPageMain</title>
<style>
body{
  padding: 0;
  margin: 0;
}
div{
  box-sizing: border-box;
}
.summaryContainer{
  background-color: #E33333;  
  display: flex;  
  padding: 21px 16px;  
  height: 90px;
  margin-bottom: 10px;
}
.summaryContainer .item{
  flex-grow: 1
}
.summaryContainer .number{
  font-size: 19px;
  font-weight: bold;
  color: white;
}
.summaryContainer .item > div:nth-child(2){
  font-size: 15px;
  font-weight: bold;
}
/* =======listContainer======= */
.listContainer{  
  padding: 0;
  background-color: #ffffff;
  margin-bottom: 10px;
}
.listContainer .item{  
  display: flex;
  align-items: center;
  padding: 16px;
  color: black;
  text-decoration: none;  
  height: 56px;
  box-sizing: border-box;
}
.listContainer .text{
  font-size: 16px;
  position: relative;
}
.listContainer .text{width: 150px;}
</style>
</head>
<body>

<jsp:include page="Index.jsp"/>

<div class="wrap">
	  <div class="summaryContainer">
			<div class="item">
				<div class="number">등급: ${UserClass }</div>
				<div>${UserId }</div>
			</div>
			<div class="item">
				<div class="number">??개</div>
				<div>위시리스트</div>
			</div>
			<div class="item">
				<div class="number">${reviewCnt }개</div>
				<div>내가 쓴 리뷰</div>
			</div>
			<div class="item">
				<div class="number">??</div>
				<div>평균 평점</div>
			</div>
		</div>
	    
	  <div class="listContainer">
	  		<div class="text">
		    <a href="/mvcMember/mypage.do?mode=profile&id=${UserId }" class="item">회원정보</a>
		    </div>
		    <div class="text">
		    <a href="/mvcMember/mypage.do?mode=wishlist" class="item">즐겨찾기</a>
		    </div>
		    <div class="text">
		    <a href="/mvcMember/mypage.do?mode=mylist" class="item">내가 쓴 리뷰</a>
		    </div>
		  	<div class="text">
		    <a href="#" class="item">고객센터</a>
		    </div>
	  </div>
	  
</div>
</body>
</html>