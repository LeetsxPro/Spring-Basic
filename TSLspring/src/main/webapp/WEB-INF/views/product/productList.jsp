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
	$('select[name=category]').change(function() {
		$.ajax({
			url:"/www/product/prodList",
			type:"post",
			dataType:"json",
			data:{
				"mfrcd" : $('select[name=category] > option:selected').val()
			},
			
			success: function(data) {
				$("select[name=firstClassification] option").remove();  // 옵션 제거
				$("select[name=firstClassification]").append('<option value=""> - 선택 - </option>');
				$(data).each(function(index, item) {
					$("select[name=firstClassification]").append('<option value="' + item.prodcd + '">' + item.prodtype + '</option>');
				})
			}
		});
	});

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
						<option value="${mfrList.mfrcd}">${mfrList.mfrnm}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md">1차 분류</div>
			<div class="col-md">
				<select name='firstClassification'>
					<option></option>
				</select>
			</div>
			<div class="col-md"><button type="button">조회</button></div>
		</div>
	</div>
</body>
</html>