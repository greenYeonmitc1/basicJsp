<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "header.jsp" %>
<div align="center">

		<form action="carMain.jsp?center=11_carOptionSelect.jsp"
			method="post">

			<table>
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray">
							${vo.name} 차량 선택
					</font></td>
				</tr>
				<tr>
					<td rowspan="6" width="500" align="center"><img alt=""
						src="img/${vo.img}" width="450"></td>
					<td width="250" align="center">차량이름</td>
					<td width="250" align="center">${vo.name}</td>
				</tr>
				<tr>
					<td width="250" align="center">차량수량</td>
					<td width="250" align="center"><select name="qty">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">차량분류</td>
					<td width="250" align="center">${kind}</td>
				</tr>
				<tr>
					<td width="250" align="center">대여가격</td>
					<td width="250" align="center">${vo.price}원</td>
				</tr>
				<tr>
					<td width="250" align="center">제조회사</td>
					<td width="250" align="center">${vo.company}</td>
				</tr>
				<tr>
					<td width="250" align="center">
						<%-- 이전 차량에 관한 정보 --%> <input type="hidden" name="no"
						value="${vo.no}" /> <input type="hidden" name="img"
						value="${vo.img}" /> <input type="submit"
						value="옵션선택후 구매하기" />
					</td>
				</tr>
			</table>

			<br />
			<br />
			<br /> <font size="5" color="gray">차랑 정보 보기</font>
			<p>
				${vo.info}
		</form>



	</div>
<%@ include file= "footer.jsp" %>