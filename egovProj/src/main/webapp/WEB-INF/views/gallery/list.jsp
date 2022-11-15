<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-12">
	<div class="card card-primary">
	<div class="card-header">
		<!--도서 선택 시작 -->
		<select class="custom-select" id="sel">
			<!-- ajax를 통해  append -->
		</select>
	</div>
	<!-- 도서 선택 끝~ㅎㅎ -->
		<div class="card-body">
			<div class="row">
			 <c:forEach var="attach" items="${attach}" >
				<div class="col-sm-2">
					<!-- 모달 띄우는 방법
					1. button으로 띄우기
					<button type="button" calss="btn btn-default"
					data-toggle="modal" data-target="#modal-default">
					누르셈</button 
						
					2. a 태그로 띄우기
					<a data-toggle="modal" href="#modal-default">오픈 모달</a>
					
					3. 기타 요소로 띄우기
					<p data-toggle="modal" data-targer="modal-default">오픈 모달</p>
					
					 -->
				
					<a  class="btn btn-modal" 
						data-toggle="modal" 
						href="#modal-default" 
						data-id="/resources/upload${attach.fileName}"
						data-title="${list.title}">
					    <img src="/resources/upload${attach.fileName}"
						class="img-fluid mb-2" alt="white sample">
					</a>
				</div>
			</c:forEach>
				 <!--<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/000000.png?text=2"
						data-toggle="lightbox" data-title="sample 2 - black"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/000000?text=2"
						class="img-fluid mb-2" alt="black sample">
					</a>
				</div> 
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/FF0000/FFFFFF.png?text=3"
						data-toggle="lightbox" data-title="sample 3 - red"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/FF0000/FFFFFF?text=3"
						class="img-fluid mb-2" alt="red sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/FF0000/FFFFFF.png?text=4"
						data-toggle="lightbox" data-title="sample 4 - red"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/FF0000/FFFFFF?text=4"
						class="img-fluid mb-2" alt="red sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/000000.png?text=5"
						data-toggle="lightbox" data-title="sample 5 - black"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/000000?text=5"
						class="img-fluid mb-2" alt="black sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/FFFFFF.png?text=6"
						data-toggle="lightbox" data-title="sample 6 - white"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/FFFFFF?text=6"
						class="img-fluid mb-2" alt="white sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/FFFFFF.png?text=7"
						data-toggle="lightbox" data-title="sample 7 - white"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/FFFFFF?text=7"
						class="img-fluid mb-2" alt="white sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/000000.png?text=8"
						data-toggle="lightbox" data-title="sample 8 - black"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/000000?text=8"
						class="img-fluid mb-2" alt="black sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/FF0000/FFFFFF.png?text=9"
						data-toggle="lightbox" data-title="sample 9 - red"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/FF0000/FFFFFF?text=9"
						class="img-fluid mb-2" alt="red sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/FFFFFF.png?text=10"
						data-toggle="lightbox" data-title="sample 10 - white"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/FFFFFF?text=10"
						class="img-fluid mb-2" alt="white sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/FFFFFF.png?text=11"
						data-toggle="lightbox" data-title="sample 11 - white"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/FFFFFF?text=11"
						class="img-fluid mb-2" alt="white sample">
					</a>
				</div>
				<div class="col-sm-2">
					<a href="https://via.placeholder.com/1200/000000.png?text=12"
						data-toggle="lightbox" data-title="sample 12 - black"
						data-gallery="gallery"> <img
						src="https://via.placeholder.com/300/000000?text=12"
						class="img-fluid mb-2" alt="black sample">
					</a>
				</div> -->
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modal-default" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"></h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<p id="body-content"></p>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<!-- 				<button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>

	</div>
</div>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	//data-id="........."
	$(".btn-modal").click(function(){
		let data = $(this).data("id");
		console.log(data);
	
	let title= $(this).data("title");
	$("#body-content").html("<img src='"+data+"'/>");
	$(".modal-title").text(title);
	
		
	});
	
	let currentBookId = "${param.bookId}";
	let sel = "";
	//도서 목록 가져와서 selectbox에 추가하기
	// 아작났어유 피시다탓어
	//dataType : 응답 데이터 타입(들어올 데이터 타입)
	$.ajax({
		url : "/gallery/bookList" ,
		dataType : "json", 
		type : "get",
		success : function(result){
			//console.log(JSON.stringify(result));
			//item : BookVO
			$.each(result,function(index,item){
				console.log("item.bookId : " + item.bookId);
				console.log("item.title : " + item.title);
				//option항목 추가
				if(item.bookId == currentBookId){
					sel = "selected";
				}else{
					sel = "";
				}
				$("#sel").append("<option value='"+
						item.bookId+"'"+sel+">"+
						item.title+"</option>");
			});
		}
	});
	$("#sel").on("change",function(){
		//선택된 optiob의 value를 가져와보자
		let bookId = $(this).val();
		console.log(bookId);
		
		location.href="/gallery/list?bookId="+bookId;
			
	});
});


</script>