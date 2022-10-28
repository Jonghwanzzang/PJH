<%@page import="vo.BookVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%
	//스크립틀릿
	String cookieId = "";
	String cookiename ="";
	String cookieshippingDate ="";
	String cookiecountry ="";
	String cookiezipCode ="";
	String cookieaddressName = "";
	
	//request 객체에 있는 모든 쿠키 객체를 받아서
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		
		//쿠키 이름 가져옴
  		//out.print(URLDecoder.decode(thisCookie.getName()) + "<br/>");
		//쿠키 값 가져옴
  		//out.print(URLDecoder.decode(thisCookie.getValue()) + "<br/>");
		
		if(thisCookie.getName().equals("cartId")){
			cookieId = URLDecoder.decode(thisCookie.getValue());
		}
		if(thisCookie.getName().equals("name")){
			cookiename = URLDecoder.decode(thisCookie.getValue());
		}
		if(thisCookie.getName().equals("shippingDate")){
			cookieshippingDate = URLDecoder.decode(thisCookie.getValue());
		}
		if(thisCookie.getName().equals("country")){
			cookiecountry = URLDecoder.decode(thisCookie.getValue());
		}
		if(thisCookie.getName().equals("zipCode")){
			cookiezipCode = URLDecoder.decode(thisCookie.getValue());
		}
		if(thisCookie.getName().equals("addressName")){
			cookieaddressName = URLDecoder.decode(thisCookie.getValue());
		}
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<title>주문 정보</title>
</head>
<body>
<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class=container>
			<h1 class="display=3">주문 정보</h1>
		</div>
	</div>
	<!---------- 주문 정보 시작 ---------->
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
	<!---------- 고객 정보 시작 : cookie 사용 --->
		<div class="row justify-content-between">
			<strong>배송 주소</strong>
			성명 : <%=cookiename %><br/>
			우편번호 : <%=cookiezipCode %><br/>
			주소 : <%=cookieaddressName%> &nbsp; <%=cookiecountry%> <br/>
		</div>
		<div class="col-4" align="right">
			<p>
				<em>배송일 :<%=cookieshippingDate %> </em>
			</p>
		</div>
		<!-- 고객 정보 끝 -->
		<!-- 상품 정보 : session 사용 -->
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품명</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">금액</th>
				</tr>
				<%
					//누적금액 변수선언
					double sum =0;
					//cartlist라는 장바구니 = 세션			
					ArrayList<BookVO> cartlist = 
							(ArrayList<BookVO>)session.getAttribute("cartlist");
					// 상품 목록을 하나씩 출력해보자
					for(int i=0; i<cartlist.size(); i++){
						//상품을 목록에서 하나 끄집어내자
						BookVO product = cartlist.get(i);
						//얼마짜리를 몇 개 샀니?
						double total 
							= product.getUnitPrice() * product.getQuantity();
						BigDecimal totalBig = new BigDecimal(total);
						
						sum += total;
						
					
				%>
				<tr>
					<td class="text-center"><em><%=product.getName() %></em></td>
					<td class="text-center"><%=product.getQuantity() %> </td>
					<td class="text-center"> 
						<fmt:formatNumber value="<%=product.getUnitPrice() %>" pattern="#,###"/> 
					</td> 
					<td class="text-center"> 
						<fmt:formatNumber value="<%=totalBig %>" pattern="#,###"/>
					</td>
				</tr>
				<%
					}
					// ###.0 => ###
							BigDecimal bdm = new BigDecimal(sum);
					
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액:</strong></td>
					<td class="text-center text-danger"><strong>
						<fmt:formatNumber value="<%=bdm %>" pattern="#,###"/>원</strong>
					</td>
				</tr>
			</table>
			<a href="shippingInfo.jsp?id=<%=cookieId%>" class="btn btn-success">이전 </a>
			<a href="thankCustomer.jsp" class="btn btn-success"
				role="button">주문완료</a>
			<a href="checkOutCancelled.jsp" 
				class="btn btn-secondary">취소</a>
		</div>





		<!-- 상품 정보 : session 사용 -->
	</div>


	<!---------- 주문 정보 끄읏 ---------->
	
	<!-- 끝맺음 -->
	<jsp:include page="footer.jsp" />
</body>
</html>