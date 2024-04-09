<%@page import="java.util.Optional"%>
<%@page import="com.app.vo.ProductVO"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<body>
	<%
		ProductDAO productDAO = new ProductDAO();
		Optional<ProductVO> foundProduct = productDAO.select(Long.parseLong(request.getParameter("id")));
		if(foundProduct.isPresent()){
			ProductVO product = foundProduct.get();
	%>
			<button onclick="location.href='update.jsp?id=<%=product.getId() %>'">수정하기</button>
			<button onclick="location.href='delete?id=<%=product.getId() %>'">삭제하기</button>
			<table>
				<tr>
					<th>상품 번호</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>상품재고</th>
				</tr>
				<tr>
					<td><%=product.getId() %></td>
					<td><%=product.getProductName() %></td>
					<td><%=product.getProductPrice() %></td>
					<td><%=product.getProductStock() %></td>
				</tr>
			</table>
	<%
		}
	%>
</body>
</html>











