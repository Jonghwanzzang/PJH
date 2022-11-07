<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border="1px">
		<thead>
			<tr> 
				<td>이름</td>
				<td>번호</td>
				<td>주소</td>
				<td>전화번호</td>
				<td>차</td>
				
			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="info" items="${info}" varStatus="stat">
				<tr>
					<td>${stat.count }</td>
					<td>${info.name} </td>
					<td>${info.no} </td>
					<td>${info.address} </td>
					<td>${info.phoneNum} </td>
					<td>${info.car} </td>
					<td>${info.list} </td>
				</tr>
			</c:forEach>
		</tbody>
	
	
	</table>
	
</body>
</html>