<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">

</script>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		
		if(id==null && id.equals("")){
			response.sendRedirect("books.jsp");
		}
		
		BookRepository dao = BookRepository.getinstance();
		
		BookVO bookInfo = dao.getBookById(id);
		
		ArrayList<BookVO> list = (ArrayList<BookVO>)session.getAttribute("cartlist");
		
		if(list == null){
			list = new ArrayList();
			session.setAttribute("cartlist", list);
		}
		int cnt =0;
		
		for(BookVO vo :list){
			if(id.equals(vo.getBookId())){
				cnt +=1;
				vo.setQuantity(vo.getQuantity()+1);
			}
		}
		
		if(cnt==0){
			bookInfo.setQuantity(1);
			list.add(bookInfo);
		}
		
		response.sendRedirect("product.jsp?id="+id);
				
		
		
	%>

</body>
</html>