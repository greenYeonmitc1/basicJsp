<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
// jsonString 데이터 
let jsonData = '{"id":"test6","passwd":"1234","name":"테스트6","address":"방배","tel":"010-111-6666"}';
// javascript object 타입 
let obj = {id:"test7",passwd:"1234", name:"테스트7", address:"사당", tel:"010-111-1234"};
let memberJson = JSON.stringify(obj); // obj 객체 를 JSON 문자열 형태로 변환하는 방법 
console.log(memberJson);
$(function(){
	$("#sendJson").click(function(){
		$.ajax({
			url:"getJson.do",
			type : "POST",
			data : {member : memberJson}, // java는 자바스크립트의 오브젝트 타입 해석 불가 ->  JSON.stringify(obj) 필요하다 
			success:function(data){
			    alert(data);
				if(data == 1){
					let msg ="<p>전송 완료 했습니다 " + obj.name +" 회원  추가 완료</p><br>";
					$("#output").html(msg);
	
				}
			}
		
		})
	});
});
</script>
</head>
<body>

           <button id="sendJson"> 전송</button> <br>
           <div id="output"></div>
            <div id="result"></div>
</body>
</html>