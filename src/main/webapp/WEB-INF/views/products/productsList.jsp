<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Products List</title>
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
	href="/viewport_mini_web/resources/css/nav.css?ver=1">
<link rel="stylesheet"
	href="/viewport_mini_web/resources/css/productsList.css?ver=1">

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<!-- 네비게이션 바  -->
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

	<div class="wrap">
		<div class="filter-block">
			<form action="" method="post">
				<div class="filter-category">
					<h5>카테고리</h5>
					<ul>
						<li><input type="checkbox" class="form-check-input"
							id="glasses" name="glasses-option" value="glasses"> <label
							class="form-check-label" for="glasses">안경</label></li>
						<li><input type="checkbox" class="form-check-input"
							id="sunglasses" name="glasses-option" value="sunglasses">
							<label class="form-check-label" for="sunglasses">선글라스</label></li>
					</ul>
				</div>
				<div class="filter-price">
					<h5>가격</h5>
					<ul>
						<li><input type="checkbox" class="form-check-input"
							id="lowPrice" name="price-option" value="lowPrice"> <label
							class="form-check-label" for="price-option">낮은 가격순</label></li>
						<li><input type="checkbox" class="form-check-input"
							id="highPrice" name="price-option" value="highPrice"> <label
							class="form-check-label" for="price-option">높은 가격순</label></li>
					</ul>
				</div>
				<div class="filter-sort">
					<h5>정렬</h5>
					<ul>
						<li><input type="checkbox" class="form-check-input"
							id="lowPrice" name="sort-option" value="lowPrice"> <label
							class="form-check-label" for="lowPrice">최신순</label></li>
						<li><input type="checkbox" class="form-check-input"
							id="highPrice" name="sort-option" value="highPrice"> <label
							class="form-check-label" for="highPrice">판매순</label></li>
					</ul>
				</div>
				<div class="filter-shape">
					<h5>모양</h5>
					<ul>
						<li><input type="checkbox" class="form-check-input"
							id="circle" name="shape-option" value="circle"> <label
							class="form-check-label" for="circle">원형</label></li>
						<li><input type="checkbox" class="form-check-input"
							id="rectangle" name="shape-option" value="rectangle"> <label
							class="form-check-label" for="rectangle">사각형</label></li>
						<li><input type="checkbox" class="form-check-input"
							id="oval" name="shape-option" value="oval"> <label
							class="form-check-label" for="oval">타원형</label></li>							
					</ul>
				</div>				
				<div class="filter-button">
					<button type="reset" id="resetButton">초기화</button>
					<button type="submit">검색</button>
				</div>
			</form>
		</div>
		<div class="list-block">
			<ul class="card-list">
				<c:forEach var="product" items="${products}">
					<li><a href="productDetail?pid=${product.pid}">
							<div>
								<img src="attachProductDownload?pid=${product.pid}" />
							</div>
							<div>
								<p>${product.pname}</p>
								<p>
									<fmt:formatNumber value="${product.pprice}" pattern="#,###" />
								</p>
							</div>
					</a></li>
				</c:forEach>
			</ul>
			<div class="pagination-center">
				<div class="pagination">
					<c:if test="${pager.groupNo>1}">
						<a href="productsList?pageNo=${pager.startPageNo-1}">&laquo;</a>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a href="productsList?pageNo=${i}">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a href="productsList?pageNo=${i}" class="text-warning">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<a href="productsList?pageNo=${pager.endPageNo+1}">&raquo;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- JS 설정 -->
	<script src="/viewport_mini_web/resources/js/productsList.js"></script>
</body>
</html>