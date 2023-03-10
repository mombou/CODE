<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Link</title>
<link rel="stylesheet" href="css/style.css">
<script src="script/jquery-1.12.3.js"></script>
<script src="script/script.js"></script>
<script>
    $(document).ready(function(){
        $(".main>li").mouseover(function(){
            $(this).children(".sub").stop().slideDown(200);
        });
        $(".main>li").mouseleave(function(){
            $(this).children(".sub").stop().slideUp(200);
        });
    });</script>
<style>
/* .link {
	font-size: 12px;
	color: #5D5D5D;
}
.link:hover {
	font-size: 12px;
	color: #E33333;
	font-weight: bold;
}
 */
body {
	font: 17px 'Nanum Gothic', sans-serif;
}
a {
	text-decoration: none;
	color: #404040;
}
li {
	list-style: none;
}
#nav {
	width: 70%;
}
#nav:after {
	content: "";
	display: block;
	clear: both;
}
.main {
	margin: 10px;
}
.main>li {
	position: relative;
	float: left;
	width: 200px;
	height: 30px;
	box-sizing: border-box;
	line-height: 30px;
	text-align: center;
	background: #ffffff;
}
.main>li:hover .sub {
	/*display: block;*/
	
}
.main>li a {
	display: block;
	transition: all 0.3s;
}
.main>li a:hover {
	background: #E33333;
	color: #fff;
}
.sub {
	margin: 0;
	padding: 0;
	display : none;
	position: absolute;
	top: 30px;
	left: 0;
	z-index: 1;
	width: 100%;
	background: #eee;
	display: none
}
</style>
</head>
<body>
	<!-- 	<table width="70%" align="center">
		<tr> -->
	<nav align="right">
		<div id="nav">
			<ul class="main">
				<li><a href="#">공지사항</a>
					<ul class="sub">
						<li><a href="#">공지</a></li>
						<li><a href="#">이벤트</a></li>
						<li><a href="#">기사</a></li>
					</ul></li>
				<li><a href="#">영화정보</a>
					<ul class="sub">
						<li><a href="#">로맨스</a></li>
						<li><a href="#">스릴러</a></li>
						<li><a href="#">가족</a></li>
						<li><a href="#">애니메이션</a></li>
						<li><a href="#">액션</a></li>
					</ul></li>
				<li><a href="#">명예의 전당</a>
					<ul class="sub">
						<li><a href="#">최고의 리뷰</a></li>
						<li><a href="#">최고의 영화</a></li>
					</ul></li>
				<li><a href="#">자유게시판</a>
					<ul class="sub">
						<li><a href="#">영화수다</a></li>
						<li><a href="#">표 양도</a></li>
						<li><a href="#">영화관 리뷰</a></li>
					</ul></li>
				<li>
					<ul>
						<input type="text" name="searchWord" />
						<img src="https://i.imgur.com/8T9PZ8Y.png" width="2%">
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	</table>
	<!-- <td width="10%"><a href="/" style = "text-decoration : none;"><p class="link">공지사항</p></a></td>
		<td width="10%"><a href="/" style = "text-decoration : none;"><p class="link">영화정보</p></a></td>
		<td width="10%"><a href="/" style = "text-decoration : none;"><p class="link">명예의 전당</p></a></td>
		<td width="10%"><a href="/" style = "text-decoration : none;"><p class="link">자유게시판</p></a></td>
		<td width="10%"><a href="/" style = "text-decoration : none;"><p class="link">터벅터벅</p></a></td> -->
	<!-- 			<td width="25%"></td>
			<td width="25%" align="right"><input type="text"
				name="searchWord" /><a href="/"><img
					src="https://i.imgur.com/8T9PZ8Y.png" width="10%"></a></td> </tr>	</table> -->



	<hr color=#E33333>