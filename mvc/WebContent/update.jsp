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
<title>상품 수정</title>
</head>
<body>
	<form action="update-ok.product" method="post">
		<input type="hidden" name="id" value="${product.id}">
		<label>
			<input type="text" name="productName" value="${product.productName}" placeholder="상품명">
		</label>
		<label>
			<input type="text" name="productPrice" value="${product.productPrice}" placeholder="상품가격">
		</label>
		<label>
			<input type="text" name="productStock" value="${product.productStock}" placeholder="상품재고">
		</label>
		<button>완료</button>
	</form>
</body>
</html>











