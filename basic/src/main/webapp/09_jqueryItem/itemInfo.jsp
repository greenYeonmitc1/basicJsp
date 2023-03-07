<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
	<style>
		table {
			border-collapse: collapse;
			border: 1px solid ligthgray;
		}
		.option {
			width: 100px;
			height: 30px;
			border: 1px solid #ccc;
			border-radius: 5px;
			float: left;
		}
		.btn-down, .btn-up {
			width: 30px;
			height: 30px;
			margin: 0px 3px;
			background-color: white;
			border: 0;
			float: left;
			cursor: pointer;
		}
		input[type=text] {
			width: 20px;
			height: 20px;
			border: 0;
			float: left;
			text-align: center;
			padding-top: 5px;
		}
	</style>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		// 천단위 콤마
		function addComma(value) {
			value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
			return value;
		}
		
		 // 콤마 풀기
	    function removeComma(value) {
	        value = value.replace(/[^\d]+/g, ''); 
	        return value;
	    }
	
		$(document).ready(function(){
			$(".btn-up").click(function(){
				var buyCount = $(".buy-count").val();
				buyCount = Number(buyCount) + 1;					// 수량
				$(".buy-count").val(buyCount);
				
				var cost = $(".cost").val();				// 원가
				cost = Number(cost);
				
				var price = buyCount * cost;						// 총금액
				price = price+"";
				price = addComma(price);	
				$(".result-price").html(price);
			});
			
			$(".btn-down").click(function(){
				var index = $(".btn-down").index(this);
				var buyCount = $(".buy-count").val();
				if(buyCount > 0) {
					buyCount = Number(buyCount) - 1;
					$(".buy-count").val(buyCount);
				}
				
				var cost = $(".cost").val();				// 원가
				cost = Number(cost);
				
				var price = buyCount * cost;						// 총금액
				price = price+"";
				price = addComma(price);	
				$(".result-price").html(price);
			});
			
			$("#cart").click(function(){
				var buyCount = $(".buy-count").val();
				var resultPrice = $(".result-price").html();
				resultPrice = removeComma(resultPrice);
				var index = $(".index").val();
				
				location.href="cartInfo.jsp?index="+index+"&buyCount="+buyCount+"&resultPrice="+resultPrice;
			});
		});	
	</script>
</head>
<body>
	<%
		String[] imageList = {"1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"};
		String[] nameList = {"대파입니다", "상추입니다", "당근입니다", "깻잎입니다", "애호박입니다"};
		int[] priceList = {1000, 1200, 700, 4200, 9400};
		int[] countList = {2, 1, 1, 4, 3};	
	
		String str = request.getParameter("index");
		int index = 0;
		if(str != null) {
			index = Integer.parseInt(str);
		}
		
		DecimalFormat df = new DecimalFormat("###,###");
		String strPrice = df.format(priceList[index]);
	%>
	<div align="center">
		<h2>상품 상세 페이지</h2>
		<table border="1">
			<tr>
				<td colspan="2">
					<img src="img/<%= imageList[index] %>" width="200px">
				</td>
			</tr>
			<tr>
				<td>
					<div class="option">
						<button class="btn-down"><span style="color: lightgray"><i class="fas fa-minus"></i></span></button>
						<input type="hidden" class="cost" value="<%= priceList[index] %>">
						<input type="text" class="buy-count" readonly="readonly" value="1">
						<button class="btn-up"><span style="color: lightgray"><i class="fas fa-plus"></i></span></button>
					</div>
				</td>
				<td>
					<span class="result-price"><%= strPrice %></span>원
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" class="index" value="<%= index %>">
					<input type="image" src="img/sendcart.PNG" style="width:200px" id="cart">
				</td>
			</tr>
		</table>
	</div>	
</body>
</html>















