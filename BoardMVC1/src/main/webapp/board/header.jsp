<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판MVC1</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body>
  <header>
          <div class="row">  <!--py-3(y축으로) 높이 column row )-->
            <div class="col-4 py-3" onclick="location.href='_01_boardList.jsp'"> 전체게시글 확인하기 </div>
            <div class="col-2 py-3" onclick="location.href='_02_addDummyPro.jsp'"> 게시글10개추가 </div>
            <div class="col-2 py-3"  onclick="location.href='_03_deleteAllBoard.jsp'"> 전체게시글 삭제 </div>
            <div class="col-2 py-3" onclick="location.href='_04_addBoard.jsp'"> 게시글 추가하기 </div>
            <div class="col-2 py-3" onclick="location.href='_07_boardListPaging.jsp'"> 페이징 게시판 </div>
        </div>
</header>