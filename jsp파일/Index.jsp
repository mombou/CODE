<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Index</title>
    <style>
      .cate { font-size: 12px; color: #5D5D5D;}
      .cate:hover {
		font-size: 12px; color: #E33333; font-weight : bold;
      }
    </style>
</head>
<body>
<table width="70%" align="center">
	<tr>
		<td rowspan="2" width = "200px">
		<a href="Index.jsp"><img src="https://i.imgur.com/YgYNegO.png" width="70%"></a>
		</td> <!-- 로고 -->
		<td width = "40%"></td> <!-- 여백 및 광고 -->
		<td align="center"><a href = "/member/islogin.do?mode=login"><img src="https://i.imgur.com/8T9PZ8Y.png" width="40%"></a></td> <!-- 로그인 -->
		<td align="center"><a href = "/member/islogin.do?mode=join"><img src="https://i.imgur.com/V0inwD8.png" width="40%"></a></td> <!-- 회원가입 -->
		<td align="center"><a href = "/member/islogin.do?mode=mylist" ><img src="https://i.imgur.com/o4LsxxD.png" width="40%"></a></td> <!-- 마이페이지 -->
		<td align="center"><a href = "/member/islogin.do?mode=wishlist" ><img src="https://i.imgur.com/8T9PZ8Y.png" width="40%"></a></td> <!-- 즐겨찾기 -->
		<td align="center"><a href = "#"><img src="https://i.imgur.com/mQH3bKX.png" width="40%"></a></td> <!-- 고객센터 -->
	</tr>
	<tr>
	<td></td>
		<td align="center"><a href="/member/islogin.do?mode=login" style = "text-decoration : none;"><p class="cate">로그인 </p></a></td>
		<td align="center"><a href="/member/islogin.do?mode=join" style = "text-decoration : none;"><p class="cate" >회원가입</p></a></td>
		<td align="center"><a href="/member/islogin.do?mode=mylist" style = "text-decoration : none;"><p class="cate">마이페이지</p></a></td>
		<td align="center"><a href="/member/islogin.do?mode=wishlist" style = "text-decoration : none;"><p class="cate">즐겨찾기</p></a></td>
		<td align="center"><a href="#" style = "text-decoration : none;"><p class="cate">고객센터</p></a></td>
	</tr>
</table>
 </body>
</html>

