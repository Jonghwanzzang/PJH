<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){ // body가 다 읽힌다음에 실행해라
	$("#inputFile").on("change",function(e){
		console.log("change");
		
		let files = e.target.files;
		
		let file = files[0];
		console.log("file : " + file)
		
		let formData = new FormData();
		formData.append("file",file);
		
		$.ajax({ // p   c  da ty su u 피시 다타써유
				//contentType : 보내는 타입
				// dataType : 응답 타입
			
			url : "/board/uploadAjax",
			processData:false,
			contentType:false, //
			data : formData,
			type:"post",
			dataType:"text",
			success:function(data){
				console.log("data : " + data);
			}
		});
	});
});


</script>
<title>AjAX 방식 파일 업로드</title>
</head>
<body>
	<form action="" method="post" enctype="multipart/form-data">
		<p><input type="file" id="inputFile" name="picture" ></p>
		<p> <input type="button" value="업로드~"></p>
	</form>
	
</body>
</html>