<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>상세정보</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
</head>
<script type="text/javascript">
function modify(){
	let category = document.querySelector("#category");
	let title = document.querySelector("#title");
	let price = document.querySelector("#price");
	let insertDate = document.querySelector("#insertDate");
	let content = document.querySelector("#content");
	
	
	category.removeAttribute("readonly"); 
	title.removeAttribute("readonly"); 
	price.removeAttribute("readonly"); 
	insertDate.removeAttribute("readonly"); 

	CKEDITOR.instances['content'].setReadOnly(false)
	let first = document.querySelector("#first");
	let second = document.querySelector("#second");
	first.style.display = "none";
	second.style.display = "block";
}
</script>

<script type="text/javascript">
$(function(){
	$("#price").on("keyup",function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
});
</script>
 <style>
 .form-group{
	 width : 100%;
	 }
 </style>
<body>
<!-- JSTL format을 이용하여 천단위 구분기호를 적용할 수 있음 -->
<!-- JSTL format을 이용하여 날짜 포맷을 적용할 수 있음 -->
	<div class="col-md-6" style="width:550px; margin-top: 1px; padding-top: 1px; ">
		<div class="card card-danger"  >
			<div class="card-header" >
				<h3 class="card-title">도서 상세정보</h3>
			</div>
		<form action="/book/modify" method="post">
			<div class="card-body" style="width:500px; ">
						<input type="hidden" id="bookId" class="form-control"
							inputmode="numeric" name="bookId" value="${vo.bookId}" readonly>
				<div class="form-group">
					<label>도서 제목</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
					<input type="text" id="title" name="title" class="form-control" inputmode="numeric" value="${vo.title}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label>도서 분류</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
						<input type="text" id="category"  name="category" class="form-control"
							inputmode="numeric" value="${vo.category}" readonly>
					</div>
				</div>
				<div class="form-group">
				<label>금액</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
						<input id="price" name="price" type="text" class="form-control"
							inputmode="numeric" value='<fmt:formatNumber pattern="#,###" value="${vo.price}"/>' readonly>
							
					</div>
				</div>
				<div class="form-group">
					<label>출시일자</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
					<input type="text" id="insertDate" name="insertDate" class="form-control"
							inputmode="numeric" value='<fmt:formatDate value="${vo.insertDate}" pattern="yyyy-MM-dd"/>' readonly>
					</div>
				</div>
				<div class="form-group">
					<label>내용:</label>
					<div class="input-group">
						<div class="input-group-prepend">
						</div>
					<textarea id="content" name="content" rows="10" cols="10"   readonly>${vo.content}</textarea>
					</div>
				</div>
				<!-- 일반모드~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<div id="first" style="float:right;">
					<div style="float:right; margin-left:5px" >
						<a onclick="modify()" type="button"  class="btn btn-block btn-dark btn-sm">수정</a>
					</div>
					<div style="float:right">
						<a href="/book/list" type="button" class="btn btn-block btn-success btn-sm">목록</a>
					</div>
					<div style="float:right; margin-right: 5px">
						<a href="/book/list" type="button" class="btn btn-block btn-success btn-sm">삭제</a>
					</div>
				</div>
				
				<!-- 일반모드~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<!-- 수정모드~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<div id="second" style="display:none">
					<div style="float:right; margin-left:5px" id="first">
						<input type="submit"  class="btn btn-block btn-dark btn-sm" value="확인"/>
					</div>
					<div style="float:right">
						<a href="/book/detail?bookId=${vo.bookId}" type="button" class="btn btn-block btn-success btn-sm">취소</a>
					</div>
				</div>
				<!-- 수정모드~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			</div>
			<sec:csrfInput/>
		</form>
		</div>
	</div>
	<script type="text/javascript">
		CKEDITOR.replace("content");
		
	</script>
</body>
</html>
