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
						data-title="${list.title}"
						data-userNO="${list.bookId}"
						data-seq="${attach.seq}"><img  
					    src="/resources/upload${attach.fileName}"
						class="img-fluid mb-2" alt="white sample">
					</a>
				</div>
			</c:forEach>
			</div>
		</div>
		<div>
			<a href="./imginsert" style="float:right; margin-right:9px; margin-bottom:9px;" >이미지 등록</a>
		</div>
	</div>
</div>
<div class="modal fade" id="modal-default" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"></h4>
				<input type="hidden" id="txtUserNo" value=""/>
				<input type="hidden" id="txtSeq" value=""/>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				
			</div>
			<div class="modal-body" >
				<p id="body-content" style="width:100%;"></p>
			</div>
			<div class="modal-footer justify-content-between">
				<div>
				<button type="button"  class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
<!-- 				<button type="button" class="btn btn-primary">Save changes</button> -->
			<div style="float:right;">
			  <span id="spn1">
			  <!-- 일반모드 시작 -->
				<button  type="button" class="btn btn-primary" id="edit" >수정</button>				
				<button  type="button" class="btn btn-danger" id="delete" >삭제</button>				
			  <!-- 일반모드 끝 -->
			  </span>
			  <!-- 수정모드 시작 -->
			  
			  <span id="spn2" style="display:none;">
				<div class="input-group justify-content-between">
					<div class="custom-file" style="float:right;">
						<input type="file" class="custom-file-input" 
								name="uploadFile" id="uploadFile">
						<label class="custom-file-label" for="exampleInputFile">파일을 선택하시오</label>
					</div>
				 <div style="float:right;">
					<button type="button" id="uploadBtn" class="btn btn-success" id="modifybtn" >확인</button>				
					<button type="button" class="btn btn-warning" id="cancel" >취소</button>
				</div>
				</div>
			  </span>
			  <!-- 수정모드 끝 -->
			</div>				
			</div>
		</div>

	</div>
</div>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#edit").on("click",function(){
		var result = confirm("수정 하시겠습니까?");
		if(result == true){
			$("#spn2").css("display","block");
			$("#spn1").css("display","none");
		}else{
			return;
		}
	//취소버튼 누르
	$("#cancel").on("click",function(){
			$("#spn2").css("display","none");
			$("#spn1").css("display","block");
	});
});
	
	//ajax 파일 업로드 구현 시작
	//이미지 체킹 (정규식)
	let regx = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	let maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize){ //확장자, 크기 체킹
		if(fileSize >= maxSize){
			alert("파일 사이즈가 초과되었습니다.");
			return false; // 함수종료
		}
		//fileName : 개똥이(.*?)/.zip (exe|sh|zip|alz)
		// (.*?)있어도 없어도 상관없음 , exe|sh|zip|alz) .뒤에 확장자
		if(regx.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	// e : 클릭 이벤트
	$("#uploadBtn").on("click",function(e){
		//가상의 form 태그 생성<form></form> == let formData = new FormData();
		let formData = new FormData();
		//<input type="file" name="uploadFile" Object로 변경
		let inputFile = $("input[name='uploadFile']");
		// 파일 object에 있는 이미지를 가져와보자
		// .files : 그 안에 들어있는 이미지
		let files = inputFile[0].files;
		
		console.log("files : " + files);
		console.log("files : " + files.length);
		
		//가상의 form인 formData Object에 filedata를 추가해보자
			
		for(let i=0; i<files.length; i++){
			//파일 확장자 체크 ,크기 체크
			if(!checkExtension(files[i].name, files[i].size)){
				//반복문 종료 및 함 수 종료
				return false;
			}
			
			
			//<form><input type="file" name="uploadFile"/></form> 
			formData.append("uploadFile",files[i]);
		};
		
		/* 
			<form>
				<input type="file" name="uploadFile"/>
				<input type="text" name="userNo" value="3"/>
				<input type="text" name="seq" value="5"/>
			</form>
		*/
			formData.append("userNo",$("#txtUserNo").val());
			formData.append("seq",$("#txtSeq").val());
		
  		$.ajax({
  			url : "/gallery/updatePost",
  			processData : false,
  			contentType:false,
  			data : formData,
  			dataType : "json",
  			type: "post",
  			success:function(result){
  				console.log(result.filename);
  				console.log(result);
  				let filename = result.fileName
  				alert("이미지 변경 성공!");
  				location.href="/gallery/list?bookId=${param.bookId}";
  				//$("#body-content img").attr("src","/resources/upload"+result.fileName);
  			}
  		})
  		
  		
	});
	//이미지 미리보기 시작
  	let sel_file = [];
	$("#uploadFile").on("change",handleImgFileSelect);
	//e : onchange 이벤트 객체
	function handleImgFileSelect(e){
		//이벤트가 발생 된 타겟 안에 들어있는 이미지 파일들을 가져와보자
		let files = e.target.files;
		console.log("fileszz : " + files);
		console.log("fileszz : ");
		//이미지가 여러개가 있을 수 있으므로 이미지들을 각각 분리해서 배열로 만듦
		let fileArr = Array.prototype.slice.call(files);
		
		//파일 타입의 배열 반복. f: 배열 안에 들어있는 각각의 이미지 파일 객체
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				// 함수종료
				return;
			}
			//이미지 객체를 전역 배열타입 변수에 넣자
			sel_file.push(f);
			//이미지 객체를 읽을 자바스크립트의 reader 객체 생성
			let reader = new FileReader();
			// e: reader가 이미지 객체를 읽는 이벤트
			reader.onload = function(e){
				let img_html = "<img style='width:100%; height:100%;' src=\"" + e.target.result + "\" />";
				// p사이에 이미지가 랜더링되어 화면에 보임
				//객체.appen : 누적, html : 새로고침, innerHTML : J/S
				$("#body-content").html(img_html);
			}
			// f: 이미지 파일 객체를 읽은 후 다음 이미지 파일(f)를 위해 초기화 함
			reader.readAsDataURL(f);
		});// end for
	}
  		
  		//이미지 미리보기 끝
	
	
	
	
	
	//data-id="........."
	$(".btn-modal").click(function(){
		let data = $(this).data("id");
		let title= $(this).data("title");
		
		//userId랑 seq는 Attach 테이블의 복합키(composite key)로써의 기본키(primary key, 식별키)
		let userNo = $(this).data("userno");
		console.log("userNo : " + userNo);
		let seq= $(this).data("seq");
		$("#txtUserNo").val(userNo);
		$("#txtSeq").val(seq);
		
	$("#body-content").html("<img style='width:100%; height:100%;' src='"+data+"'/>");
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
	
	$("#delete").on("click",function(){
		let userNo = $("#txtUserNo").val();
		let seq= $("#txtSeq").val();
		console.log("userNo" , userNo);
		console.log("seq" , seq);
		
		
		let data = {
				"userNo" :userNo,
				"seq" : seq
		};
		console.log("data : " +data);
		
		//contentType : 보내는 타입
		// dataType : 받는 타입
		$.ajax({
			url : "/gallery/deletePost",
			contentType : 'application/json;charset=utf-8',
			data :JSON.stringify(data) ,
			dataType : "text",
			type : "post",
			success : function(result){
				if(result ==1 ){
					alert("성공");
					location.href="/gallery/list?bookId=${param.bookId}";
				}else{
					alert("실패");
				}
				//result가 0 보다 크면 성공 , 아니면 실패
				//성공 시 : /gallery/list?bookId=3 
				//실패시 메시지 alert
			}
		});
	});
	
});


</script>