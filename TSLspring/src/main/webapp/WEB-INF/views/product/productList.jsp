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
<title>Product List</title>
<style>

</style>
<script type="text/javascript">
$(function(){
	
	// 1차 카테고리 선택시 자동 1차 분류 목록 실행
	$('select[name=category]').change(function() {
		$.ajax({
			url:"/www/product/subList",
			type:"post",
			dataType:"json",
			data:{
				"mfrcdno" : $('select[name=category] > option:selected').val()
			},
			
			success: function(data) {
				$("select[name=firstClassification] option").remove();  // 옵션 제거
				for(key in data){
					$('select[name=firstClassification]').append('<option value="' + data[key].mfrcdno + '">' + data[key].mfrnm + '</option>');
				}
				console.log(data[key]);
			}
		});
	});
	
	// 조회 버튼 클릭시
	$('#lookup').click
});
</script>
</head>
<body>
	<div class="container">
		<h2>전체 리스트</h2>
		<div class="row">
			<div class="col-md">카테고리:</div>
			<div class="col-md">
				<select name="category">
					<option value='' selected>-- 선택 --</option>
					<c:forEach var="mfrList" items="${mfrList}">
						<option value="${mfrList.mfrcdno}">${mfrList.mfrnm}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md">1차 분류</div>
			<div class="col-md">
				<select name='firstClassification'>
					<option>--선택--</option>
				</select>
			</div>
			<div class="col-md"><button type="button" id="lookup">조회</button></div>
		</div>
		<table class="table table-bordered text-center">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>제조사코드</th>
					<th>제조사명</th>
					<th>단위코드</th>
					<th>단위명</th>
					<th>재고수량</th>
					<th>재고여부</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>