/**
 * 02_managerlogin.js
 */

/*
 * string.indexOf(value, start)
 * . value : 필수 요소이다. 찾으려는 문자열을 작성한다.
 * . start : 선택 요소이다. 검색을 시작할 인덱스 값이다. 입력하지 않으면 처음부터 검색한다.
 * . 대소문자를 구분한다.
 * . 찾는 문자열이 없는 경우 -1을 반환한다. 
*/
var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

$(document).ready(function(){
	$("#login").click(function(){
		var query = {
			id : $("#id").val(), 
			pw : $("#pw").val()
		};
		$.ajax({
			type : "POST",
			url : contextPath+"/managerLoginPro.do",
			data : query,
			success : function(data){
				var str = '<p id="check">';
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc+len, 1);
				
				if(check == "1"){
					window.location.href=contextPath+"/managerMain.do";	
				}else {
					alert("아이디와 패스워드를 확인해주세요.");
					$("#id").val("");
					$("#pw").val("");
				}
			}
		});
	});
	
	$("#logout").click(function(){
		$.ajax({
		   type : "post",
		   url : contextPath+"/managerLogout.do",
		   success : function(data){
			   window.location.href=contextPath+"/managerMain.do";
		   }
		});
	});
 });










