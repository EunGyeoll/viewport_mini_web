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
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- css 설정 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/QNA.css">
<link rel="stylesheet"
	href="/viewport_mini_web/resources/css/nav.css?ver=1">

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

	<div class="container-fluid">
		<div class="qna">
			<!-- 상단 영역 -->
			<div class="upper row justify-content-center align-items-center mb-5">
				<div class="col text-center">
					<h2>
						<b class="qTitle">Q&A</b>
					</h2>
				</div>
				<div>
				
				</div>
			</div>



			<!-- 하단 영역 -->
			<div class="row justify-content-center">
				<div class="col">
					<table class="table table-hover text-center"
						style="table-layout: fixed;">
						<!-- text-center 클래스 추가 -->
						<thead>
							<tr>
								<th scope="col">No <i class="fa-solid fa-sort"></i></th>
								<th scope="col">카테고리</th>
								<!--상품 / 주문 / 기타-->
								<th scope="col">제목</th>
								<th scope="col">계정</th>
								<th scope="col">작성날짜 <i class="fa-solid fa-sort"></i></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>5</td>
								<td>상품</td>
								<td>안경 피팅 문의</td>
								<td>mingeongwon1234@naver.com</td>
								<td>2000.01.23</td>
							</tr>
							<tr>
								<td>4</td>
								<td>상품</td>
								<td>안경 피팅 문의</td>
								<td>mg0212@naver.com</td>
								<td>2000.01.23</td>
							</tr>
							<tr>
								<td>3</td>
								<td>상품</td>
								<td>안경 피팅 문의</td>
								<td>mg0212@naver.com</td>
								<td>2000.01.23</td>
							</tr>
							<tr>
								<td>2</td>
								<td>주문</td>
								<td>안녕하세요. 주문했는데 옵션 변경하고 싶어요</td>
								<td>mingeongwon1234@naver.com</td>
								<td>2000.01.23</td>
							</tr>
							<tr>
								<td>1</td>
								<td>기타</td>
								<td>오프라인 매장 문의</td>
								<td>mg0212@naver.com</td>
								<td>2000.01.23</td>
							</tr>


						</tbody>
					</table>
				</div>
			</div>

			<div class="button-container">
				<div class="row justify-content-end">
					<div class="col-auto">
						<button class="button btn btn-outline-dark" id="myQna-button">
							<small>내 작성글 보기</small>
						</button>
					</div>
					<div class="col-auto">
						<a href="${pageContext.request.contextPath}/board/writeQNA"
							class="button btn btn-dark" id=writeQna-button>write</a>
					</div>
				</div>
			</div>

			<!-- 페이지네이션 -->
			<div class="pagination-center">
				<div class="pagination">
					<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a
						href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
					<a href="#">&raquo;</a>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>

</html>