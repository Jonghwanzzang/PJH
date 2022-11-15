<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>list</title>
</head>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<body >
<div id="body">
	<table border="1px">
	<thead>
		<tr>
			<td id="bid"> 도서아이디 </td>
			<td> 도서제목 </td>
			<td> 도서분류 </td>
			<td> 도서금액 </td>
			<td> 출판일시 </td>
			<td> 삭제 </td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${vo}">
		<tr id="idtd">
		<td>${vo.bookId}</td>
		<td><a>${vo.title}</a></td>
		<td>${vo.category}</td>
		<td>${vo.price}</td>
		<td>${vo.insertDate}</td>
		<td><button type="button" onclick="gdelete('${vo.bookId}')">삭제</button></td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
		<button  type="button" id="insert">등록</button>
</div>
<script type="text/javascript">
$(function(){
	$("#insert").on("click",function(){
		alert("hi");
		data1 =`<div>도서제목<input id="title" name="title" type="text" value=""/></div>`
		data1 +=`<div>도서분류<input id="category" name="category" type="text" value=""/></div>`
		data1 +=`<div>도서금액<input id="price" name="price" type="text" value=""/></div>`
		data1 +=`<div><textarea id="content" name="content" rows="7" cols="7" style="width:800px;"></textarea></div>`
		data1 +=`<button onclick="senddata()" type="button" id="insertbtn">등록</button>`;
				
		
		$("#body").html(data1);
	});
	
});
	
	   function senddata(){
		 data = {
				 "title" : $("#title").val(),
				 "category" : $("#category").val(),
				 "price" : $("#price").val(),
				 "content" : $("#content").val()
		 };
		   console.log(data);
		
		$.ajax({
			type: 'post',   //get방식으로 명시
			url : '/insertdata',  //이동할 jsp 파일 주소
			data : JSON.stringify(data) ,
			contentType : "application/json; charset=utf-8",
			dataType:'text',   //문자형식으로 받기
			success: function(result){   //데이터 주고받기 성공했을 경우 실행할 결과
	            //function(data)를 쓰게 되면 전달받은 데이터가 data안에 담아서 들어오게 된다. 
				if(result == "1"){
					$("#body").html(`<table border="1px">
							<thead>
							<tr>
								<td> 도서아이디 </td>
								<td> 도서제목 </td>
								<td> 도서분류 </td>
								<td> 도서금액 </td>
								<td> 출판일시 </td>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="vo" items="${vo}">
							<tr>
							<td>${vo.bookId}</td>
							<td>${vo.title}</td>
							<td>${vo.category}</td>
							<td>${vo.price}</td>
							<td>${vo.insertDate}</td>
							</tr>
							</c:forEach>
						</tbody>
						</table>
						<button onclick="senddata()" type="button" id="insertbtn">등록</button>
						`);
				}
			},
			error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
				alert('실패');
			}
		});
	   };
	   
	   function list(){
			$("#body").html(`
					<table border="1px">
					<thead>
					<tr>
						<td> 도서아이디 </td>
						<td> 도서제목 </td>
						<td> 도서분류 </td>
						<td> 도서금액 </td>
						<td> 출판일시 </td>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="vo" items="${vo}">
					<tr>
					<td>${vo.bookId}</td>
					<td>${vo.title}</td>
					<td>${vo.category}</td>
					<td>${vo.price}</td>
					<td>${vo.insertDate}</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				<button onclick="senddata()" type="button" id="insertbtn">등록</button>
				`);
	   }
	   function gdelete(param){
		   $("#idtd").eq(param).remove();
		   
		   data ={
				"bookId" : param	   
		   };
		   
		   $.ajax({
				type: 'post',   //get방식으로 명시
				url : '/delete',  //이동할 jsp 파일 주소
				data : JSON.stringify(data) ,
				contentType : "application/json; charset=utf-8",
				dataType:'text',   //문자형식으로 받기
				success: function(result){   //데이터 주고받기 성공했을 경우 실행할 결과
		            //function(data)를 쓰게 되면 전달받은 데이터가 data안에 담아서 들어오게 된다. 
					if(result == "1"){
						list();
						alert("성공");
					}
				},
				error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
					alert('실패');
				}
			});
	   };
	   
	    
	
</script>
</body>
</html>