<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<body>
	<!-- 여기에 네비게이션 바 삽입 예정 -->
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 sidebar">
				<div class="list-group rounded-0">
					<a href="#profile" class="border-0 list-group-item list-group-item-action active" aria-current="true" data-bs-toggle="tab"> 프로필 </a>
					<hr class="my-1" >
					<a href="#password" class="border-0 list-group-item list-group-item-action" data-bs-toggle="tab">비밀번호 변경</a>
					<hr class="my-1">
					<a href="#orders" class="border-0 list-group-item list-group-item-action" data-bs-toggle="tab">주문 내역</a>
					<hr class="my-1">
					<a href="#shipment" class="border-0 list-group-item list-group-item-action" data-bs-toggle="tab">배송내역</a>
					<hr class="my-1">
					<a href="#myqna" class="border-0 list-group-item list-group-item-action" data-bs-toggle="tab">문의 내역</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="tab-content">
					<div class="tab-pane active" id="profile" role="tabpanel">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">프로필 정보</h4>
								<form>
									<div class="mb-3">
										<label for="user-name" class="form-label">이름</label> <input type="text" class="form-control" id="user-name" value="홍길동">
									</div>
									<div class="mb-3">
										<label for="user-email" class="form-label">이메일</label> <input type="email" class="form-control" id="user-email" value="example@example.com">
									</div>
									<div class="mb-3">
										<label for="user-email" class="form-label">기본주소</label> <input type="text" class="form-control" id="user-address" value="서울시 강남구 서초구">
									</div>
									<div class="mb-3">
										<label for="user-email" class="form-label">상세주소</label> <input type="text" class="form-control" id="user-address-detail" value="112-902">
									</div>
									<button type="submit" class="btn btn-dark">저장하기</button>
								</form>
							</div>
						</div>
					</div>

					<div class="tab-pane" id="orders" role="tabpanel">
						<div class="card">
							<div class="card-body">
								<div class=" d-flex justify-content-between align-items-center">
									<h4 class="card-title">주문 내역</h4>
									<select id="orderSort" class="form-select form-select-sm" onchange="sortOrders()" style="width: auto;">
										<option value="date_desc">주문날짜 내림차순</option>
										<option value="date_asc">주문날짜 오름차순</option>
										<option value="price_desc">가격 내림차순</option>
										<option value="price_asc">가격 오름차순</option>
									</select>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
										<div class="row">
											<div class="col-md-3">
												<img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_TOKKI_WM_2.jpg" class="img-fluid" alt="오버워치 2 - 토끼 WM">
											</div>
											<div class="col-md-9">
												<ul class="list-group">
													<li class="list-group-item">상품명: 오버워치 2 - 토끼 WM</li>
													<li class="list-group-item">가격: 300,000원</li>
													<li class="list-group-item">주문 날짜: 2024-04-20</li>
													<li class="list-group-item">결제 방식: 신용카드</li>
												</ul>
												<a href="#" class="btn btn-link">주문 상세보기</a>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="row">
											<div class="col-md-3">
												<img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_EGO_01_2.jpg" class="img-fluid" alt="EGO 01">
											</div>
											<div class="col-md-9">
												<ul class="list-group">
													<li class="list-group-item">상품명: 에고 01</li>
													<li class="list-group-item">가격: 330,000원</li>
													<li class="list-group-item">주문 날짜: 2024-04-15</li>
													<li class="list-group-item">결제 방식: 페이팔</li>
												</ul>
												<a href="#" class="btn btn-link">주문 상세보기</a>
											</div>
										</div>
									</li>
								</ul>
								<div class="pagination-center">
									<div class="pagination">
										<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&raquo;</a>
									</div>
								</div>
							</div>
						</div>


					</div>
					<div class="tab-pane" id="password" role="tabpanel">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">비밀번호 변경</h4>
								<form>
									<div class="mb-3">
										<label for="current-password" class="form-label">현재 비밀번호</label> <input type="password" class="form-control" id="current-password">
									</div>
									<div class="mb-3">
										<label for="new-password" class="form-label">새 비밀번호</label> <input type="password" class="form-control" id="new-password">
									</div>
									<button type="submit" class="btn btn-dark">변경하기</button>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="shipment" role="tabpanel">
						<div class="card">
							<div class="card-body ">
								<h4 class="card-title">배송 내역</h4>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">주문 번호 #1234
										<ul class="list-group">
											<li class="list-group-item">트래킹 번호: KR1234ABC</li>
											<li class="list-group-item">배송 상태: 배송 완료</li>
											<li class="list-group-item">배송종류: 익스프레스</li>
											<li class="list-group-item">예상 도착일: 2023-04-14</li>
										</ul>
									</li>
									<li class="list-group-item">주문 번호 #1235
										<ul class="list-group">
											<li class="list-group-item">트래킹 번호: KR5678DEF</li>
											<li class="list-group-item">배송 상태: 배송 중</li>
											<li class="list-group-item">배송종류: 일반</li>
											<li class="list-group-item">예상 도착일: 2023-04-17</li>
										</ul> <a href="#" class="btn btn-link">배송 추적하기</a>
									</li>
								</ul>
								<div class="pagination-center">
									<div class="pagination">
										<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&raquo;</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="myqna" role="tabpanel">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">문의 내역</h4>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
										<div class="d-flex justify-content-between align-items-center">
											<div>
												<h5>제품 관리에 대해 문의드립니다.</h5>
												<p>제품을 처음 사용하는데,관리 방법을 자세히 알고 싶습니다.</p>
											</div>
											<span class="badge bg-success">답변 완료</span>
										</div>
										<div class="mt-2">
											<strong>답변:</strong>
											<p>안녕하세요, 고객님. 제품 관리에 대한 자세한 안내를 메일로 보내드렸습니다. 확인 부탁드립니다.</p>
										</div>
									</li>
									<li class="list-group-item">
										<div class="d-flex justify-content-between align-items-center">
											<div>
												<h5>주문 취소 요청</h5>
												<p>어제 주문한 상품을 취소하고 싶습니다. 처리 부탁드립니다.</p>
											</div>
											<span class="badge bg-warning">처리 중</span>
										</div>
										<div class="mt-2">
											<strong>답변:</strong>
											<p>주문 취소 요청을 접수하였습니다. 곧 처리 완료될 예정입니다.</p>
										</div>
									</li>
								</ul>
								<div class="pagination-center">
									<div class="pagination">
										<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&raquo;</a>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>