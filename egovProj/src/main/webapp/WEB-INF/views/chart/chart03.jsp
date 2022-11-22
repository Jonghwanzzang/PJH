<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
	<title>제이쿼리 동적으로 생성된 버튼에 이벤트를 달아보자~</title>
</head>
<body>
	<div id="mainDiv">
		<button id="firstButton">firstBtn</button>
	</div>
</body>
</html>
<script>
<script type="text/javascript">
let key2 = sessionStorage.getItem("key1");

console.log("key2" + key2);
</script>

<script>
$(function(){
	//첫 번쨰 버튼 이벤트
	$("#firstButton").on("click",function(){
		let bodyHtml = "<button id='secondButton'>secondBtn</button>";
		//mainDiv 마지막 요소로 추가
		$("#mainDiv").append(bodyHtml);
	});
	
	//두 번째 버튼 이벤트
	//첫 번째 일반적인 방법으론 적용불가
	/* $("button[id='secondButton']").on("click",function(){
		alert("hihi");
	}); */
	$(document).on("click","#secondButton",function(){
		alert("hihi");
	});
	
	
});
	 //쉼표 문자열에서 최대값 구해보자
	let c_values = "500,200,600,700,100,300";
	//map : 반복문을 돌며 배열 안의 요소들을 1대1로 짝지어 줌
	varr = c_values.split(",");
	/*varr = c_values.split(",").map(str => Number(str));
	
	console.log(varr);
	console.log(varr.length);
	//reduce : 배열.reduce((누적값,현재값,인덱스,요소))
	// -Infinity : 초기값을 제공하지 않을 경우 배열의 첫 번쨰 요소를 사용함
	let max = varr.reduce(function(a,b){
		return Math.max(a,b);
	}, -Infinity); */
	
	
	
	
	 for(let i=0; i<varr.length; i++){
		if(varr[0] < varr[i+1]){
			varr[0] = varr[i+1];
			 maxval = varr[0];
		}
	} 
	console.log(maxval);
	
	


</script>