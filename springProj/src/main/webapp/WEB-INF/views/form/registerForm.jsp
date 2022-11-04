<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Spring Form</title>
</head>
<body>
	<!--
	 modelAttribute 속성에 폼 객체의 속성명을 지정함 
	 태그라이브러리를 입력하게되면 modelAttribute  속성 사용가능
	 -->
	 <!-- 폼 객체의 속성 명과 스프링 폼 태그의 modelAttribute 속성값은 
	 컨트롤러에  model.attribute("name",value ) <-- name값과 일치해야함 
	 -->
	 <form:form modelAttribute="member" method="post" action="/form/register">
	 	<table>
	 		<tr>
	 			<td>유저 ID</td>
	 			<td>
	 			<!-- <input type="text" name="memId" id="memId"와 동일하다 -->
	 				<form:input path="memId" />
	 				<font color="red"><form:errors path="memId" /></font> 
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>이름</td>
	 			<td>
	 				<form:input path="memName" />
	 				<font color="red"><form:errors path="memName" /></font> 
	 			</td>
	 		</tr>
	 		
	 	</table>
	 	<form:button name="register">등록</form:button>
	 
	 </form:form>

</body>
</html>