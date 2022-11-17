<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<section class="content">
	<div class="row">
		<div class="col-md-6">
			<div class="card card-primary">
				<div class="card-header">
					<h3 class="card-title">도서 정보</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body" style="display: block;">
					<div class="form-group">
						<div style="clear: both;">
							<label for="inputName">제목</label>
						</div>
						<div style="width: 70%; float: left;">
							<input type="text" id="title" name="title" class="form-control" />
						</div>
						<div style="width: 30%; float: right;">
							<button data-toggle="modal" data-target="#modal-lg"
								class="btn btn-outline-secondary btn-block btn-flat">
								<i class="fa fa-book"></i>책 검색
							</button>
						</div>
					</div>
					<div class="form-group">
						<label for="inputStatus">카테고리</label> <select id="category"
							name="category" class="form-control custom-select">
							<option value="a0101" selected>소설</option>
							<option value="a0102">에쎄이</option>
							<option value="a0103">어린이</option>
							<option value="a0104">요리</option>
							<option value="a0105">수험서</option>
							<option value="a0106">자격증</option>
						</select>
					</div>
					<div class="form-group">
						<label for="price">가격</label> <input type="text" id="price"
							name="price" class="form-control">
					</div>
					<div class="form-group">
						<label for="insertDate">등록일자</label> <input type="text"
							id="insertDate" name="insertDate" class="form-control">
					</div>
					<div class="form-group">
						<label for="content">책 내용</label>
						<textarea id="content" name="content" class="form-control"
							rows="4"></textarea>
					</div>
				</div>

			</div>

		</div>
		<div class="col-md-6">
			<div class="card card-secondary">
				<div class="card-header">
					<h3 class="card-title">이미지 정보</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body" style="display: block;">
					<div class="form-group">
						<label for="inputEstimatedBudget">Estimated budget</label> <input
							type="number" id="inputEstimatedBudget" class="form-control">
					</div>
					<div class="form-group">
						<label for="inputSpentBudget">Total amount spent</label> <input
							type="number" id="inputSpentBudget" class="form-control">
					</div>
					<div class="form-group">
						<label for="inputEstimatedDuration">Estimated project
							duration</label> <input type="number" id="inputEstimatedDuration"
							class="form-control">
					</div>
				</div>

			</div>

		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<a href="#" class="btn btn-secondary">취소</a> <input type="submit"
				value="이미지 등록 완료" class="btn btn-success float-right">
		</div>
	</div>
</section>
<div class="modal fade" id="modal-lg" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">책 검색</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 검색영역 -->
				<div class="row">
					<div class="col-md-8 offset-md-2">
<!-- 						<form action="" method="get"> -->
							<div class="input-group">
								<input id="search" type="search" class="form-control form-control-lg"
									placeholder="Type your keywords here">
								<div class="input-group-append">
									<button type="button" id="searchId" class="btn btn-lg btn-default">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
<!-- 						</form> -->
					</div>
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 결과 시작 -->
				<div class="row mt-3">
					<div class="col-md-10 offset-md-1">
						<div id="listgroup"class="list-group">
							
						</div>
					</div>
				</div>
				<!-- 결과 끝 -->
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	CKEDITOR.replace("content");
		function senddata(item){
// 			let title = $("#titlev").html();
// 			let date = $("#datav").html();
// 			let pricev = $("#pricev").html();
				
			$("#title").val(item.title);
			$("#insertDate").val(item.date);
			$("#price").val(item.pricev);
			console.log("item이다 : " , item )
			alert("hi~");
		}
	
	$(function(){
		{qweqwewqe:wqeqwewqewq}
		
		$("#searchId").on("click",function(){
			let search = $("#search").val();
			let title = {
							"title":search
					 	};
			alert(title);
			/* <h3 id="booktitle">Lorem ipsum dolor sit amet</h3>
			<p id="rcimg" */
		$.ajax({
				url : "/gallery/searchBook" ,
				contentType: 'application/json; charset=utf-8',
				data : title, 
				dataType : "json" , 
				type : "get",
				success : function(result){
					//console.log(JSON.stringify(result[0].attachVOList[0].userNo));
					
					$.each(result,function(index,item){
						console.log(item);
						let dt = new Date(item.insertDate);
						let dtYY = dt.getFullYear();
						let dtMM = dt.getMonth();
						let dtDD = dt.getDate();
						let dtHH = dt.getHours();
						let dtMI = dt.getMinutes();
						let dtresult = dtYY + "-" + dtMM + "-" + dtDD + "-" + dtHH + "-" + dtMI ; 
						let cont = item.content;
						
						let volist = item.attachVOList;
						let filename = "/noimage.jpg";
						if(volist.length >0){
							console.log("attachVOList : " + item.attachVOList);
							$.each(volist,function(index,item){
								//책 이미지가 1이상이면 이미지 경로를 변수에 대입
								filename = item.fileName;
							});
						}
						
						console.log("filename : "  + filename)
						
						
						let content = "";

						
						content +="<div class='list-group-item' onclick='senddata("+JSON.stringify(item)+")'>";
// 						content +=" <img class='img-fluid' src='/resources/upload/"+item.attachVOList[index].filename+"'";
						content +=" <img class='img-fluid' src='/resources/upload"+filename+"'>";
						content +="	<div class='row' >";
						content +="		<div class='col px-4'>";
						content +="			<div>";
						content +="				<div> class='float-right' id='datav'>"+dtresult+"</div>";
						content +="				<div>제목 :<h3 id='titlev' >"+item.title+"</h3></div>";
						content +="				<div>내용 :<p class='mb-0'>"+cont.substring(0.50)+"</p></div>";
						content +="				<div>금액 :<p class='mb-0' id='pricev'>"+item.price+"</p></div>";
						content +="			</div>";
						content +="		</div>";
						content +="	</div>";
						content +="</div>";
						// 뺵틱 `` 사용하셈
						// jsp 에선 el 과  $(달러)를 같이사용하기 떄문에 식별성을 위해 앞에 역슬러시 형태로 사용 -->\${}
						$("#listgroup").append(content);
					});
				}
			});
		});
	
	
	});
	
	
	
	/*모달띄우는방법
	1. button으로 띄우기
	<button type="button" calss="btn btn-default"
	data-toggle="modal" data-target="#modal-lg">
	누르셈</button 
		
	2. a 태그로 띄우기
	<a data-toggle="modal" href="#modal-lg">오픈 모달</a>
	
	3. 기타 요소로 띄우기
	<p data-toggle="modal" data-target="modal-lg">오픈 모달</p>
	
	 */

	   
</script>
