<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>도서등록</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

</head>

 <style>
 .form-group{
	 width : 90%;
	 }
 </style>
<body>
<!-- JSTL format을 이용하여 천단위 구분기호를 적용할 수 있음 -->
<!-- JSTL format을 이용하여 날짜 포맷을 적용할 수 있음 -->
	<div class="col-md-6" style=" margin-top: 1px; padding-top: 1px; ">
		<div class="card card-danger" style="width:70%; " >
			<div class="card-header">
				<h3 class="card-title">도서 등록</h3>
			</div>
		<form action="/book/insert" method="post">
			<div class="card-body">
				<!-- <div class="form-group">
					<label>도서 아이디</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
						<input type="text" id="bookId" class="form-control"
							inputmode="numeric" name="bookId" value="" readonly>
					</div>
				</div> -->
				<div class="form-group">
					<label>도서 제목</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
					<input type="text" id="title" name="title" class="form-control" inputmode="numeric" value="">
					</div>
				</div>
				<div class="form-group">
					<label>도서 분류</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
						<input type="text" id="category"  name="category" class="form-control"
							inputmode="numeric" value="" >
					</div>
				</div>
				<div class="form-group">
				<label>금액</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
						<input id="price" name="price" type="text" class="form-control"
							inputmode="numeric" value='' >
							
					</div>
				</div>
				<div class="form-group">
					<label>내용:</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
					<textarea id="content" name="content" rows="7" cols="7" style="width:800px;"></textarea>
					</div>
				</div>
				<div id="first">
					<div style="float:right; margin-left:5px" >
						<button class="btn btn-block btn-dark btn-sm">등록</button>
					</div>
					<div style="float:right">
						<a href="/book/list" type="button" class="btn btn-block btn-success btn-sm">취소</a>
					</div>
				</div>
			</div>
		</form>
		</div>
	</div>

</body>
	<script type="text/javascript">
		CKEDITOR.replace("content");
	</script>
</html>
