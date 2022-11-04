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
				<td>나이</td>
				<td>주소</td>
				<td>전화번호</td>
				<td>성별</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="list"  items="${list}">
			<tr>
				<td>${list.stName}</td>
				<td>${list.stage}</td>
				<td>${list.address}</td>
				<td>${list.stHp}</td>
				<td>${list.gender}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>