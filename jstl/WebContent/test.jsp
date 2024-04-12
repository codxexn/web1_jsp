<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty param.name}">
			<h1>${param.name}</h1>
		</c:when>
		<c:otherwise>
			<h1>익명</h1>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="data" items="${datas}">
		<h2><c:out value="${data}"/></h2>
	</c:forEach>
	
</body>
</html>