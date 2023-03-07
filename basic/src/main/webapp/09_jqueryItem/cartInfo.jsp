<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%-- https://coding-factory.tistory.com/192 --%>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
	<style>
		table.basket {
			border-collapse: collapse;
			text-align: center;
			border-top: 2px solid #888;
			border-bottom: 2px solid #888;
		}
		table.basket th {
			background: #efefef;
			border-top: 1px solid #888;
			padding: 15px 5px;
		}
		table.basket td {
			border-top: 1px solid #888;
			padding: 10px;
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
	        value = value.replace(/[^\d]+/g, ''); // 3,000 -> 3000
	        return value;
	    }
	
		function itemTotal() {
			var list = document.querySelectorAll("input[name=chk]");
			var totalList = document.querySelectorAll(".result-price");
			
			var total = 0;
			for(var i=0; i<list.length; i++) {
				if(list[i].checked) {
					total += Number(removeComma(totalList[i].textContent));		
				}
			}
			$("#total").html(total);
		}
		
		function addEvent() {
			// document.getElementById("아이디명");
			var list = document.querySelectorAll("input[name=delete]");
			for(var i=0; i<list.length; i++) {
				list[i].addEventListener("click", cartDelete);
			}
			
			list = document.querySelectorAll("input[name=chk]");
			for(var i=0; i<list.length; i++) {
				list[i].addEventListener("click", checkBox);
			}
			
			list = document.querySelectorAll(".btn-up");
			for(var i=0; i<list.length; i++) {
				list[i].addEventListener("click", btnUp);
			}
			
			list = document.querySelectorAll(".btn-down");
			for(var i=0; i<list.length; i++) {
				list[i].addEventListener("click", btnDown);
			}
			
			var allCheck = document.querySelector("input[name=check-all]");
			if(allCheck != null) {
				allCheck.addEventListener("click",checkAll);
			}
		}
		
		function btnDown() {
			var index = $(".btn-down").index(this);
			var buyCount = $(".buy-count").eq(index).val();
			if(buyCount > 1) {
				buyCount = Number(buyCount) - 1;
				$(".buy-count").eq(index).val(buyCount);
			}
			
			var cost = $(".cost").eq(index).html();				// 원가
			cost = removeComma(cost);
			cost = Number(cost);
			
			var price = buyCount * cost;						// 총금액
			price = price+"";
			price = addComma(price);	
			$(".result-price").eq(index).html(price);
			
			itemTotal();
		}
		
		function btnUp() {
			var index = $(".btn-up").index(this);
			var buyCount = $(".buy-count").eq(index).val();
			buyCount = Number(buyCount) + 1;					// 수량
			$(".buy-count").eq(index).val(buyCount);
			
			var cost = $(".cost").eq(index).html();				// 원가
			cost = removeComma(cost);
			cost = Number(cost);
			
			var price = buyCount * cost;						// 총금액
			price = price+"";
			price = addComma(price);	
			$(".result-price").eq(index).html(price);
			
			itemTotal();
		}
		
		function checkBox() {
			var total = $("input[name=chk]").length; // 전체 체크박스 태그 객체
			var checked = $("input[name=chk]:checked").length; // 체크가 된 체크박스 객체
			
			if(total != checked) {
				 // jqery.prop(속성 , 값) // 이미 있는 속성을 의미 
				$("input[name=check-all]").prop("checked", false);
			} else {
				$("input[name=check-all]").prop("checked", true);
			}
		    itemTotal();
		}
		
		function checkAll() {
			var list = document.querySelectorAll("input[name=chk]");
		    for (var i = 0; i < list.length; i++) {
		        list[i].checked = this.checked;
		    }
		    itemTotal();
		}
		
		function cartDelete() {
			var query = {
				cartDeleteNumber : this.value
			};
			
			$.ajax({
				type: "post",
				url: "cartDeletePro.jsp",
				data: query,
				success: function(data) {
					var str = '<p id="data">';
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					if(check === "0") {
						$(".basket").remove();
						$("#result").remove();
						$("#zero_msg").append("<h3>장바구니에 담여있는 상품이 없습니다.</h3>");
					} else {
						$(".basket").remove();
						
						data = data.substr(loc + len , data.length - 1);
						var list = data.split("/");
					
						// 1,1.jpg,대파입니다,1000,2
						// image, name, price, count, price, number
						var result = '<table class="basket">';
						result += '<tr>';
						result += '<th width="50px">';
						result += '<input type="checkbox" name="check-all">';
						result += '</th>';
						result += '<th width="100px">이미지</th>';
						result += '<th width="200px">상품명</th>';
						result += '<th width="150px">가격</th>';
						result += '<th width="100px">수량</th>';
						result += '<th width="150px">합계</th>';
						result += '<th width="50px">삭제</th>';
						result += '</tr>';
						
						result += "<tr>";
						for(var i=0; i<list.length; i++) {
							var item = list[i].split(",");
							result += '<td><input type="checkbox" name="chk"></td>';
							result += '<td><img src="img/' + item[1] + '" width="50px"></td>';
							result += '<td align="left">' + item[2] + '</td>';
							result += '<td><span class="cost">' + item[3] + '</span>원</td>';
							result += '<td>';
							result += '<div class="option" align="center">';
							result += '<button class="btn-down"><span style="color: lightgray"><i class="fas fa-minus"></i></span></button>';
							result += '<input type="text" class="buy-count" readonly="readonly" value="' + item[4] + '">';
							result += '<button class="btn-up"><span style="color: lightgray"><i class="fas fa-plus"></i></span></button>';
							result += '</div>';
							var total = Number(item[3]) * Number(item[4]);
							result += '<td><span class="result-price">' + total + '</span>원</td>';
							result += '<td>';
							result += '<input type="image" src="img/delete.png" name="delete" value="' + item[0] + '">';
							result += '</td>';
							result += '</tr>';
						}
						
						$("#cart_item_table").append(result);
						
						init();
					}
				}
			});
		}
		
		function init() {
			addEvent();
			itemTotal();
		}
	</script>
	
</head>
<body onload="init()">
	<%
		int index = 0;
		int buyCount = 0;
		int price = 0;
		
		String str = request.getParameter("index");
		if(str != null) {
			index = Integer.parseInt(str);
		}
		
		str = request.getParameter("buyCount");
		if(str != null) {
			buyCount = Integer.parseInt(str);
		}
	
		str = request.getParameter("resultPrice");
		if(str != null) {
			price = Integer.parseInt(str);
		}
		
		int[] numberList = (int[])session.getAttribute("numberList");
		String[] imageList = (String[])session.getAttribute("imageList");
		String[] nameList = (String[])session.getAttribute("nameList");
		int[] priceList = (int[])session.getAttribute("priceList");
		int[] countList = (int[])session.getAttribute("countList");
		int count = (int)session.getAttribute("count");
		
		numberList[count] = 6;
		imageList[count] = imageList[index];
		nameList[count] = nameList[index];
		priceList[count] = buyCount * priceList[index];
		countList[count] = buyCount;
		count += 1;
		
		session.setAttribute("count", count);
	%>
	<div align="center" id="cart_item_table">
		<table class="basket">
			<tr>
				<th width="50px">
					<input type="checkbox" name="check-all">
				</th>
				<th width="100px">이미지</th>
				<th width="200px">상품명</th>
				<th width="150px">가격</th>
				<th width="100px">수량</th>
				<th width="150px">합계</th>
				<th width="50px">삭제</th>
			</tr>
		<%	
			for(int i=0; i<count; i++) {
				DecimalFormat df = new DecimalFormat("###,###");
				String strPrice = df.format(priceList[i]);
		%>
			<tr>
				<td><input type="checkbox" name="chk"></td>
				<td><img src="img/<%= imageList[i] %>" width="50px"></td>
				<td align="left"><%= nameList[i] %></td>
				<td><span class="cost"><%= strPrice %></span>원</td>
				<td>
					<div class="option" align="center">
						<button class="btn-down"><span style="color: lightgray"><i class="fas fa-minus"></i></span></button>
						<input type="text" class="buy-count" readonly="readonly" value="<%= countList[i] %>">
						<button class="btn-up"><span style="color: lightgray"><i class="fas fa-plus"></i></span></button>
					</div>
				</td>
				<td><span class="result-price"><%= priceList[i] %></span>원</td>
				<td>
					<input type="image" src="img/delete.png" name="delete" value="<%= numberList[i] %>">
				</td>
			</tr>
		<%	} %>
		</table>
	</div>
	
	<div id="result" align="center">
		<hr width="870px" color="lightgray">
		총 금액 : <span id="total">0</span>원
	</div>
	<div id="zero_msg" align="center"></div>
	
	
</body>
</html>