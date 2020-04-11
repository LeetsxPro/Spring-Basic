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
	
	// 아이디 중복확인
	$('input[name=id]').blur(function(){
		
		$.ajax({
			url		: "/www/member/idCK",
			type	: "post",
			datatype: "json",
			data	: {"id" : $('input[name=id]').val()},
			
			success : function(data){
				var cnt = data;
				
				if(cnt == 1){
					$('#idCK').html("중복된 아이디입니다. 다시 설정해 주세요.")
					$('input[name=id]').val("");
				}else{
					$('#idCK').html("");
				}
			}
			
		});
	});
	
	// 비밀번호 자릿수 5이상 10자리 이하 설정
	$('#pw').blur(function(){
		if($('#pw').val().length < 5 || $('#pw').val().length > 10 ){
			$('#PWlengthCK').html("비밀번호는 5자리 이상 10자리 이하로 입력해주세요.");
		}else {
			$('#PWlengthCK').html("");
		}
	});
	
	// 비밀번호 중복 체크
	$('#pw2').blur(function(){
		if($('#pw').val() != $('#pw2').val()){
			$('#pwCK').html("비밀번호가 맞지 않습니다.");
			$('#pw2').val("");
		}else{
			$('#pwCK').html("");
		}
	});
	
	// 컨텐츠 항목 빈 값 확인
	function contents(){
		if(!$('input[name=id]').val()){
			alert("아이디를 입력해주세요.");
			return;
		}
		if(!$('input[name=pw]').val()){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if(!$('#pw2').val()){
			alert("비밀번호 확인을 입력해주세요.");
			return;
		}
		if(!$('input[name=name]').val()){
			alert("이름을 입력해주세요.");
			return;
		}
		$('#form1').attr("action", "/www/member/joinProg");
		$('#form1').submit();
	}
	
	// 저장 버튼
	$('#save').click(contents);
});
</script>
</head>
<body>
	<div class="container">
		<form method="post" id="form1">
			<p>아 이 디:<input type="text" name="id"><span id="idCK"></span></p>
			<p>비밀번호:<input type="password" id="pw" name="pw"><span id="PWlengthCK"></span>
			<p>비밀번호확인:<input type="password" id="pw2"><span id="pwCK"></span></p>
			<p>이 름:<input type="text" name="name">
			<p><button id="save" type="button">저장</button></p>
		</form>
	</div>
</body>
</html>