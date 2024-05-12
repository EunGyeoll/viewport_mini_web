<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<!-- 여기에 네비게이션 바 삽입 예정 -->
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="container-fluid g-0">
		<div class="row">
			<div class="col-md-3 sidebar">
		<div class="list-group rounded-0">
		    <a href="${pageContext.request.contextPath}/mypage" class="list-group-item list-group-item-action">프로필</a>
		    <a href="${pageContext.request.contextPath}/mypage/password" class="list-group-item list-group-item-action">비밀번호 변경</a>
		    <a href="${pageContext.request.contextPath}/mypage/orders" class="list-group-item list-group-item-action">주문 내역</a>
		    <a href="${pageContext.request.contextPath}/mypage/shipment" class="list-group-item list-group-item-action">배송 내역</a>
		    <a href="${pageContext.request.contextPath}/mypage/myqna" class="list-group-item list-group-item-action">문의 내역</a>
		    <a href="${pageContext.request.contextPath}/mypage/deleteAccount" class="list-group-item list-group-item-action">회원 탈퇴</a>
		</div>s
			</div>
			<div class="col-md-9 right-box">
				<div class="tab-content">

					<div class="tab-pane active" id="shipment" role="tabpanel">
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
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/viewport_mini_web/resources/js/mypage.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>