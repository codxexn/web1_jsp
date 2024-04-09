<%@page import="java.util.Optional"%>
<%@page import="com.app.vo.ProductVO"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<%
		ProductDAO productDAO = new ProductDAO();
		Optional<ProductVO> foundProduct = productDAO.select(Long.parseLong(request.getParameter("id")));
		if(foundProduct.isPresent()){
			ProductVO product = foundProduct.get();
	%>
			<form action="update" method="post">
				<input type="hidden" name="id" value="<%=product.getId() %>">
				<label>
					<input type="text" name="productName" value="<%=product.getProductName() %>" placeholder="상품명">
				</label>
				<label>
					<input type="text" name="productPrice" value="<%=product.getProductPrice() %>" placeholder="상품가격">
				</label>
				<label>
					<input type="text" name="productStock" value="<%=product.getProductStock() %>" placeholder="상품재고">
				</label>
				<button>완료</button>
			</form>
	<%
		}
	%>
</body>
</html>











