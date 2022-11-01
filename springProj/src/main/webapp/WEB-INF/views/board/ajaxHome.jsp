<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/jquery.min.js" type="text/javascript"></script>
<title>Headers 매핑</title>
<script type="text/javascript">
$(function(){ // document가 로딩이 완료 되면 실행
	$("button").on("click",function(){
		let boardNoVal = "7";
		let boardObject = {
			"boardNo":"7" ,
			"title" : "개똥이 수리남 가다" ,
			"content" : "식사는 잡쉈어?",
			"writer": "개똥이"
		}
		console.log("boardOnject : " + JSON.stringify(boardObject));
		
		// content 타입과 data 타입의 차이점
		// ContentType => 보내는 타입 
		// dataType => 응답 타입
		$.ajax({ // 비동기 
			url:"/board/"+boardNoVal,
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(boardObject), 
			type: "put",
			success:function(result){
			
			// SUCCESS는 result에 담긴다
			console.log("result : " + result)
			}
		});
	});// ajax end
	
	$("input[name='btnAccept']").on("click",function(){
		let boardNo = $("#boardNo").val(); // 7
		console.log("boardNo : ",boardNo);
		
		//GET 방식으로 /board/7 URI로 요청하면
		// JSON데이터로 응답
		$.get("/board/"+boardNo,function(data){
		//data : JSON데이터
		console.log("data : ",JSON.stringify(data))
		})
	});// end
	
	$("input[name='btnJson']").on("click",function(){
		let boardNo = $("boardNo").val();
		
		console.log("boardNo : " + boardNo);
		
		let data = {
				"boardNo":boardNo
				
		}
		
		$.ajax({
			url: "/board/getBook",
			contentType:"application/json;charset:utf-8",
			data:JSON.stringify(data),
			type:"post",
			success:function(result){
				//result는 컨트롤러에서 넘어온 BookBO 타입 => JSON으로 변환됨
					console.log(JSON.stringify(result));
			}
		});
	});
});

</script>
</head>
<body>
	<h2>Headers 매핑</h2>
	<button type="button">안녕하세요</button>
	<h2>7.Accept 매핑</h2>
	<p><input type="text" name="boardNo" id="boardNo" value="7"></p>
	<p><input type="button" name="btnAccept" value="실행"></p>
	<p><input type="button" name="btnJson" value="ajax로실행"></p>
</body>
</html>