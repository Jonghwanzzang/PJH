<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="card">
	<div class="card-header">
		<h3 class="card-title">DataTable with default features</h3>
	</div>

	<div class="card-body">
		<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row">
				<div class="col-sm-12 col-md-6">
				</div>
				<div class="col-sm-12 col-md-6">
					<div id="example1_filter" class="dataTables_filter">
						<label>Search:<input type="search"
							class="form-control form-control-sm" placeholder=""
							aria-controls="example1"></label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table id="example1"
						class="table table-bordered table-striped dataTable dtr-inline"
						aria-describedby="example1_info">
						<thead>
							<tr>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="example1" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="BookId: activate to sort column descending">BookId</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Title: activate to sort column ascending">Title</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Category: activate to sort column ascending">Category</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Price: activate to sort column ascending">Price
									version</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Insert Date: activate to sort column ascending">Insert Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}" varStatus="stats">
							<c:if test="${list.bookId%2!=0}"><tr class="odd"></c:if>
							<c:if test="${list.bookId%2==0}"><tr class="even"></c:if>
								<td class="dtr-control sorting_1" tabindex="0">${list.bookId}</td>
								<td><a href="/book/detail?bookId=${list.bookId}" >${list.title}</a></td>
								<td> <fmt:formatNumber value="${list.price}" pattern="#,###"/>원 </td>
								<td> <fmt:formatDate value="${list.insertDate}" pattern="yyyy-MM-dd"/></td>
							</tr>
							</c:forEach>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1">BookId</th>
								<th rowspan="1" colspan="1">Title</th>
								<th rowspan="1" colspan="1">Category</th>
								<th rowspan="1" colspan="1">Price</th>
								<th rowspan="1" colspan="1">Insert Date</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-5">
					<div class="dataTables_info" id="example1_info" role="status"
						aria-live="polite">Showing 1 to 10 of 57 entries</div>
				</div>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="example1_paginate">
						<ul class="pagination">
							<li class="paginate_button page-item previous disabled"
								id="example1_previous"><a href="#" aria-controls="example1"
								data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
							<li class="paginate_button page-item active"><a href="#"
								aria-controls="example1" data-dt-idx="1" tabindex="0"
								class="page-link">1</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example1" data-dt-idx="2" tabindex="0"
								class="page-link">2</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example1" data-dt-idx="3" tabindex="0"
								class="page-link">3</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example1" data-dt-idx="4" tabindex="0"
								class="page-link">4</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example1" data-dt-idx="5" tabindex="0"
								class="page-link">5</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example1" data-dt-idx="6" tabindex="0"
								class="page-link">6</a></li>
							<li class="paginate_button page-item next" id="example1_next"><a
								href="#" aria-controls="example1" data-dt-idx="7" tabindex="0"
								class="page-link">Next</a></li>
						</ul>
							<a href="/book/intpage" style="float:right; width:50px;" 
										class="btn btn-block btn-dark btn-sm">등록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
