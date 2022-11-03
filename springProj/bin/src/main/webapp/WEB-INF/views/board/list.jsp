<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	   $("[name='show']").on("change",function(){
	      let val = $(this).val();
	      location.href="<%=request.getContextPath()%>/hwlist?currentPage=1&show="+val;
	   });
	});

</script>

<body>
	<!-- ======================================================================================= -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Tables</h1>
		<p class="mb-4">
			DataTables is a third party plugin that is used to generate the demo
			table below. For more information about DataTables, please visit the
			<a target="_blank" href="https://datatables.net">official
				DataTables documentation</a>.
		</p>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">MyTable</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div id="dataTable_wrapper"
						class="dataTables_wrapper dt-bootstrap4">
			<!--form--><form action="/hwlist?keyword=" id="frm" name="frm">
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="dataTables_length" id="dataTable_length">
									<label>Show <select id="show" name="show"
										aria-controls="dataTable"
										class="custom-select custom-select-sm form-control form-control-sm">
										<option value="10" <c:if test='${param.show eq 10 }'>selected</c:if>>10</option>
											<option value="25" <c:if test='${param.show eq 25 }'>selected</c:if>>25</option>
											<option value="50" <c:if test='${param.show eq 50 }'>selected</c:if> >50</option>
											<option value="100" <c:if test='${param.show eq 100 }'>selected</c:if> >100</option></select> entries
									</label>
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div id="dataTable_filter" class="dataTables_filter">
									<label>
										<input type="search" name="keyword"
											class="form-control form-control-sm" placeholder="검색어를 입력하시오"
											aria-controls="dataTable" value="${param.keyword}"/>
									</label>
									<label>
										<button type="submit" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <span class="text">통합검색</span>
                                    	</button>
									</label>
								</div>
							</div>
						</div>
						</form>
						<div class="row">
							<div class="col-sm-12">
								<table class="table table-bordered dataTable" id="dataTable"
									width="100%" cellspacing="0" role="grid"
									aria-describedby="dataTable_info" style="width: 100%;">
									<thead>
										<tr role="row">
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="dataTable" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Name: activate to sort column descending"
												style="width: 57px;">memId</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Position: activate to sort column ascending"
												style="width: 61px;">memName</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 49px;">memHp</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Age: activate to sort column ascending"
												style="width: 31px;">memJob</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Start date: activate to sort column ascending"
												style="width: 68px;">memLike</th>

										</tr>
									</thead>
									<tbody>
										<!-- 
										before => data : List<MemberVO> list / row : Member1VO
								페이징처리 after => data : ArticlePage이므로 data.content를 해야지만 
										List<Member1VO> LIST가 나옴
									 -->
										<c:forEach var="list" items="${list.content}" varStatus="stat">
											<!--stat.count : 행번호(1,2,3,4,5...)  
												stat.index : 인덱스번호(0,1,2,3,4,5....)											
											-->
											
											<c:if test="${stat.count%2==0}">
												<tr class="even" style="background-color:#F0F8FF">
											</c:if>
											<c:if test="${stat.count%2!=0}">
												<tr class="odd">
											</c:if>
												<!-- 가져올 데이터 테이블 -->
												<td>${list.memId}</td>
												<td>${list.memName}</td>
												<td>${list.memHp}</td>
												<td>${list.memJob}</td>
												<td>${list.memLike}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-5">
								<!-- /hwlist 보정해보자 -->
								<c:if test="${param.currentPage==null}">
									<c:set var="currentPage" value="1"/>
								</c:if>
								<c:if test="${param.currentPage!=null}">
									<c:set var="currentPage" value="${param.currentPage}"/>
								</c:if>
								<c:if test="${param.show==null}">
									<c:set var="show" value="10"/>
								</c:if>
								<c:if test="${param.show!=null}">
									<c:set var="show" value="${param.show}"/>
								</c:if>
								
									<!-- 한 화면에 보여지는 행 수 : show -->
									<c:set var="show" value="${show}" />
									<!-- 종료 행 번호 : currentPage * 10행 -->
									<c:set var="endRow" value="${list.currentPage * show}"/>
									<!-- 시작행 번호 : 종료행번호 - (10 -1) -->
									<c:set var="startRow" value="${endRow-(show-1)}" />
									<c:if test="${endRow>list.total}">
										<c:set var="endRow" value="${list.total }"/>
									</c:if>
								<div class="dataTables_info" id="dataTable_info" role="status"
									aria-live="polite">Showing ${startRow} to ${endRow} of ${list.total} enteries</div>
							</div>
							<div class="col-sm-12 col-md-7">
								<div class="dataTables_paginate paging_simple_numbers"
									id="dataTable_paginate">
									<ul class="pagination">
										<li class="paginate_button page-item 
											<c:if test='${list.startPage lt 6}'>disabled</c:if>" id="dataTable_previous">
											<a href="/hwlist?currentPage=${list.startPage-5}&show=${show}" aria-controls="dataTable" data-dt-idx="0" tabindex="0"
												class="page-link">Previous</a>
										</li>
										<c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}">
										<!-- class= .....actiove => 현재 페이지를 파란색으로 보임 -->
											<li class="paginate_button page-item
											<c:if test='${currentPage==pNo }'>active</c:if>">
											<a href="/hwlist?currentPage=${pNo}&show=${show}" aria-controls="dataTable"
												data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a>
											</li>
										</c:forEach>
										<!--  EL 태그 정리
											== : eq(equal)
											!= : ne(not equal)
											<  : lt(less than)
											>  : gt(greater than)
											<= : le(less equal)
											>= : ge(greater equal)
										 -->
										<li class="paginate_button page-item next
										<c:if test='${list.endPage ge list.totalPages}'>disabled</c:if>"
											 id="dataTable_next">
										<a href="/hwlist?currentPage=${list.startPage+5}&show=${show}" aria-controls="dataTable" data-dt-idx="7"
											tabindex="0" class="page-link">Next</a>
											
										</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<div>
										<a href="/hwinsert" class="btn btn-primary btn-icon-split btn-sm">
                                        	<span class="icon text-white-50">
                                            	<i class="fas fa-flag"></i>
                                        	</span>
                                        	<span class="text">회원가입</span>
                                    	</a>
                                    	</div>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- ======================================================================================= -->

</body>
</html>