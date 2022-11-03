<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/validation.js"></script>
<html lang="en"><head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sign Up</title>
    
    <script type="text/javascript">
    $(function(){
    		//이미지 미리보기 시작////////////////////////
    		   let sel_file = [];
    		   
    		   //input type="file" id="productImage" name="productImage" class="form-control"
    		   //multiple
    		   $("#productImage").on("change",handleImgFileSelect);
    		   //파라미터 e : onchange 이벤트 객체
    		   function handleImgFileSelect(e){
    		      //이벤트가 발생된 타겟 안에 이미지 파일들을 가져와보자 
    		      let files = e.target.files;
    		      //이미지가 여러개가 있을 수 있으므로 이미지를 분리하여 배열로 만듦
    		      let fileArr = Array.prototype.slice.call(files);
    		      //파일 타입의 배열 반복. f : 파일 배열 안에 들어있는 각각의 이미지 파일 객체
    		      fileArr.forEach(function(f){
    		         //이미지 파일이 아닌 경우 이미지 미리보기 실패로 처리
    		         if(!f.type.match("image.*")){
    		            alert("이미지 확장자만 가능합니다.");
    		            //함수를 종료
    		            return;
    		         }
    		         //이미지 객체를(f) 전역 배열타입 변수(sel_file)에 넣자
    		         sel_file.push(f);
    		         //이미지 객체를 읽을 자바스크립트의 reader 객체 생성
    		         let reader = new FileReader();
    		         //e : reader가 이미지 객체를 읽는 이벤트
    		         reader.onload = function(e){
    		            //e.target : 이미지 객체
    		            //e.target.result : reader가 이미지를 다 읽은 결과
    		            let img_html = "<img src=\"" + e.target.result + "\"  />";
    		            //div 사이에 이미지가 렌더링되어 화면에 보임
    		            //객체.append : 누적, .html : 새로고침, innerHTML : J/S
    		            $(".imgs_wrap").append(img_html);
    		         }
    		         //f : 이미지 파일 객체를 읽은 후 다음 이미지 파일(f)을 위해 초기화
    		         reader.readAsDataURL(f);
    		      });//end forEach
    		   }
    		   //이미지 미리보기 끝////////////////////////
    		
    	
    	
    	$("#btnIdCheck").on("click",function(){
    		let memId = $("#memId").val(); 
    		console.log("btnIdCheck ",memId);
    		
    		let data = {
    			"memId":memId	
    		};
    		
    		$.ajax({
    			url : "/insertIdCheck" ,
    			contentType : "application/json;charset:utf-8",
    			data : JSON.stringify(data),
    			type : "post", 
    			success:function(result){
    				
    				
    				if(result ==0){
    					alert("사용가능한 아이디 입니다.");
    					$("#inpt").attr("disabled",false);
    				}else{
    					alert("사용 불가능한 아이디 입니다.")
    					$("#inpt").attr("disabled",true);
    					$("#memId").val("");
    					$("#memId").focus();
    					
    				}
    			}
    		});
    	});
    	
    	
    /* $("#memSpecialty").on("blur" , function() {
    	var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
    	var strTelNum = $("#memSpecialty").val(); //"010-111-1111"
		console.log(strTelNum);
    	  if(!regExp.test(strTelNum)) {
    	     alert("형식에 맞춰 입력하십쇼");
    	     $("#memSpecialty").val("");
    	     return;
    	};
    	alert("통과다 이새끼야~");
    	}); */
    });

    
    </script>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form name="frm" action="/insert" class="user" method="post" enctype="multipart/form-data" >
                                <div class="form-group">
                                      <div class="form-group row">
                                        &nbsp;&nbsp;&nbsp;<input style="width:400px" type="text" class="form-control form-control-user" id="memId"name="memId" placeholder="아이디를 입력하세요" >
                                        &nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn btn-primary btn-icon-split btn-sm" style="height:40px">
	                                        <span class="icon text-white-50">
	                                            <i class="fas fa-flag"></i>
	                                        </span>
                                        <span style="height:10px" class="text" id="btnIdCheck" >중복확인&raquo;</span>
                                    	</button>
                                    </div>
                                      <div class="form-group">
                                        <input style="width:400px" type="text" class="form-control form-control-user" id="memName"name="memName" placeholder="이름을 입력하세요" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input style="width:400px" type="text" class="form-control form-control-user" id="memJob"name="memJob" placeholder="직업을 입력하세요" >
                                </div>
                                <div class="form-group">
                                        <input style="width:400px" type="text" class="form-control form-control-user" id="memLike" name="memLike" placeholder="취미를 입력하세요" >
                                </div>
                                     <div class="form-group">
                                        <input style="width:400px" type="text" class="form-control form-control-user" id="memHp" name="memHp" placeholder="핸드폰번호 입력하세요" >
                                    </div>
                                    <div class="mb-3">
									  <label for="formFileMultiple" class="form-label">Multiple files input example</label>
									  <input class="form-control" type="file" id="productImage" name="pictureArray" multiple>
									</div>
                                    <div class="imgs_wrap">
										
									</div>
                                <input class="btn btn-primary btn-user btn-block" onclick="CheckAddMem()" type="button" id="inpt" value="회원가입&raquo;" disabled="disabled"/>
                                <a href="/hwlist" class="btn btn-danger btn-user btn-block">뒤로가기&raquo;</a>
                                <hr>
                            </form>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>



</body></html>