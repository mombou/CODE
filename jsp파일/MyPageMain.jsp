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

/* 녹색 텍스트 */
.green{
  color: #24855b;
}

.wrap{
  background-color: #F8F8F8;  
}
/* 녹색배경 */
.greenContainer{  
  height: 132px;
  background-color: #24855b;    
  
  display: flex;
  align-items: flex-end;
  padding: 16px;
}

.greenContainer .name{
   font-size: 20px;
  font-weight: bold;
  color: #ffffff;
} 
.greenContainer .modify{
  margin-left: auto;
}

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer{
  background-color: white;  
  display: flex;  
  padding: 21px 16px;  
  height: 90px;
  margin-bottom: 10px;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item{
  flex-grow: 1
}
/* 녹색 숫자 */
.summaryContainer .number{
  font-size: 19px;
  font-weight: bold;
  color: #24855b;
}
/* 텍스트 */
.summaryContainer .item > div:nth-child(2){
  font-size: 13px;
}

/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
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
.listContainer .right{
  margin-left: auto;
}

.listContainer .text{width: 150px;}
</style>
</head>
<body>

<jsp:include page="Index.jsp"/>
<div class="wrap">
	  <div class="greenContainer">
	    <div>
	    <a href="MainPage.jsp">
	      <img src="/image/logo.png" alt="MyImage" width="100px;" height="50px;">
	     </a>
	      <div class="grade">(등급)</div>
	      <div class="name">${UserId }</div>
	    </div>    
	  </div>
	  
	  <div class="summaryContainer">
	    <div class="item">
	        <div class="number">??개</div>
	        <div>위시리스트</div>
	      </div>
	      <div class="item">
	        <div class="number">??개</div>
	        <div>내가 쓴 리뷰</div>
	      </div>
	      <div class="item">
	        <div class="number">??</div>
	        <div>평균 평점</div>
	      </div>
	  </div>
	    
	  <div class="listContainer">
	  		<div class="text">
		    <a href="/mvcmember/mypage.do?mode=profile" class="item">회원정보</a>
		    </div>
		    <div class="text">
		    <a href="/mvcmember/mypage.do?mode=wishlist" class="item">즐겨찾기</a>
		    </div>
		    <div class="text">
		    <a href="/mvcmember/mypage.do?mode=mylist" class="item">내가 쓴 리뷰</a>
		    </div>
		  	<div class="text">
		    <a href="#" class="item">고객센터</a>
		    </div>
	  </div>
	  
</div>
</body>
</html>