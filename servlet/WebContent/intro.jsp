<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자기 소개</title>
</head>
<body>
<!-- 나이를 추가로 입력받은 뒤 서블릿에서 만 나이로 계산하여 화면에 출력 -->
	<form action="home" method="post" name="intro-form">
		<input name="name" placeholder="이름을 입력하세요.">
		<p id="result"></p>
		<input name="age" placeholder="나이를 입력하세요.">
		<p id="age-result"></p>
		<button id="send" type="button">완료</button>
	</form>
</body>
<script>
	const form = document.querySelector("form[name=intro-form]");
	const input = document.querySelector("input[name=name]");
	const result = document.getElementById("result");
	const ageInput = document.querySelector("input[name=age]");
	const ageResult = document.getElementById("age-result");
	const button = document.getElementById("send");
	
	input.addEventListener("blur", () => {
		globalThis.flag = false;
		if(!input.value){
			result.innerText = "이름을 입력해주세요.";
			result.style.color = "red";
			result.style.fontSize = "1.5rem";
			return;
		}
		result.innerText = "멋진 이름입니다!";
		result.style.color = "blue";
		result.style.fontSize = "1.5rem";
		globalThis.flag = true;
	})
	
	button.addEventListener("click", () => {
		if(!globalThis.flag) return;
		if(!ageInput.value){
			ageResult.innerText = "나이를 입력해주세요.";
			ageResult.style.color = "red";
			ageResult.style.fontSize = "1.5rem";
			return;
		}
		result.innerText = "";
		form.submit();
	});
	
	
</script>
</html>