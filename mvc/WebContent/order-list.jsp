<%@page import="com.app.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
	<button onclick="location.href='/mvc/list.product'">주문하러 가기</button>
	<button type="button" onclick="cancel()">주문 취소</button>
	<form action="/mvc/cancel.order" method="post" id="cancel-form">
	</form>
	<table border="1">
		<tr>
			<th>선택</th>
			<th>주문 번호</th>
			<th>회원 이름</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>주문수량</th>
			<th>주문가격</th>
		</tr>
		<c:forEach var="order" items="${orderList}">
			<input type="hidden" id="${order.id}" value="${order.productId}">
			<tr>
				<td><input type="checkbox" class="orderId" data-id="${order.id}"></td>
				<td><c:out value="${order.id}"/></td>
				<td><c:out value="${order.memberName}"/></td>
				<td><c:out value="${order.productName}"/></td>
				<td><c:out value="${order.productPrice}"/></td>
				<td><c:out value="${order.productCount}"/></td>
				<td><c:out value="${order.totalPrice}"/></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	function cancel(){
		const $form = $("#cancel-form");
//		jQuery객체의 filter는 첫 번째로 인덱스를 받고, 두 번째로 요소를 받는다.
		const $checkboxes = $(".orderId").filter((i, checkbox) => checkbox.checked);
		let text = ``;
		$checkboxes.each((i, checkbox) => {
			text += `<input type="hidden" name="orderId" value="` + $(checkbox).data("id") + `">`;
			text += `<input type="hidden" name="productId" value="` + $("#" + $(checkbox).data("id")).val() + `">`;
		});
		
		$form.html(text);
		$form.submit();
	}
</script>
</html>












