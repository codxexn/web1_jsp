<%@page import="java.util.Optional"%>
<%@page import="com.app.vo.ProductVO"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<body>
	<button onclick="location.href='update.product?id=${product.id}'">수정하기</button>
	<button onclick="location.href='delete-ok.product?id=${product.id}'">삭제하기</button>
	<button onclick="location.href='list.product'">목록으로</button>
	<table>
		<tr>
			<th>상품 번호</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>상품재고</th>
		</tr>
		<tr>
			<td><c:out value="${product.id}"/></td>
			<td><c:out value="${product.productName}"/></td>
			<td><c:out value="${product.productPrice}"/></td>
			<td><c:out value="${product.productStock}"/></td>
		</tr>
	</table>
</body>
</html>











