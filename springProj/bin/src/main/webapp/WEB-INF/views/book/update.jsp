<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>책 등록하기</title>
<script type="text/javascript">
//	jQuery 시작
$(function(){
	$("#btnCancel").on("click",function(){
		// EL 태그 데이터를 JS 변수에 저장할 땐 아래 처럼 땅따옴표를 써줘야 된다.
		let bookId = "${param.bookId}"
		// param => param(URL 및 바디에 딸려온 데이터)
		location.href="/detail?bookId="+bookId;		
	});
	$("#btnlist").on("click",function(){
		location.href="/list";	
	});
});

</script>
</head>
<body>
<!-- BookController에서 넘어온 데이터? -->
	<h1>책 수정</h1>
	<!-- http://localhost/create?title=개똥이&category=소설&price=8000 -->
	<form action="update" method="post">
		<input type="hidden" name="bookId" value="${data.bookId}">
		<p>제목 : <input type="text" name="title" value="${data.bookId}" required="required"> </p>
		<p>카테고리: <input type="text" name="category" value="${data.category}"> </p>
		<p>가격: <input type="text" name="price" value="${data.price}"> </p>
		<p>
			<input type="submit" value="저장">
			<input type="button" value="취소" id="btnCancel">
			<button type="button" id="btnlist">목록</button>
		</p>
	</form>
</body>
</html>