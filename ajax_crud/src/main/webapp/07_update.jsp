<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function() {
		$("#update").click(function(){
			let inputs = {id:$("#id").val(), 
					  passwd:$("#passwd").val(),
				      name:$("#name").val(),
				      address:$("#address").val(),
				      tel:$("#tel").val()};
			
			$.ajax({
				type: "post",
				url: "updatePro.do",
				data: inputs,
				success: function(data){

					if(data == 1){
						alert("정보를 수정 완료");
						window.location.href = "main.do";
					}else {
						alert("비밀번호 확인해주세요");
					}										
			   }
		
			});
		});

	});
</script>
<div align="center">
	<h2>회원정보 수정</h2>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="email" id="id" name="id" value="${sessionScope.id}" readonly disabled></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="passwd" name="passwd" placeholder="수정위해서 비번입력 필수"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="${member.name}"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" id="address" name="address"
				value="${member.address}"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="tel" id="tel" name="tel"
				value="${member.tel}"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="update">수정</button>
			</td>
		</tr>
	</table>
</div> 