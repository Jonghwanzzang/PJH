<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<%-- <input type="hidden" id="projBdId0" name="projBdId0" value="${param.projBdId}" /> --%>
<input type="hidden" id="writer0" name="writer0" value="<sec:authentication property='principal.member.memCode'/>" />
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">

<!DOCTYPE html>
<!-- BEGIN: Head-->
<head>

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<!-- END: Page CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body>

	<!-- BEGIN: Content-->
	<div class="content-wrapper">
		<!-- 		<div class="content-header row justify-content-md-center" style="text-align:center;"> -->
		<!-- 			<div class="content-header-left col-md-6 col-12 mb-2"> -->
		<!-- 				<h3 class="content-header-title mb-0">FREE BOARD DETAIL</h3> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<div class="content-body">
			<!-- App invoice wrapper -->
			<section class="app-invoice-wrapper">
				<div class="row justify-content-md-center">
					<div style="width: 1200px;">
						<!-- using a bootstrap card -->
							<div class="card">
								<!-- card body -->
								<div class="card-body p-2">
									<!-- card-header -->
									<div class="card-header px-0">
										<div class="row">
											<div class="col-md-12 col-lg-7 col-xl-4 mb-50">
												<span class="invoice-id font-weight-bold">No. </span> <span>${data.projBdId}</span>
												<input type="hidden" class="form-control" id="projBdId" name="projBdId" value="${data.projBdId}">
											</div>
											<div class="col-md-12 col-lg-5 col-xl-8">
												<div
													class="d-flex align-items-center justify-content-end justify-content-xs-start">
													<div class="issue-date pr-2">
														<span><fmt:formatDate value="${data.projBdWriteDate}" pattern="yyyy-MM-dd" /></span>
														<input type="hidden" class="form-control" id="projBdWriteDate" name="projBdWriteDate"
															value="${data.projBdWriteDate}">
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="invoice-logo-title row py-2">
										<div
											class="col-6 d-flex flex-column justify-content-center align-items-start">
											<h2 class="text-primary"
												style="font-family: 'MICEGothic Bold';">${data.projBdTitle}</h2>
											<input type="hidden" class="form-control" id="projBdTitle" name="projBdTitle" value="${data.projBdTitle}">
											<span>?????????: ${data.writer}</span>
											<input type="hidden" class="form-control" id="writer" name="writer" value="${data.writer}">
										</div>
									</div>
									<hr>

									<!-- ??? ?????? -->
									<div class="row invoice-adress-info py-2">
										<div class="col-6 mt-1 from-info">
											${data.projBdCts}
											<input type="hidden" class="form-control" id="projBdCts" name="projBdCts" value="${data.projBdCts}">
										</div>
									</div>
									<hr>
<!-- 								<div class="form-group" id="itgrnAttachFileNum"> -->
<!-- 									<label for="itgrnAttachFileNum"><i -->
<!-- 										class="feather icon-link"></i>????????????:</label><br> -->

<!-- 									</label> -->
<!-- 								</div> -->
								<div style="float: right;">
										<c:if test="${memCheck eq 'true' }">
											<button type="button" class="btn btn-danger" id="freeDel">
												<i class="feather icon-trash-2 mr-25 common-size"></i>??????
											</button>
											<a href="/proj/${projId}/freeBoardUpdate?projBdId=${data.projBdId}" class="btn btn-warning">
												<i class="feather icon-edit mr-25 common-size"></i>??????</a> 
										</c:if>
										<a href="/proj/${projId}/freeboard" class="btn btn-secondary"><i
											class="fa fa-reply-all mr-25 common-size"></i>??????</a>
									</div>
								</div>
							</div>
						<input type="hidden" class="form-control" id="projId" name="projId" value="${data.projId}">
						<input type="hidden" class="form-control" id="deleteYn" name="deleteYn" value="${data.deleteYn}">
					</div>
					<!-- ---------------------- ?????? ?????? ??? ------------------------------ -->					
					<div class="card mb-2" style="width: 1200px; height: auto;" id="inputCmt">
						<div class="card-body">
							<div>
								<form class="form-horizontal">
									<div class="row">
										<div class='col-sm-10'>
											<input type="text" class="form-control" id="projBdCmtCts" name="projBdCmtCts"
												placeholder="????????? ???????????????." />
										</div>
										<div class='col-sm-2'>
											<button type="button" class="btn btn-secondary"
												style="width: 150px;" id="freeCmtAdd">??????
												??????</button>
										</div>
									</div>
<%-- 									<input type="hidden" class="form-control" id="projBdCmtId" name="projBdCmtId" value="${freeboardCmtVO.projBdCmtId}"> --%>
									<input type="hidden" class="form-control" id="writerCmt" name="writer" value="${freeboardCmtVO.writer}">
									<input type="hidden" class="form-control" id="deleteYnCmt" name="deleteYn" value="${freeboardCmtVO.deleteYn}">
								</form>
							</div>
						</div>
					</div>
					<!-- ---------------------- ?????? ?????? ??? ------------------------------ -->
					<div
						class="card mb-2 card border-top-info border-top-2 box-shadow-0"
						style="width: 1200px; height: auto;">
						<div class="card-header"
							style="padding: 13px; color: #455A64; font-size: 15px;">
							Comments&nbsp;<i class="fa fa-comment fa"></i>
						</div>
						<div class="card-body" id="cmtList">
								<div class="user-block">
									<c:forEach var="freeboardCmtVO" items="${dataCmt}" varStatus="stat">	
									<div>
									<form class="form-horizontal">
										<div style="padding-bottom: 5px;">
											 <div style='font-size:15px; color: #02b5b8;'><i class='fa fa-user-o'></i>&nbsp;&nbsp;${freeboardCmtVO.writer}</div>
											 <span class="username">
											 <span style="font-size: 8px; color: grey;"><fmt:formatDate value="${freeboardCmtVO.projBdCmtWriteDate}" pattern="yyyy-MM-dd HH:mm" /></span>
												<span id="fnEdit${stat.index}">
												<!-- ???????????? ????????? ?????? ???????????? ???????????? ??????,?????? ?????? ????????? -->
												<c:if test="${freeboardCmtVO.memCode eq mvo.member.memCode}">
<!-- 													<a style='font-size: 12px; text-decoration: underline;'  -->
<!-- 														onclick='fn_reCmt()' type='button' >????????????</a> -->
													<a style="color : red; font-size: 12px; text-decoration: underline;" 
														onclick="fn_update('${freeboardCmtVO.projBdCmtId}','${stat.index}')" type="button" id="cmtModify">??????</a>
													<a style="color : grey; font-size: 12px; text-decoration: underline;" 
														onclick="fn_delete(${freeboardCmtVO.projBdCmtId})" type="button" id="cmtDelete">??????</a>
												</c:if>
												</span>
												<span id="fnSave${stat.index}" style="display:none;">
													<a onclick="fn_updateGo(${freeboardCmtVO.projBdCmtId}, '${stat.index}')" style=" text-decoration: underline; width:33px; float:right;">??????</a>
													<a href="/proj/${projId}/freeBoardDetail?projBdId=${param.projBdId}" style="text-decoration: underline; width:33px; float:right;">??????</a>
												</span>
											</span> <span class="description"></span>
										</div>
										<div id="cmtCts">
											<span id="span${stat.index}">${freeboardCmtVO.projBdCmtCts}</span>
											<input type="text" id="projBdCmtCts${stat.index}" name="projBdCmtCts" value="${freeboardCmtVO.projBdCmtCts}" 
												style="display:none; width:500px; height:35px;" />
										</div>
										<br>
										<hr>
										<input type="hidden" class="form-control" id="projBdCmtId" name="projBdCmtId" value="${freeboardCmtVO.projBdCmtId}">
										<input type="hidden" id="writer" name="writer" value="<sec:authentication property='principal.member.memCode'/>" />
									</form>
									</div>
									</c:forEach>
								</div>
						</div>
					</div>

				</div>
			</section>
		</div>
	</div>
	<!-- END: Content-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-invoice.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>

<script type="text/javascript">

	var mine = "${mvo.member.memCode}";

	$(function() {
		
		// ??? ?????? ?????? ??????
		$("#freeDel").on("click", function() {
			
			let projBdId = $("#projBdId").val(); // ??? ?????? ?????????
			
			let data = {"projBdId":projBdId};		// ?????????~
			
			console.log("data: " + JSON.stringify(data));
			
			// ?????????
			$.ajax({
				url:"/proj/${projId}/freeBoardDelete",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				dataType:"json",
				type:"post",
		   		beforeSend : function(xhr) {   // ????????? ?????? ??? ????????? csrf??? ??????
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(result) {
					
					console.log("result: " + JSON.stringify(result));
					
					let str = result.result;
					
					console.log("str : " + str);
					
					// result??? 0?????? ?????? ??????, ????????? ??????
					if(str > 0) {
						alert("?????? ?????????????????????.");
						location.href="/proj/${projId}/freeboard";
					} else {
						alert("?????? ??????. ?????? ??????????????????.");
					}
				}
			})	// ajax end
		});

		// ?????? ??????
		$("#freeCmtAdd").on("click",function() {
			
// 			alert("?????? ?????? ??????");
			
			let projBdId = $("#projBdId").val();						// ????????? ??????
 			let writerCmt = $("#writer0").val();						// ?????? ?????????
 			let projBdCmtCts = $("#projBdCmtCts").val();				// ?????? ??????
 			//let projBdCmtId = $("#projBdCmtId").val();					// ?????? ??????
 			//let projBdCmtWriteDate = $("#projBdCmtWriteDate").val();	// ?????? ?????????
 			
			console.log("projBdId: " + projBdId);
			console.log("writerCmt: " + writerCmt);
			console.log("projBdCmtCts: " + projBdCmtCts);
// 			console.log("projBdCmtId: " + projBdCmtId);
// 			console.log("projBdCmtWriteDate: " + projBdCmtWriteDate);

			let data = {"projBdId":projBdId,"writerCmt":writerCmt,"projBdCmtCts":projBdCmtCts};	
			
			$.ajax({
				url:"/proj/${projId}/insertFreeCmt",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				dataType:"json",
				type:"post",
		   		beforeSend : function(xhr) {   // ????????? ?????? ??? ????????? csrf??? ??????
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(result) {
					console.log("result : " + result);
					
					alert("?????? ?????? ??????!");

				//	location.href="/proj/freeBoardDetail?projBdId="+${freeboardVO.projBdId};
					location.reload();
				},
				error:function(request,status,error){
                    alert("?????? ?????? ??????. ?????? ??????????????????.");
                }
			});	// ajax end
			
			$("#projBdCmtCts").val("");
		});
		
	});
	
	
	// ?????? ?????? -----------------------------------
	
	function fn_delete(param){
		
// 		alert("?????? ?????????");
		
		console.log("this: ",param);
		
		let projBdCmtId = $("#projBdCmtId").val(); // ?????? ??????

		let data = {"projBdCmtId":projBdCmtId};
		
		console.log("data: " + JSON.stringify(data));
		
		// ?????????
		$.ajax({
			url:"/proj/${projId}/deleteFreeCmt",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			beforeSend : function(xhr) {   // ????????? ?????? ??? ????????? csrf??? ??????
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			
			console.log("result: " + JSON.stringify(result));
			
			// result??? 0?????? ?????? ??????, ????????? ??????
			if(result > 0) {
				alert("????????? ?????????????????????.");
				location.reload();
			} else {
				alert("?????? ??????. ?????? ??????????????????.");
			}
		}
		}); // ajax end
		
	}; // ?????? ?????? end
	
	
	// ?????? ?????? -----------------------------------
	
	// ?????? ??? ??????
	function fn_update(param, idx) {

 		let data = {"projBdCmtId":param, "idx":idx};

		console.log("data: " + JSON.stringify(data));
		
		$("#projBdCmtCts"+idx).css("display","block");
		$("#fnSave"+idx).css("display","block");
		$("#span"+idx).css("display","none");
		$("#fnEdit"+idx).css("display","none");
		
	}
	
	// ?????? ??????
	function fn_updateGo(param, idx) {
		
	//	alert("????????????");
		
		let projBdCmtCts = $("#projBdCmtCts"+idx).val();	
		let projBdCmtId = param;

		let data = {"projBdCmtId":projBdCmtId,"projBdCmtCts":projBdCmtCts};
		
		console.log("data: " + JSON.stringify(data));
		
		$.ajax({
			url:"/proj/${projId}/updateFreeCmt",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
	   		beforeSend : function(xhr) {   // ????????? ?????? ??? ????????? csrf??? ??????
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result) {
				console.log("result : " + result);
				
				if(result > 0) {
					alert("????????? ?????????????????????.");
					location.reload();
				} else {
					alert("?????? ??????. ?????? ??????????????????.");
				}
			},

		});	// ajax end
	}
	
// 	function fn_reCmt(){
// 		alert = "?????? ??????";
// 	}


</script>


