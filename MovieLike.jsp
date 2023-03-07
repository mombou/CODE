<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      width: 1000px;
    }
    table tr td{
      border: 1px solid black;
      width: 800px;
    }
    .img {
      width: 150px;
    }
    #top {
      overflow: hidden;
    }
    #top div {
      float: left;
    }
    #content {
      width: 800px;
    }
    #content div {
      width: 300px; height: 150px; border: 1px solid red; float: left;
    }
    #menu {
      width: 800px;
      height: 50px;
      overflow: hidden;   
    }
    #menu > ul > li {
      float: right;
      width: 10%;
      height: 100%;
      line-height: 50px;
      text-align: center;
      list-style-type: none;
    }
  </style>
  <title>Document</title>
</head>
<body>
  <div id="top">
    <div><a href="#"><img src="https://i.imgur.com/YgYNegO.png" alt="" width="200px"></a></div>
    <div>즐겨찾기 목록</div>
    <div id="menu">
      <ul>
        <li>메뉴01</li>
        <li>메뉴02</li>
        <li>메뉴03</li>
        <li>메뉴04</li>
        <li>메뉴05</li>
      </ul>
    </div>
  </div>
  <hr>
  <table>
    <tr>
      <td rowspan="2" class="img"><a href="#"><img src="http://placehold.it/150x150" /></a></td>
      <td>제목</td>
    </tr>
    <tr>
      <td>상세내용</td>
    </tr>
    <tr>
      <td rowspan="2" class="img"><a href="#"><img src="http://placehold.it/150x150" /></a></td>
      <td>제목</td>
    </tr>
    <tr>
      <td>상세내용</td>
    </tr>
    <tr>
      <td rowspan="2" class="img"><a href="#"><img src="http://placehold.it/150x150" /></a></td>
      <td>제목</td>
    </tr>
    <tr>
      <td>상세내용</td>
    </tr>
    <tr>
      <td rowspan="2" class="img"><a href="#"><img src="http://placehold.it/150x150" /></a></td>
      <td>제목</td>
    </tr>
    <tr>
      <td>상세내용</td>
    </tr>
    <tr>
      <td rowspan="2" class="img"><a href="#"><img src="http://placehold.it/150x150" /></a></td>
      <td>제목</td>
    </tr>
    <tr>
      <td>상세내용</td>
    </tr>
  </table>
  
</body>
</html>
