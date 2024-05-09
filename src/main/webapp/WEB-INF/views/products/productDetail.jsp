<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>product detail</title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- css 설정 -->
<link rel="stylesheet"
	href="/viewport_mini_web/resources/css/nav.css?ver=1">
<link rel="stylesheet"
	href="/viewport_mini_web/resources/css/productDetail.css?ver=1">

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body>
	<!-- 네비게이션 바  -->
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

	<div id="container">
		<div id="images">

			<img src="attachProductDownload?pid=${product.pid}">
			<c:forEach var="ptid" items="${ptids}">
				<img src="attachPhotosDownload?ptid=${ptid}">
			</c:forEach>

		</div>

		<!-- 사이드바 -->
		<aside class="sidebar">
			<div class="sidebar-context">
				<div class="namePrice">
					<div id="productName">${product.pname}</div>
					<div id="productPrice"><fmt:formatNumber value="${product.pprice}" pattern="#,###" />원</div>
					
				</div>

				<!-- 같은 제품 모음 -->
				<div class="sidebarImgs">
					<a href="#"> <img
						src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg">
					</a> <a href="#"> <img
						src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_W2_2.jpg">
					</a> <a href="#"> <img
						src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_GC10_2.jpg">
					</a> <a href="#"> <img id="nowImg"
						src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_2.jpg">
					</a>
				</div>

				<div id="productInfo">${product.pinfo}</div>
				
				<button type="button" class="btn btn1" data-bs-toggle="modal"
					data-bs-target="#myModal1">장바구니에 추가</button>

				<!-- 부트스트랩 accordion 사용 -->
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">제품
								세부 정보</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">${product.pdetail}</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
								aria-expanded="false" aria-controls="flush-collapseTwo">도움이
								필요하신가요?</button>
						</h2>
						<div id="flush-collapseTwo" class="accordion-collapse collapse"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">라이브챗 및 고객 센터 운영 시간: 월요일-금요일,
								09:30-17:00(공휴일 제외)</div>
						</div>
					</div>
				</div>


			</div>
		</aside>
	</div>

	<!-- 부트스트랩 Modal 사용 -->
	<div class="modal" id="myModal1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modalText">
					<p>
						선택하신 상품이 <br /> 장바구니에 추가되었습니다.
					</p>
				</div>
				<form method='post' action="/viewport_mini_web/cart">
				<input type="number" name=pid value=${product.pid}>
				<button>제출입니다</button>
				</form>
				<div class="modalButtons">
					<button type="button" class="continueBtn" data-bs-dismiss="modal">쇼핑
						계속하기</button>
					<button type="button" class="cartBtn" onclick="location.href='' ">장바구니로
						이동</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


	<!-- JS 설정 -->
	<!-- <script src="/viewport_mini_web/resources/js/productDetail.js"></script> -->


</body>
</html>