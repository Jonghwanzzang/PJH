<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>Item</title>
<script type="text/javascript">
$(function(){
	let formObj = $("#item");
	
	$("#btnRegister").on("click",function(){
		//attr : id , actiob , method , enctype
		// 속성 또는 속성 값을 변경 attr
		formObj.attr("action","/item/register"); // action 속성의 값을 변경
		formObj.attr("method" , "post") // method 변경
		formObj.submit();
	});
});


</script>
</head>
<body>
<!-- 
ITEM 3 테이블
ITEM_ID , ITEM_NAME , PRICE , DESCRIPTION
 -->

<h2>REGITER</h2>
	<form id="item" action="/item/register" method="post" enctype="multipart/form-data">
		<table>
			<tr>
			<!-- input 태그 네임들은 카멜표기법으로 -->
				<td>상품명</td>
				<td> <input type="text" name="itemName" /> </td>
			</tr>
			<tr>
				<th>가격 </th>
				<td> <input type="text" name="price"> </td>
			</tr>
			<tr>
				<th>파일</th>
				<td> <input type="file" name="picture"> </td>
			</tr>
			<tr>
				<th>개요</th>
				<td>
					<textarea rows="description"></textarea>
				</td>
			</tr>
		</table>
	</form>
	<div>
		<button type="button" id="btnRegister">Register</button>
		<button type="button" id="btnList">List</button>
	</div>
</body>
</html>