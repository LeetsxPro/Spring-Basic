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
<title>JoinDetail Page</title>
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
		
		// 체크박스 체크 유무 값 전달
		if ($('#boxCK').is(":checked")) {
		    $('input[name=use]').val('Y');
		} else {
		    $('input[name=use]').val('N');
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
		<h2>상세정보</h2>
		<form method="post" id="form1">
			<div class="row">
				<div class="col-md-2"><h5>아이디:</h5></div>
				<div class="col-md-10"><input type="text" name="id"><span id="idCK"></span></div>
				<div class="col-md-2"><h5>비밀번호:</h5></div>
				<div class="col-md-10"><input id="pw" type="password" name="pw"><span id="PWlengthCK"></span></div>
				<div class="col-md-2"><h5>비밀번호확인:</h5></div>
				<div class="col-md-10"><input id="pw2" type="password"><span id="pwCK"></span></div>
				<div class="col-md-2"><h5>성 명:</h5></div>
				<div class="col-md-10"><input type="text" name="name"></div>
				<div class="col-md-2"><h5>관 계:</h5></div>
				<div class="col-md-10">
					<select name="rel">
						<option value="C0021">본인</option>
						<option value="C0022">부모님</option>
						<option value="C0023">동생</option>
						<option value="C0024">지인</option>
					</select>
				</div>
				<div class="col-md-2"><h5>우편번호:</h5></div>
				<div class="col-md-10"><input type="number" name="zipcd"></div>
				<div class="col-md-2"><h5>주 소:</h5></div>
				<div class="col-md-10"><input type="text" name="adr"></div>
				<div class="col-md-2"><h5>휴대전화번호:</h5></div>
				<div class="col-md-10"><input type="text" name="mp"></div>
				<div class="col-md-2"><h5>집전화번호:</h5></div>
				<div class="col-md-10"><input type="text" name="ht"></div>
				<div class="col-md-2"><h5>사용여부:</h5></div>
				<div class="col-md-10">
					<input type="hidden" name="use">
					<input id="boxCK" type="checkbox">
				</div>
			<button id="save" type="button">저장</button>
			</div>
		</form>
	</div>
</body>
</html>