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
<title>상품 목록</title>
</head>
<body>
	<button onclick="location.href='/mvc/logout.member'">로그아웃</button>
	<button onclick="location.href='/mvc/write.product'">작성하기</button>
	<button onclick="location.href='/mvc/list.order'">내 주문내역 보기</button>
	<table>
		<tr>
			<th>선택</th>
			<th>상품 번호</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>상품재고</th>
		</tr>
		<%-- <c:forEach var="product" items="${products}">
			<tr>
				<td><c:out value="${product.id}"/></td>
				<td><c:out value="${product.productName}"/></td>
				<td><c:out value="${product.productPrice}"/></td>
				<td><c:out value="${product.productStock}"/></td>
			</tr>
		</c:forEach> --%>
	</table>
	<section id="order" style="margin-top: 20px;"></section>
	<form id="order-form" action="write-ok.order" method="post">
		<input type="hidden" name="productId">
		<input type="hidden" name="productCount">
		<button id="order-action" style="display:none;">주문하기</button>
	</form>
	
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>const products = JSON.parse(`${products}`);</script>
<script src="list.js"></script>
<script>
	/* const table = document.querySelector("table");
	const products = JSON.parse(`${products}`);
	console.log(products);
	
	let text = ``;
	products.forEach(product => {
		console.log(product);
		text += `<tr>`;
		text += `<td>` + product.id + `</td>`;
		text += `<td>` + product.productName + `</td>`;
		text += `<td>` + product.productPrice + `</td>`;
		text += `<td>` + product.productStock + `</td>`;
		text += `</tr>`;
	});
	
	table.innerHTML += text; */
</script>
</html>












