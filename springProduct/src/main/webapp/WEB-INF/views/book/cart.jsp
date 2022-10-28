<%@page import="vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.math.BigDecimal"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/resources/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<% //스크립틀릿
	// 장바구니 = 세션
	// 장바구니 고유번호 = session.getId();
	String sid = session.getId();
	out.println(sid);
%>
	<jsp:include page="menu.jsp" />
	
	
	<div class="jumbotron">
		<div class=container>
			<h1 class="display=3">장바구니</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<table>
				<tr >
					<td align="right">
					<a href="shippingInfo.jsp?cartId=<%=sid %>"class="btn btn-success">주문하기</a>
					<td>
					<td align="left">
					<a href="deleteCart.jsp?cartId=<%=sid%>"class="btn btn-success">삭제하기</a>
					<td>
					
				</tr>
			 </table>
		</div>
	
	<!-- 장바구니 출력 시작
	 
	 -->	
	 	<div style="paading-top:50px;">
			 <table class="table">
			 <tr>
			 	<th>상품</th><th>가격</th><th>수량</th>
			 	<th>금액</th><th>비고</th>
			 </tr>
			 <%
			 //장바구니 안에 들어있는 상품 몰고을 가져오자
			 ArrayList<BookVO> cartList = 
			 		(ArrayList<BookVO>)session.getAttribute("cartlist");
			 //금액을 누적하는 변수
			 double sum = 0;
			 
			 			 
			 // 장바구니가 비어있다면..
			 if(cartList == null){
			 %>
				 <tr>
				 	<td colspan="5" style="text-align:center;">장바구니에 상품이 없습니다.</td>
				 </tr>
				 <%
				 }else{ // 상품이 있다면..
					 	// 상품 리스트(ArrayList<ProductVO>)에서
					 	// 하나씩 상품(ProdictVO)를 꺼내보자
					 	for(BookVO product :cartList){
					 	// 금액 = 가격 * 수량
					 	 double total = product.getUnitPrice() *
					 	 product.getQuantity();
					 	BigDecimal totalBig = new BigDecimal(total);
					 	sum+=total;

				 %>
				 <tr>
				 	<td>
				 		<%=product.getBookId() %>
				 		<%=product.getName() %>
				 	</td>
				 	<td><fmt:formatNumber value="<%= product.getUnitPrice() %>" pattern="#,###"/></td>
				 	<td><%=product.getQuantity() %></td>
				 	<td><fmt:formatNumber value="<%=totalBig %>" pattern="#,###" /></td>
				 	<td>
				 		<a href="removeCart.jsp?id=<%=product.getBookId()%>" class="badge badge-danger">삭제</a>
				 	</td>
				 </tr>
				 <%
				 	}//end for
					 // 수소점 제거
					 BigDecimal big = new BigDecimal(sum);
				 			
					 	
					 	%>
				 <tr>
				 	<th></th>
				 	<th></th>
				 	<!-- 총액 : 금액의 합계 -->
				 	<th>총액</th>
				 	<th><fmt:formatNumber value="<%=big %>" pattern="#,###" /></th>
				 	<th></th>
				 </tr>
				 <%
				 }//end if
				 %>
			 </table>
			 <a href="books.jsp" class="btn btn-secondary">&raquo;쇼핑 계속하기</a>
		 </div>
	</div>
		





	<jsp:include page="footer.jsp" />

</body>
</html>