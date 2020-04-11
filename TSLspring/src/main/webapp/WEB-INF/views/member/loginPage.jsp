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
<title>Login Page</title>
<style>

</style>
<script type="text/javascript">
$(function(){
	
	// 입력사항 값이 채워졌는지 확인, 폼 실행
	function contents(){
		if(!$('input[name=id]').val()){
			alert("ID를 입력하세요.");
		}
		if(!$('input[name=pw]').val()){
			alert("비밀번호를 입력하세요.");
		}
		$('#form1').attr('action', 'loginProg');
		$('#form1').submit();
	}
	
	// 로그인 버튼
	$('#login').click(contents);
	
	// 조인 버튼
	$('#join').click(function(){
		location.href = "/www/member/joinPage";
	});
});
</script>
</head>
<body>
	<div class="container">
		<form method="post" id="form1">
			<p>아 이 디: <input type="text" name="id"></p>
			<p>비밀번호:<input type="password" name="pw"></p>
		</form>
		<button type="button" id="login">로그인</button>
		<button type="button" id="join">회원가입입</button>
	</div>
</body>
</html>