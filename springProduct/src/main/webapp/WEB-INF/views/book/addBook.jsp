<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
<title>상품 등록</title>
<script type="text/javascript" src="/resources/js/bookvalidation.js"></script>
</head>								
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<!-- 내용 드루와 -->
		<div class="container">
			<h1 class="display-3"><spring:message code="bookAdd" /> </h1>
		</div>
	</div>

	<!--======================== 상품 등록 시작 ============================= -->
	<!-- List<ProductVO> -> 한 행을 꺼내오면 -> PRODUCTVO -->
	<div class="container">
		<form name="newBook" action="/processAddBook" enctype="multipart/form-data" class="form-horizontal" method="post">
		<div class="text-right">
			<a href=addBook.jsp?language=ko>Korean</a> | <a href=addBook.jsp?language=en>English</a>
		</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="bookId"/> </label>
				<div class="col-sm-3">
					<input type="text" name="bookId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="name"/></label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="description"/></label>
				<div class="col-sm-3">
					<textarea name="description" rows="2" cols="50"
						class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="author"/></label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="publisher"/></label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="releaseDate"/></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New" /><spring:message code="condition_New"/> 
					<input
						type="radio" name="condition" value="Old" /><spring:message code="condition_Old"/> <input
						type="radio" name="condition" value="Refubished" /><spring:message code="condition_Refubished"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="filename"/></label>
				<div class="col-sm-3">
					<input type="file" name="filename"/>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="dol-sm-offset-2col-sm-10">
			<input type="submit" class="btn btn-primary" value="<spring:message code='upload'/>"/> 
				<a href="/books" class="btn btn-warn"><spring:message code="booklist"/></a>
			</div>
			</div>
			
			
	
	</form>
	</div>
	<!--======================== 상품 등록 끝 ============================= -->
	<jsp:include page="footer.jsp" />

</body>
</html>