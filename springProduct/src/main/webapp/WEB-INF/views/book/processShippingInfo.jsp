<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<%	
	request.setCharacterEncoding("utf-8");
	
	String cartId = request.getParameter("cartId");
	String name = request.getParameter("name");
	String shippingDate = request.getParameter("shippingDate");
	String country = request.getParameter("country");
	String zipCode = request.getParameter("zipCode");
	String addressName = request.getParameter("addressName");

	
	Cookie cookieId = new Cookie("cartId",
			URLEncoder.encode(cartId,"UTF-8"));
	Cookie cookiename = new Cookie("name",
			URLEncoder.encode(name,"UTF-8"));
	Cookie cookieshippingDate = new Cookie("shippingDate",
			URLEncoder.encode(shippingDate,"UTF-8"));
	Cookie cookiecountry = new Cookie("country",
			URLEncoder.encode(country,"UTF-8"));
	Cookie cookiezipCode = new Cookie("zipCode",
			URLEncoder.encode(zipCode,"UTF-8"));
	Cookie cookieaddressName = new Cookie("addressName",
			URLEncoder.encode(addressName,"UTF-8"));
	
	response.addCookie(cookieId);
	response.addCookie(cookiename);
	response.addCookie(cookieshippingDate);
	response.addCookie(cookiecountry);
	response.addCookie(cookiezipCode);
	response.addCookie(cookieaddressName);
	
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		Cookie cook = cookies[i];
		out.println(URLDecoder.decode(cook.getValue(),"UTF-8")+"<br>");
	}
	
	response.sendRedirect("orderConfirmation.jsp");
	

%>
<body>

</body>
</html>