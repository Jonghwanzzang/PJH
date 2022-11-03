<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>  
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#aSubmit").on("click", function() {
			$("#frm").submit();
		});

		$("#marriged").on("click", function() {
			let chk = $("#marriged").is(":checked");

			if (chk) {
				$("#marriged").val(true);
			} else {
				$("#marriged").val(false);
			}
		});
	});
		//다음 우편번호 검색
$(function(){
   $("#btnZipCode").on("click",function(){
      new daum.Postcode({
         oncomplete:function(data){
            //zipCode
            $("input[name='addressVO.postCode']").val(data.zonecode);   //우편번호5자리
            //addressName
            $("input[name='addressVO.address']").val(data.address);   //주소
            //addressDetail
            $("input[name='addressVO.addressDetail']").val(data.buildingName);   //상세 주소
         }
      }).open();
   });
});
</script>
<div class="card shadow mb-4">
	<!-- Card Header - Accordion -->
	<a href="#collapseCardExample" class="d-block card-header py-3"
		data-toggle="collapse" role="button" aria-expanded="true"
		aria-controls="collapseCardExample">
		<h6 class="m-0 font-weight-bold text-primary">Collapsable
			CardExample</h6>
	</a>
	<!-- Card Content - Collapse -->
	<div class="collapse show" id="collapseCardExample">
		<div class="card-body">
			<form id="frm" action="/register/register05" method="post">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Email
						address</label> <input type="text" class="form-control" id="userId"
						name="userId" placeholder="userId" value="a001" required>
				</div>
				<div class="mb-3">

					<label for="exampleFormControlTextarea1" class="form-label">password</label>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="password" value="1234" required>
					<!-- <textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea> -->
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">coin</label>
					<input type="text" class="form-control" id="coin" name="coin"
						placeholder="coin" value="3000" required>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">birth</label>
					<input type="date" class="form-control" id="birth" name="birth"
						placeholder="birth" value="2022-11-01" required>
				</div>
				<p>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">gender</label>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="gender1"
							name="gender" value="Male"> <label
							class="form-check-label" for="gender1">Male</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="gender2"
							name="gender" value="Female" checked> <label
							class="form-check-label" for="gender2">Female</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="gender3"
							name="gender" value="Other"> <label
							class="form-check-label" for="gender3">Other</label>
					</div>
					</p>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">nationality</label>
					<p>
						<select name="nationality" class="form-select"
							aria-label="Default select example">
							<option selected>Select your nation</option>
							<option value="Korea">한국</option>
							<option value="america">미국</option>
							<option value="australia">호주</option>
						</select>
					</p>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">nationality</label>
					<p>
						<select name="cars" class="form-select" multiple
							aria-label="multiple select example">
							<option selected>Select your cars</option>
							<option value="k5">k5</option>
							<option value="qm6">qm6</option>
							<option value="grandure">grandure</option>
						</select>
					</p>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">hobby</label>
					<p>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="hobbyList"
							id="hobbylist1" value="football"> <label
							class="form-check-label" for="hobbylist1">football</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="hobbyList"
							id="hobbylist2" value="movie"> <label
							class="form-check-label" for="hobbylist2">movie</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="hobbyList"
							id="hobbylist3" value="drama" disabled> <label
							class="form-check-label" for="hobbylist3">drama
							(disabled)</label>
					</div>
					</p>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">marriaged</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input"
						type="checkbox" id="marriged" name="marriaged" value="false"
						aria-label="...">
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">marriaged</label>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">address</label>
						<div class="p-5">
							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
								<!-- @ModelAttribute MemberVO memberVO -->
									<input type="text" class="form-control form-control-user"
										name="addressVO.postCode" id="addressVO.postCode" placeholder="postCode">
									</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
										<a href="#" id="btnZipCode" class="btn btn-info btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-info-circle"></i>
                                        </span>
                                        <span class="text">Search For PostCode</span>
                                    </a>
								</div>
							</div>
							<div class="form-group">
								<input type="email" class="form-control form-control-user"
									name="addressVO.address" id="address" placeholder="address">
							</div>
							<div class="form-group">
								<input type="email" class="form-control form-control-user"
									name="addressVO.addressDetail" id="addressDetail"
									placeholder="addressDetail">
							</div>
							<div class="mb-3">
				           <label for="exampleFormControlInput1" class="form-label">Cards</label>
				           <div class="col-lg-6">
                    <div class="card mb-4 py-3 border-left-primary">
                        <div class="card-body">
                                     번호 : <input type="text" class="form-control form-control-user" 
                                 name="cardVOList[0].no" id="no1" placeholder="no" />
                                     유효년월 : <input type="date" class="form-control form-control-user" 
                                 name="cardVOList[0].validMonth" id="validMonth1" placeholder="validMonth" />
                        </div>
                    </div>
                    <div class="card mb-4 py-3 border-left-primary">
                        <div class="card-body">
                                     번호 : <input type="text" class="form-control form-control-user" 
                                 name="cardVOList[1].no" id="no1" placeholder="no" />
                                     유효년월 : <input type="date" class="form-control form-control-user" 
                                 name="cardVOList[1].validMonth" id="validMonth1" placeholder="validMonth" />
                        </div>
                    </div>
              </div>
         </div>
						</div>
					</div>
				</div>
				<div class="mb-3">
					<a href="#" id="aSubmit" class="btn btn-primary btn-icon-split">
						<span class="icon text-white-50"> <i class="fas fa-flag"></i>
					</span> <span class="text">요청 파라미터Go</span>
					</a>
				</div>
			</form>
		</div>
	</div>
</div>