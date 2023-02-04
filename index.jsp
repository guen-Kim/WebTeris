<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<meta name="viewport" content"width=device-width", initial-scale="1">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테트리스</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
	
	
	
      <nav class="navbar navbar-default">
      <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
               aria-expanded="false">
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./js/main.jsp">테트리스 게임</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
         <li ><a href="./js/main.jsp">메인</a></li>
             <li><a href="./js/bbs.jsp">게시판</a></li>
              <li class="active"><a href="../index.html">테트리스 게임</a></li>
              <li><a href="./js/rankList.jsp">랭킹 리스트</a></li>
              
         </ul>             
      </div>
   </nav>
    <div class="wrapper">
        <div class="game-text">
            <span>게임종료!!!</span>
            <button>다시시작</button>
            <br>
            
            <button id ="button2">점수 등록 및 랭킹 확인하기</button>
        </div><p>
        
        <div class="score" id="score">0</div>
        <div class="playground">
            <ul></ul>
        </div>
        <script src="./js/tetris.js?version=13333022" type="module"></script>
    </div>
    
 
  	
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>