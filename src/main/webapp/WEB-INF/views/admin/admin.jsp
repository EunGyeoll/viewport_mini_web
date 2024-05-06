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
						<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin">대시보드</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">사용자 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/products">상품 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/shippings">배송 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/posts">게시글 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">홈으로 돌아가기</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div class="d-flex justify-content-end me-5 mt-3 justify-content-sm-between">
		<h2 class="ms-4">상품 관리</h2>

		<div>
			<input type="text" />
			<button>검색</button>
		</div>

	</div>
	<section class="container mt-3">
		<div class="row">
			<div class="col-md-3">
				<div class="card text-white bg-primary mb-3">
					<div class="card-header">유저</div>
					<div class="card-body">
						<h5 class="card-title">150명</h5>
						<p class="card-text">전체 등록된 유저수</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card text-white bg-success mb-3">
					<div class="card-header">판매</div>
					<div class="card-body">
						<h5 class="card-title">5,000,000원</h5>
						<p class="card-text">이번달 판매 총 금액</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card text-white bg-danger mb-3">
					<div class="card-header">이슈</div>
					<div class="card-body">
						<h5 class="card-title">5개</h5>
						<p class="card-text">해결해야 하는 문제</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card text-white bg-warning mb-3">
					<div class="card-header">게시글</div>
					<div class="card-body">
						<h5 class="card-title">5개</h5>
						<p class="card-text">전체 게시글 개수</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="container mt-3">
		<h3>최근 주문들</h3>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>주문 번호</th>
					<th>날짜</th>
					<th>상태</th>
					<th>금액</th>
					<th>상세내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="align-middle">1234</td>
					<td class="align-middle">2022-04-01</td>
					<td class="align-middle">Shipped</td>
					<td class="align-middle">$150</td>
					<td><button class="btn btn-info">View</button></td>
				</tr>
				<!-- More rows -->
			</tbody>
		</table>
	</section>

	<script src="/viewport_mini_web/resources/js/admin.js"></script>

</body>
</html>
