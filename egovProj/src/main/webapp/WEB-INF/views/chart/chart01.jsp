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
		
		function drawChart(){
			let jsonData = $.ajax({
				url:"/resources/json/sampleData.json",
				dataType : "json",
				async:false
			}).responseText;
			
			console.log("jsonData : " + jsonData);
			
			//데이터 테이블 생성
			let data = new google.visualization.DataTable(jsonData);
		
			//차트를 출력할 div 서택
			//let chart = new google.visualization.PieChart(document.getElementById("chart_div"));
 			let chart = new google.visualization.LineChart(document.getElementById("chart_div"));
//  			let chart = new google.visualization.ColunmChart(document.getElementById("chart_div"));
			//차트객체(chart).draw(데이터테이블(data),옵션)
			
			chart.draw(data,{
				title:"나다 이씹새끼야",
// 				curveType:"function", 넣으면 뾰족뾰족 뺴면 둥글둥글 -- LineChart
				width:600,
				height:450
				
			});
		
		}
	});
</script>

<div id="chart_div">
	
</div>