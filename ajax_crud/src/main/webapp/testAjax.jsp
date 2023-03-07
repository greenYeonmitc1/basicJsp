<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax, json 연습</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	// 문자열 처리 - strBtn을 클릭했을때 반응
	$("#strBtn").on("click", function(){
		$.ajax({
			url : $("#ctx").val()+"/jsonDataTest.do",
			type : "POST",
			data : "choice=string",
			success : function(data){ // data - 서버에서 처리한 결과를 받아줄 변수
				$("#result").html(data); // result.innerHTML="안녕하세요";
			},
			dataType : "json" //응답데이터의 종류가뭔지
			
		});
	});
	
	// 문자열 처리 - strBtn을 클릭했을때 반응
	$("#arrayBtn").on("click", function(){
		$.ajax({
			url :  $("#ctx").val()+"/jsonDataTest.do",
			type : "POST",
			data : "choice=array",
			success : function(data){ // data - 서버에서 처리한 결과를 받아줄 변수
				let htmlCode = "";
			
				$.each(data, function(index, value){
					htmlCode += index + "번째 데이터: " + value + "<br>";
				});
				
				$('#result').html(htmlCode);
				
			},
			dataType : "json" //응답데이터의 종류가뭔지
			
		});
	});
	
	// 객체 데이터 
	$("#objBtn").on("click", function(){
		$.ajax({
			url :  $("#ctx").val()+"/jsonDataTest.do",
			type : "POST",
			data : "choice=object",
			success : function(data){ // data - 서버에서 처리한 결과를 받아줄 변수
				
				// data에 저장되는 형식: {"id": "test1", "passwd" : "1234" ,... }
			alert(data);
				let htmlCode = "회원ID: " + data.id + "<br>";
				htmlCode += "회원이름: " + data.passwd + "<br>";
				htmlCode += "비밀번호: " + data.name + "<br>";
				htmlCode += "등록일: " + data.reg_date + "<br>";
				htmlCode += "회원주소: " + data.address + "<br>";
				htmlCode += "회원번호: " + data.tel + "<br>";
				$('#result').html(htmlCode);
			},
			dataType : "json" //응답데이터의 종류가뭔지
			
		});
	});
	
	
	// 리스트 데이터
	$("#listBtn").on("click", function(){
		$.ajax({
			url : $("#ctx").val()+"/jsonDataTest.do",
			type : "POST",
			data : "choice=list",
			success : function(data){ // data - 서버에서 처리한 결과를 받아줄 변수
				let htmlCode = "";
			    console.log(data);
			
				$.each(data, function(index, member){
				
					htmlCode += (index+1) + "번째 자료 <br>";
					htmlCode += "회원ID: " + member.id + "<br>";
					htmlCode += "회원이름: " + member.passwd + "<br>";
					htmlCode += "비밀번호: " + member.name + "<br>";
					htmlCode += "등록일: " + member.reg_date + "<br>";
					htmlCode += "회원주소: " + member.address + "<br>";
					htmlCode += "회원번호: " + member.tel + "<br>";
					htmlCode += "<hr color = 'blue'>";
		
				})
				
				$('#result').html(htmlCode);				
				
			},
			dataType : "json" //응답데이터의 종류가뭔지
			
		});
	});
	
	
	// Map데이터
	$("#mapBtn").on("click", function(){
		$.ajax({
			url :  $("#ctx").val()+"/jsonDataTest.do",
			type : "POST",
			data : "choice=map",
			success : function(data){
				let htmlCode = "name " + data.name +"<br>";
				htmlCode += "age: " + data.age + "<br>";
				htmlCode += "tel: " + data.tel + "<br>";
				htmlCode += "addr: " + data.addr + "<br>";
				
				$('#result').html(htmlCode);
			},
			dataType : "json" //응답데이터의 종류가뭔지
			
		});
	});
});
</script>
</head>
<body>
<form>
	<input type="hidden" id="ctx" value="${ctx}">
	<input type="button" id="strBtn" value="문자열데이터 가져오기">
	<input type="button" id="arrayBtn" value="배열열데이터 가져오기">
	<input type="button" id="objBtn" value="객체데이터 가져오기">
	<input type="button" id="listBtn" value="리스트데이터 가져오기">
	<input type="button" id="mapBtn" value="Map데이터 가져오기">
</form>
<h3>응답 데이터 출력하기</h3>
<div id="result"></div>
</body>
</html>