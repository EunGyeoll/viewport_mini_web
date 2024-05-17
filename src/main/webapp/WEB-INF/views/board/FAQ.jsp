<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- css 설정 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/FAQ.css">
<link rel="stylesheet" href="/viewport_mini_web/resources/css/nav.css?ver=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
td{
transition: 0.9s ease;
}
</style>
</head>

<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

	<div class="container-fluid">
		<div class="qna">
			<!-- 상단 영역 -->
			<div class="upper row justify-content-center align-items-center mb-5">
				<div class="col text-center">
					<h2 class="mt-5">
						<b class="qTitle">FAQ</b>
					</h2>
				</div>
				<div>
					<div class="d-flex justify-content-center">
						<a href="${pageContext.request.contextPath}/board/noticeList" class="mx-3">공지사항</a>
						 <a href="#" class="mx-3" id="qna-button">FAQ</a> 
						 <a href="${pageContext.request.contextPath}/board/qnaList" class="mx-3">Q&A</a> 
					</div>
				</div>
			</div>



			<!-- 하단 영역 -->
			<div class="row justify-content-center">
				<div class="col">
					<table class="table table-hover text-center" style="table-layout: fixed;">
						<thead>
							<tr colspan=4>
								<th scope="col">No</th>
								<th scope="col">카테고리</th>
								<!--상품 / 주문 / 기타-->
								<th colspan=2 scope="col">제목</th>
							</tr>
						</thead>
						<tbody>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false">
								<td>5</td>
								<td>상품</td>
								<td colspan=2>선글라스 피팅 문의</td>
							</tr>
							<tr id="collapse1" class="collapse">
								<td colspan="4">내용을 입력하세요...</td>
							</tr>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false">
								<td>4</td>
								<td>상품</td>
								<td colspan=2>안경 피팅 문의</td>
							</tr>
							<tr id="collapse2" class="collapse">
								<td colspan="4">내용을 입력하세요...</td>
							</tr>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false">
								<td>3</td>
								<td>상품</td>
								<td colspan=2>선글라스 고장 문의</td>
							</tr>
							<tr id="collapse3" class="collapse">
								<td colspan="4">내용을 입력하세요...</td>
							</tr>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false">
								<td>2</td>
								<td>주문</td>
								<td colspan=2>안녕하세요. 주문했는데 옵션 변경하고 싶어요</td>
							</tr>
							<tr id="collapse4" class="collapse">
								<td colspan="4">내용을 입력하세요...</td>
							</tr>
							<tr data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false">
								<td>1</td>
								<td>기타</td>
								<td colspan=2>오프라인 매장 문의</td>
							</tr>
							<tr id="collapse5" class="collapse">
								<td colspan="4">내용을 입력하세요...</td>
							</tr>
									<tr data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="false">
								<td>1</td>
								<td>기타</td>
								<td colspan=2>오프라인 매장 문의</td>
							</tr>
							<tr id="collapse6" class="collapse">
								<td colspan="4">내용을 입력하세요...</td>
							</tr>
						</tbody>
					</table>
					</table>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


</body>

</html>