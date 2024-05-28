<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<title>Admin</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">관리자 페이지</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
					aria-controls="navbarNavDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin">대시보드</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin/users">사용자 관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin/products">상품
								관리</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="${pageContext.request.contextPath}/admin/shippings">배송
								관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin/notices">공지사항
								관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin/styles">스타일 관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/">홈으로 돌아가기</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="card">
		<div
			class="d-flex justify-content-end me-5 mt-3 justify-content-sm-between">
			<h2 class="ms-4">배송 관리</h2>

			<div>
				<input type="text" />
				<button>검색</button>
			</div>

		</div>
		<table class="table table-hover text-center align-middle"
			id="user-table">
			<thead>
				<tr>
					<th scope="col">배송ID#</th>
					<th scope="col">운송번호</th>
					<th scope="col">요청사항</th>
					<th scope="col">배송종류</th>
					<th scope="col">배송상태</th>


				</tr>
			</thead>
			<tbody>
				<c:forEach var="shipping" items="${shippings}">
					<tr>
						<th scope="row">${shipping.sid}</th>
						<c:if test="${shipping.sshipmentnum ==null }">
							<td>배송번호 발급중...</td>
						</c:if>
						<c:if test="${shipping.sshipmentnum !=null }">
							<td>${shipping.sshipmentnum}</td>
						</c:if>

						<td>${shipping.srequest}</td>
						<c:if test="${shipping.stype == 5000}">
							<td>일반배송</td>
						</c:if>
						<c:if test="${shipping.stype != 5000}">
							<td>익스프레스배송</td>
						</c:if>
						<td>${shipping.sstatus }</td>

					</tr>
				</c:forEach>

			</tbody>
		</table>
		<nav aria-label="..." class="d-flex justify-content-center me-5">
			<ul class="pagination">
				<c:if test="${pager.groupNo>1}">
					<li class="page-item"><a class="page-link"
						href="shippings?pageNo=${pager.startPageNo-1}">Previous</a></li>
				</c:if>
				<c:forEach var="i" begin="${pager.startPageNo}"
					end="${pager.endPageNo}">
					<c:if test="${pager.pageNo!=i}">
						<li class="page-item"><a class="page-link"
							href="shippings?pageNo=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pager.pageNo == i}">
						<li class="page-item ative"><a class="page-link"
							href="shippings?pageNo=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<li class="page-item"><a class="page-link"
						href="shippings?pageNo=${pager.endPageNo+1}">Next</a></li>
				</c:if>

			</ul>
		</nav>

	</section>
	<!-- The Modal -->
	<script src="/viewport_mini_web/resources/js/admin.js"></script>
</body>
</html>
