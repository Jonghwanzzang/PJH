<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	String Shipping_name = "";
	String Shipping_shippingDate ="";
	String Shipping_country ="";
	String Shipping_zipCode ="";
	String Shipping_addressName ="";
	String Shipping_cartId = "";
	
		Cookie[] cookies = request.getCookies();
	
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("cartId")){
				Shipping_cartId = URLEncoder.encode(cookies[i].getValue());
		}
			if(cookies[i].getName().equals("name")){
				Shipping_name = URLEncoder.encode(cookies[i].getValue());
		}
			if(cookies[i].getName().equals("shippingDate")){
				Shipping_shippingDate = URLEncoder.encode(cookies[i].getValue());
				
		}
			if(cookies[i].getName().equals("country")){
				Shipping_country = URLEncoder.encode(cookies[i].getValue());
				
		}
			if(cookies[i].getName().equals("zipCode")){
				Shipping_zipCode = URLEncoder.encode(cookies[i].getValue());
				
		}
			if(cookies[i].getName().equals("addressName")){
				Shipping_addressName = URLEncoder.encode(cookies[i].getValue());
		}
		}
	
	
	%>
<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class=container>
			<h1 class="display=3">주문 정보</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은<%=Shipping_shippingDate%></p>
		<p>주문은<%=Shipping_cartId%></p>
	</div>
	<div class="container">
		<p><a href="books.jsp" class="btn btn-secondary">
			&laquo;상품 목록
		</a></p>
	</div>
	



<jsp:include page="footer.jsp" />
</body>
</html>