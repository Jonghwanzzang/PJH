<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	// 스크립틀릿
	//deleteCart.jsp?cartId=wqe2keo2j2mri2jrik2rp2r <= session.getId()
	// 요청 파라미터의 cartId를 받아보자
	String id = request.getParameter("cartId");

	//cartId가 없으면 => cart.jsp로 이동
	if(id == null || id.trim().equals("")){
		response.sendRedirect("cart.jsp");
	}

	//장바구니 비우기
// 	session.removeAttribute("cartlist");
	session.invalidate(); // 모든 세션 삭제
	
	response.sendRedirect("cart.jsp");

%>
