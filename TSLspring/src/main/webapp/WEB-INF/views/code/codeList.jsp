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
		
		$('.cno').val($('#cno').text());
		$('.clv').val($('#clv').text());
		$('.highc').val($('#highc').text());
		$('.cname').val($('#cname').text());
		$('.use').val($('#use').text());
		
	});
	
	// 저장 버튼
	$('#save').click(function(){
		var action = $('#twoAction').val();
		
		if(action == 'a1'){
			alert("a1");
		}else{
			alert("a2");
		}
		
		/* $("#update").click(function () {
		       $("form").attr("action", "/manage/update");
		});
		 
		$("#delete").click(function () {
		       $("form").attr("action", "/manage/delete");
		});
 */
	});
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
						<td>${data.use }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="border:1px solid black">
			<div style="border-bottom:1px solid black"><h1>코드내용</h1></div>
			<input type="text" id="twoAction">
			<form method="post" id="form1">
				<p>코드번호:<span class="list" id="cno"></span>
					<input class="ei cno" type="text" name="cno"></p>
				<p>코드레벨:<span class="list" id="clv"></span>
					<input class="ei clv" type="text" name="clv"></p>
				<p>상위코드:<span class="list" id="highc"></span>
					<input class="ei highc" type="text" name="highc"></p>
				<p>코드이름:<span class="list" id="cname"></span>
					<input class="ei cname" type="text" name="cname"></p>
				<p>사용여부:<span class="list" id="use"></span>
					<input class="ei use" type="text" name="use"></p>
			</form>
			<button type="button" id="insert">추가</button>
			<button type="button" id="edit">수정</button>
			<button type="button" id="save">저장</button>
		</div>
			
	</div>
</body>
</html>