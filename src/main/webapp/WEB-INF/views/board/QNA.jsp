<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/QNA.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body>
	<div class="card">

		<!-- 상단 영역 -->
		<div class="upper row justify-content-center align-items-center mb-5">
			<div class="col text-center">
				<h1 class="mb-5">
					<b>Q&A</b>
				</h1>
				<h5 class="mb-3">문의 사항을 남겨 주세요.</h5>
				<h5></h5>
			</div>
		</div>

		<!-- 간격 -->
		<div class="row justify-content-center mb-5"></div>

		<div class="button row justify-content-center ">
			<div class="col text-center">
				<a href="${pageContext.request.contextPath}/board/writeQNA"
					class="button btn btn-sm btn-dark">write</a>
			</div>
		</div>

		<!-- 하단 영역 -->
		<div class="row justify-content-center">
			<div class="col">
				<table class="table table-hover text-center">
					<!-- text-center 클래스 추가 -->
					<thead>
						<tr>
							<th scope="col">No. <i class="fa-solid fa-sort"></i></th>
							<th scope="col">Category</th>
							<!--상품 / 주문 / 기타-->
							<th scope="col">Title <i class="fa-solid fa-sort"></i></th>
							<th scope="col">Date <i class="fa-solid fa-sort"></i></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>상품</td>
							<td>안경 피팅 문의</td>
							<td>2000.01.23</td>
						</tr>
						<td>1</td>
						<td>주문</td>
						<td>주문했는데 옵션 변경하고 싶어요</td>
						<td>2000.01.23</td>
						</tr>
						<td>1</td>
						<td>기타</td>
						<td>오프라인 매장 문의</td>
						<td>2000.01.23</td>
						</tr>


					</tbody>
				</table>
			</div>
		</div>

		<div class="button row justify-content-center mb-5 ">
			<div class="col text-center">
				<button class="button btn btn-sm btn-dark mt-5">
					<small>내 작성글 보기</small>
				</button>
			</div>
		</div>
		<!-- 페이지네이션 가운데 정렬 -->
		<div class="row justify-content-center">
			<div class="col text-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center" id="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>

</html>