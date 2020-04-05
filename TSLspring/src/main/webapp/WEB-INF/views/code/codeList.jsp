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
<title>Code Page</title>
<style>

</style>
<script type="text/javascript">
$(function(){
	
	// 상세보기
	$('.toInfo').click(function(){
		
		var listcno = $(this).attr('id');
		
		$.ajax({
			url		: "/www/code/codeInfo",
			type	: "post",
			dataType: "json",
			data	: {
				"cno" : listcno
			},
			success : function(data){
				$('#cno').html(data.cno);
				$('#clv').html(data.clv);
				$('#highc').html(data.highc);
				$('#cname').html(data.cname);
				$('#use').html(data.use);
				$('.ei').css('display', 'none');
				$('.list').css('display', 'inline-block');
				$('#cnoP').css('display', 'inline-block');
				
			},
			error : function(){
				alert('코드 정보 요청에 실패했습니다.');
			}
		});
	});
	
	// 추가 버튼
	$('#insert').click(function(){
		$('.list').css('display', 'none');
		$('.ei').css('display', 'inline-block');
		$('#twoAction').val("a1");
		$('.ei').attr('disabled', false);
		$('#cnoP').css('display', 'none');
		
		$('.cno').val('');
		$('.clv').val('');
		$('.highc').val('');
		$('.cname').val('');
		$('.use').val('');
	});
	
	// 수정 버튼
	$('#edit').click(function(){
		$('.list').css('display', 'none');
		$('.ei').css('display', 'inline-block');
		$('#twoAction').val("a2");
		$('.ei').attr('disabled', false);
		
		$('.cno2').html($('#cno').text());
		$('#cnoP').css('display', 'inline-block');
		
		$('.cno').val($('#cno').text());
		$('.clv').val($('#clv').text());
		$('.highc').val($('#highc').text());
		$('.cname').val($('#cname').text());
		$('.use').val($('#use').text());
		
		
	});
	
	// 저장 버튼
	$('#save').click(function(){
		var action = $('#twoAction').val();
		
		// 코드 추가 실행
		if(action == 'a1'){
			alert("a1");
			// SQL 체크 박스 값 넘길 때
			if ($('input[name=useCK]').is(":checked")) {
			    $('input[name=use]').val('Y');
			} else {
			    $('input[name=use]').val('N');
			}
			$('#form1').attr("action", "/www/code/codeAdd");
			$('#form1').submit();
			
		// 코드 수정 실행
		}else{
			alert("a2");
			// SQL 체크 박스 값 넘길 때
			if ($('input[name=useCK]').is(":checked")) {
			    $('input[name=use]').val('Y');
			} else {
			    $('input[name=use]').val('N');
			}
			$('#form1').attr("action", "/www/code/codeEdit");
			$('#form1').submit();
		}
	});
	
	// 체크 박스 checked
	$('input:checkbox[id="Y"]').attr("checked", true);
	
});
</script>
</head>
<body>	
	<div class="container">
		<h1>전체리스트</h1>
		<table class="table table-bordered text-center">
			<thead>
				<tr>
					<th>코드번호</th>
					<th>코드레벨</th>
					<th>상위코드</th>
					<th>코드이름</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${LIST }">
					<tr class="toInfo" id="${data.cno }" style="cursor:pointer">
						<td>${data.cno }</td>
						<td>${data.clv }</td>
						<td>${data.highc }</td>
						<td>${data.cname }</td>
						<td><input type="checkbox" id="${data.use }" disabled="disabled"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="border:1px solid black">
			<div style="border-bottom:1px solid black"><h1>코드내용</h1></div>
			<input type="text" id="twoAction">
			<form method="post" action="" id="form1">
				<p id="cnoP">코드번호:<span class="list" id="cno"></span>
					<input class="ei cno" type="text" name="cno" disabled>
					<span class="cno2"></span></p>
				<p>코드레벨:<span class="list" id="clv"></span>
					<input class="ei clv" type="text" name="clv" disabled></p>
				<p>상위코드:<span class="list" id="highc"></span>
					<input class="ei highc" type="text" name="highc" disabled></p>
				<p>코드이름:<span class="list" id="cname"></span>
					<input class="ei cname" type="text" name="cname" disabled></p>
				<p>사용여부:<span class="list" id="use"></span>
					<input type="hidden" name="use">
					<input class="ei use" type="checkbox" name="useCK" disabled></p>
			</form>
			
			<button type="button" id="insert">추가</button>
			<button type="button" id="edit">수정</button>
			<button type="button" id="save">저장</button>
		</div>
			
	</div>
</body>
</html>