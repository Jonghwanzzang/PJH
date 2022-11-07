<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var i= 1;
function fn_chk(){
	alert("하이");
	
	 let userPw = document.getElementById("userPw").value;
	let userPwCheck = document.getElementById("userPwCheck").value;
	//비밀번호가 다를 때 보여주는 멘트
	let spanPwCheck = document.getElementById("spanPwCheck");
	console.log("userPw : " + userPw + " userPwCheck : " + userPwCheck);
	
	if(userPw != userPwCheck){
		spanPwCheck.innerHTML = "비밀번호가 다릅니다.";
		return false;
	}
	return true; 
	
}	
$(function(){
	
	
	
	
	$("#plus").click(function() { // 첨부파일 div 추가
	    i++; // 함수 내 하단에 증가문 설정
		if(i > 6){
			return;
		}
	    
	  	$(".list").append("<input path='attachVOList["+ i +"].filename' class='form-control form-control-user'  placeholder='첨부파일 명'/>");
		
	    

 	console.log(i);
	  });
	
	
 	$("#minus").click(function() { // 첨부파일 div 삭제
 		if(i <= 1){
			return;
		}
	    i--; // 함수 내 하단에 증가문 설정
		let list = $(".list");
 		list.children(i).eq(i).remove();
 		
 	console.log(i);

	  });
});

</script>

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
                         <!-- modelattribute >> memVO에 매핑시킨다. -->
                        <form:form modelAttribute="memVO" class="user" method="post" action="/previews/writePost" onsubmit="return fn_chk()">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <!-- input type="text" -- > form:input -->
                                    <!-- path="userId"  memVO에 변수와 매핑됨 -->
                                    <form:input class="form-control form-control-user" path="userId"  placeholder="userId"/>
                                    <font color="red">
                                    <!-- form input 태그에 path 네임과 form:errors의 path 와 매핑 -->
                                    	<form:errors path="userId" />
                                    </font>
                                </div>
                                <div class="col-sm-6">
                                    <form:input class="form-control form-control-user" path="userName" placeholder="userName"/>
                                    <font color="red">
                                    <!-- form input 태그에 path 네임과 form:errors의 path 와 매핑 -->
                                    	<form:errors path="userName" />
                                    </font>
                                </div>
                            </div>
                            <div class="form-group">
                                <form:input path="userEmail" class="form-control form-control-user"  placeholder="userEmail"/>
                                <font color="red">
                                    <!-- form input 태그에 path 네임과 form:errors의 path 와 매핑 -->
                                    	<form:errors path="userEmail" />
                                    </font>
                            </div>
                            <div class="form-group">
                                <form:input path="updDate" class="form-control form-control-user"  placeholder="변경일자(yyyyMMdd)"/>
                                <font color="red">
                                    <!-- form input 태그에 path 네임과 form:errors의 path 와 매핑 -->
                                    	<form:errors path="updDate" />
                                    </font>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <!-- input type=password  ==> form:passwrod 동일 함 -->
                                    
                                    <form:password path="userPw" class="form-control form-control-user" placeholder="userPw"/>
                                    <font color="red">
                                    <!-- form input 태그에 path 네임과 form:errors의 path 와 매핑 -->
                                    	<form:errors path="userPw" />
                                    </font>
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" id="userPwCheck" placeholder="userPwCheck"/>
                                    <font color="red"><span id="spanPwCheck"></span>
                                    </font>
                                </div>
                            </div>
	                                 <a href="#" id="plus" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-check"></i>
                                    </a>
	                             <!-- 첨부파일 삭제 -->
                                    <a href="#" id="minus" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </a>
                            <div id="file">
                         		<div class="list">
                                	<form:input name="list" path="attachVOList[0].filename" class="form-control form-control-user"  placeholder="첨부파일 명"/>
                                 </div>
                                <font color="red">
                                    	<form:errors path="attachVOList[0].filename" />
                                    <!-- form input 태그에 path 네임과 form:errors의 path 와 매핑 -->
                                    </font>
                                  <!-- 첨부파일 추가 -->
                            	 
                                    </div>
                                    
                            <input type="submit" class="btn btn-primary btn-user btn-block" value="Register Account"/>
                             <div class="form-group">
                             <!-- 
                             	attachVOList : List<AttachVO>
                             	attachVOList[0] : AttachVO
                              -->
                            </div>
                            
                            <hr />
                        </form:form>
                        <p /><p /><p /><p /><p /><p /><br /><br /><br /><br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>