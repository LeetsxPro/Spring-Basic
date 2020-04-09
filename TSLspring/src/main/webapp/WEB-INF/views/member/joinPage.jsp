<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Join Page</title>
<style>

</style>
<script type="text/javascript">
$(function(){
	
	// 비밀번호 자릿수 5이상 10자리 이하 설정
	$('#pw').blur(function(){
		if($('#pw').val().length < 5 || $('#pw').val().length > 10 ){
			$('#idlengthCK').html("비밀번호는 5자리 이상 10자리 이하로 입력해주세요.");
		}else {
			$('#idlengthCK').html("");
		}
	});
	
	// 비밀번호 중복 체크
	$('#pw2').blur(function(){
		if($('#pw').val() != $('#pw2').val()){
			$('#pwCK').html("비밀번호가 맞지 않습니다.");
		}else{
			$('#pwCK').html("");
		}
	});
});
</script>
</head>
<body>
	<div class="container">
		<p>아 이 디:<input type="text" name="id"></p>
		<p>비밀번호:<input type="password" id="pw" name="pw"></p>
		<p><span id="idlengthCK"></span>
		<p>비밀번호확인:<input type="password" id="pw2"></p>
		<p><span id="pwCK"></span></p>
		<p>이 름:<input type="text" name="name">
		<p><button type="button">저장</button></p>
	</div>
</body>
</html>