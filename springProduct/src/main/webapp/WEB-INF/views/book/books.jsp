<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<jsp:include page="menu.jsp" />
<head>
<title>Insert title here</title>

</head>
<body>

	<c:set var="list" value="${list}" scope="page" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<div class="container">
	<div class="row" style="justify-content:right; margin:0 0 30px 0;">
			<a href="/addBook" class="btn btn-primary">상품 추가</a>
		</div>
		<div class="row">
			<div class="col-md-6">
			<c:forEach var="list" items="${list}">
				<div>
					<img name="filename" alt="${list.name}" title="${list.name}" src="resources/images/${list.filename}" style="width:40%; height:40%;"/>
					<h1>${list.bookId}</h1>
					<p>${list.name }</p>
					<p>${list.category }</p>
					<p>${list.unitPrice}만원</p>
					<p>${list.author}</p>
					<p>${list.description}</p>
					<a href="/product?bookId=${list.bookId}">상세보기</a>
					<hr />
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp" />
</html>