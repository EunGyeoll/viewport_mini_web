<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>ASK US</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/FAQ.css">

</head>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

h2 {
	text-align: center;
	margin-top: 50px;
}

form {
	width: 60%;
	margin: auto;
	background-color: #fff;
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

label {
	font-weight: bold;
	color: #555;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ced4da;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 16px;
}

textarea {
	min-height: 200px;
	resize: vertical;
}

#subBtn {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	float: right;
}

#subBtn:hover {
	background-color: #0056b3;
}
</style>
<body>
	<div class="container">
		<!-- 상단 영역 -->
		<div class="row justify-content-center align-items-center mt-5 mb-3">
			<div class="col text-center">
				<h1>FAQ</h1>
				<br>
				<div>자주 묻는 질문 목록</div>
				<br>
				<div>
					<div>CATEGORY</div>
					<a href="#">ALL </a> | <a href="#">PRODUCTS </a> | <a href="#">ORDER
					</a>
				</div>
			</div>
		</div>

		<!-- 간격 -->
		<div class="row justify-content-center mb-5"></div>

		<!--검색 버튼-->
		<div class="input-group justify-content-center">
			<div class="form-outline">
				<input type="search" id="form1" class="form-control" />
			</div>
			<button type="button" class="btn btn-dark">Search</button>
		</div>
		<div id="animate"></div>
		<!-- 하단 영역 -->
		<div class="container mt-3">
			<div id="accordion">
				<div class="card border-0">
					<div class="card-header">
						<a class="btn d-flex justify-content-between"
							data-bs-toggle="collapse" href="#collapseOne"> <span>자주
								묻는 질문 1 </span> <img src="${pageContext.request.contextPath}/resources/image/Polygon2.png" class="upsidearrow"
							alt="" width="12" height="12">
						</a>
					</div>
					<div id="collapseOne" class="collapse" data-bs-parent="#accordion">
						<div class="card-body">답변임</div>
					</div>
				</div>
				<div class="card border-0">
					<div class="card-header">
						<a class="btn d-flex justify-content-between"
							data-bs-toggle="collapse" href="#collapseTwo"> 자주 묻는 질문 2 <img
							src="${pageContext.request.contextPath}/resources/image/Polygon2.png" class="upsidearrow" alt="" width="12"
							height="12">
						</a>
					</div>
					<div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
						<div class="card-body">답변임</div>
					</div>
				</div>
				<div class="card border-0">
					<div class="card-header">
						<a class="btn d-flex justify-content-between"
							data-bs-toggle="collapse" href="#collapseThree"> 자주 묻는 질문 3 <img
							src="${pageContext.request.contextPath}/resources/image/Polygon2.png" class="upsidearrow" alt="" width="12"
							height="12">
						</a>
					</div>
					<div id="collapseThree" class="collapse"
						data-bs-parent="#accordion">
						<div class="card-body">답변임</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 페이지네이션 가운데 정렬 -->
		<div class="row justify-content-center mt-5">
			<div class="col text-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center" id="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/FAQ.js"></script>

</body>
</html>
