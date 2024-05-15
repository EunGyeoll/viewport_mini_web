<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Admin</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">관리자 페이지</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin">대시보드</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">사용자 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/products">상품 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/shippings">배송 관리</a></li>
						<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/orders">주문 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/notices">공지사항 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/styles">스타일 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">홈으로 돌아가기</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="card">
		<div class="d-flex justify-content-end me-5 mt-3 justify-content-sm-between">
			<h2 class="ms-4">사용자 관리</h2>

			<div>
				<input type="text" />
				<button>검색</button>
			</div>

		</div>
		<table class="table table-hover text-center align-middle" id="user-table">
			<thead>
				<tr>
					<th scope="col">주문번호#</th>
					<th scope="col">주문자</th>
					<th scope="col">주문 주소</th>
					<th scope="col">주문 상태</th>
					<th scope="col">주문 날짜</th>
					<th scope="col"><button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#createUserModal">유저 생성</button></th>

				</tr>
			</thead>
			<tbody id="user-table-body">
				<c:forEach var="order" items="${orderList}">
					<tr>
						<th scope="row">${order.oid}</th>
						<td>${order.oname}</td>
						<td>${order.oaddress}</td>
						<td>${order.ostatus}</td>
						<td><fmt:formatDate value="${order.odate}" pattern="yyyy-MM-dd" /></td>
						<td>
							<button type="button" class="btn btn-dark edit-btn btn-sm orderStatusEditBtn" onclick="clickEvent('${user.usid}','${user.uemail}','${user.uname}','${user.uphonenumber}','${user.uaddress}','${user.uaddressdetail}','${user.ugender}','${user.urole}')" data-bs-toggle="modal" data-bs-target="#editUserModal">주문 상태 변경</button>
							<button class="btn btn-danger edit-btn btn-sm" data-bs-toggle="modal" onclick="deleteUserData(${order.oid})" data-bs-target="#deleteUserModal">주문 준비 완료</button>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<nav aria-label="..." class="d-flex justify-content-center me-5">
			<ul class="pagination">
				<c:if test="${pager.groupNo>1 }">
					<li class="page-item"><a class="page-link" href="orders?pageNo=${pager.startPageNo-1 }">Previous</a></li>
				</c:if>
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo }">
					<c:if test="${pager.pageNo!=i }">
						<li class="page-item"><a class="page-link" href="orders?pageNo=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pager.pageNo ==i }">
						<li class="page-item ative"><a class="page-link" href="orders?pageNo=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<li class="page-item"><a class="page-link" href="orders?pageNo=${pager.endPageNo+1}">Next</a></li>
				</c:if>

			</ul>
		</nav>

	</section>
	<!-- The Modal -->
	<div class="modal" id="editUserModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">유저 정보</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<form action="editUserData" method="post" class="modal-body" id="userModal">
					<!-- 데이터 출력 -->
					<%-- 	<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="uname">유저 이름</label> 
						<input type="text" id="uname" name="uname" class="form-control form-control-lg"  value="${user.uname}"/> <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="uemail">아이디</label> 
						<input type="text" id="uemail" name="uemail" class="form-control form-control-lg" /> <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="upassword">비밀번호</label> 
						<input type="password" id="upassword" name="upassword" class="form-control form-control-lg" /> <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="uphonenumber">전화번호</label> <input type="text" id="uphonenumber" name="uphonenumber" class="form-control form-control-lg" /> <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="uaddress">주소</label> <input type="text" id="uaddress" name="uaddress" class="form-control form-control-lg" /> <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="uaddressdetail">상세주소</label> <input type="text" id="uaddressdetail" name="uaddressdetail" class="form-control form-control-lg" value="" /> <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="ugender">성별</label> <input type="radio" id="man" name="ugender" value="true" />남자 <input type="radio" id="woman" name="ugender" value="false" />여자 <small id="birthError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="ugender">역할</label> <input type="radio" id="admin" name="urole" value="ROLE_ADMIN" /> 관리자 <input type="radio" id="user" name="urole" value="ROLE_USER" checked /> 유저 <small id="birthError"></small>
					</div>
					<button type="submit" class="btn btn-dark">정보 수정</button>
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button> --%>
				</form>


			</div>
		</div>
	</div>
	<div class="modal" id="createUserModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">유저 생성</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="userForm" method="post" action="createUserData">
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="uname">유저 이름</label> <input type="text" id="uname" name="uname" class="form-control form-control-lg" /> <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="uemail">아이디</label> <input type="text" id="uemail" name="uemail" class="form-control form-control-lg" /> <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="upassword">비밀번호</label> <input type="password" id="upassword" name="upassword" class="form-control form-control-lg" /> <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="uphonenumber">전화번호</label> <input type="text" id="uphonenumber" name="uphonenumber" class="form-control form-control-lg" /> <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="uaddress">주소</label> <input type="text" id="uaddress" name="uaddress" class="form-control form-control-lg" /> <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="uaddressdetail">상세주소</label> <input type="text" id="uaddressdetail" name="uaddressdetail" class="form-control form-control-lg" value="" /> <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="ugender">성별</label> <input type="radio" id="man" name="ugender" value="true" />남자 <input type="radio" id="woman" name="ugender" value="false" />여자 <small id="birthError"></small>
						</div>
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="ugender">역할</label> <input type="radio" id="admin" name="urole" value="ROLE_ADMIN" /> 관리자 <input type="radio" id="user" name="urole" value="ROLE_USER" checked /> 유저 <small id="birthError"></small>
						</div>
						<button type="submit" class="btn btn-dark">생성</button>
						<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
					</form>
					x
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="deleteUserModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">유저 삭제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal footer -->
				<div class="modal-body">
					<p>삭제하시겠습니까?</p>
				</div>
				<form method="post" action="deleteUserData" class="modal-footer" id="delete-model-footer"></form>

			</div>
		</div>
	</div>
	<script src="/viewport_mini_web/resources/js/admin.js"></script>
</body>
</html>
