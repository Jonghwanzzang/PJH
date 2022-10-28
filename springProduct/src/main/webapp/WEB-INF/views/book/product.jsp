<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	
<title>Insert title here</title>
<script type="text/javascript">
function addCart(){
	
	let result = confirm("상품을 장바구니에 추가하시겠습니까");
	console.log(result);
	if(result){
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
	
}

</script>
</head>
<jsp:include page="menu.jsp"/>
<c:set var="bookvo" value="${bookvo}" scope="page"/>
<body>
<!-- List<ProductVO> -> 한 행을 꺼내오면 -> PRODUCTVO -->
	<div class="container">
		<div class="row">
				<img alt="사진" src="/resources/images/${bookvo.filename}">
				<div>
				<b><h2>도서 명 : ${bookvo.name}</h2></b>
				<h3>도서 아이디 : ${bookvo.bookId}</h3>
				<p> 가격 : ${bookvo.unitPrice}</p>
				<p>저자 : ${bookvo.author}</p>				
				<p>설명 : ${bookvo.description }</p>				
				<p>출판사 :${bookvo.publisher }</p>				
				<p>분류 : ${bookvo.category}</p>				
				<p>재고 수 : ${bookvo.unitsInStock }</p>
				<p>출판일 : ${bookvo.releaseDate }</p>
				<p>컨디션 : ${bookvo.condition}</p>			
				</div>
				<form name="addForm" action="addCart.jsp?id=${bookvo.bookId}" method="post">
					<a href="#" onclick="addCart()" class="btn btn-info">도서 주문&raquo;</a> 
					<a href="cart.jsp" class="btn btn-secondary">장바구니&raquo;</a>
					<a href="books.jsp" class="btn btn-secondary">도서 목록&raquo;</a>
					
				</form>				
				</p>	
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"/>
</html>