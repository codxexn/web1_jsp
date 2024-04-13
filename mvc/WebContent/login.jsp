<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<c:if test="${not empty param.login}">
		<script>alert("아이디 또는 비밀번호를 확인해주세요.")</script>
	</c:if>
	<form action="login-ok.member" method="post">
		<label>
			<input type="text" name="memberEmail" placeholder="이메일 입력">
		</label>
		<label>
			<input type="password" name="memberPassword" placeholder="비밀번호 입력">
		</label>
		<div>
			<button>로그인</button>
		</div>
	</form>
</body>
</html>