<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<!-- 구글 차트 호출을 위한 js 파일 라이브러리 임포트 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	$(function(){
		
		//구글 차트 라이브러리 로딩(메모리에 올림)
		google.load("visualization","1",{
			"packages":["corechart"]
		});
		
		
		//로딩이 완료되면 drawChart 함수를 호출해보자
		google.setOnLoadCallback(drawChart);
		google.setOnLoadCallback(drawChart2);
		google.setOnLoadCallback(drawChart3);
		
		function drawChart(){
			let jsonData = $.ajax({
				url:"/resources/json/sampleData2.json",
				dataType : "json",
				async:false
			}).responseText;
			
			console.log("jsonData : " + jsonData);
			
			//데이터 테이블 생성
			let data = new google.visualization.DataTable(jsonData);
//  			let data = new google.visualization.DataTable(jsonData2);
		
			//차트를 출력할 div 서택
 			let chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));
			
			chart.draw(data,{
				title:"나다 이씹새끼야",
// 				curveType:"function", 넣으면 뾰족뾰족 뺴면 둥글둥글 -- LineChart
				width:600,
				height:450
				
			});
		
		}
		function drawChart2(){
			let jsonData2 = $.ajax({
				url:"/resources/json/sampleData2.json",
				dataType : "json",
				async:false
			}).responseText;
			
// 			console.log("jsonData : " + jsonData);
			
			//데이터 테이블 생성
// 			let data = new google.visualization.DataTable(jsonData);
			let data = new google.visualization.DataTable(jsonData2);
		
			//차트를 출력할 div 서택
 			let chart = new google.visualization.LineChart(document.getElementById("chart_div2"));
			
			chart.draw(data,{
				title:"나다 이씹새끼야",
// 				curveType:"function", 넣으면 뾰족뾰족 뺴면 둥글둥글 -- LineChart
				width:600,
				height:450
				
			});
		
		}
		
		function drawChart3(){
			let jsonData2 = $.ajax({
				url:"/chart/chart02",
				dataType : "json",
				async:false
			}).responseText;
			
 			console.log("jsonData2 : " + jsonData2);
			
			//데이터 테이블 생성
// 			let data = new google.visualization.DataTable(jsonData);
			let data = new google.visualization.DataTable(jsonData2);
		
			//차트를 출력할 div 서택
 			let chart = new google.visualization.LineChart(document.getElementById("chart_div3"));
			
			chart.draw(data,{
				title:"상품 별 매출금액",
 				curveType:"function", //넣으면 뾰족뾰족 뺴면 둥글둥글 -- LineChart
				width:600,
				height:450
				
			});
		
		}
	});
</script>

<div id="chart_div">
	
</div>
<div id="chart_div2">
	
</div>
<div id="chart_div3">
	
</div>