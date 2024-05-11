<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>장바구니</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css?ver=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css?ver=1">
<%--아이콘 --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="card">
		<div class="row">
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>
								<b>Shopping Cart</b>
							</h4>
						</div>
						<div class="col align-self-center text-right text-muted num-of-items" id="num-of-items">
							<span>${totalProductCount} items</span>
						</div>
					</div>
				</div>
				<div class="row border-top border-bottom" id="cart-list-container">
					<c:forEach var="productData" items="${productDataList}">
						<div class="product-row row main align-items-center" data-pid="${productData.product.pid}">
							<div class="col-2">
								<img class="img-fluid" src="products/attachProductDownload?pid=${productData.product.pid}">
							</div>
							<div class="col">
								<div class="row text-muted">${productData.product.pcategory}</div>
								<div class="row">${productData.product.pname}</div>
							</div>
							<div class="col">
								<%--data-* 를 사용하면 해당되는 태그를 js에서 부르기 쉬움 --%>
								<button class="btn btn-sm" onclick="editCount(${productData.product.pid}, 'minus')">-</button>
								<span class="border-0 count-box" data-pid="${productData.product.pid}">${productData.quantity}</span>
								<button class="btn btn-sm" onclick="editCount(${productData.product.pid}, 'plus')">+</button>
							</div>
							<div class="col">
								₩${productData.product.pprice} <span class="close-btn btn btn-sm" onclick="removeItem(${productData.product.pid})" >&#10005;</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-4 summary">
				<div>
					<h5>
						<b>Summary</b>
					</h5>
				</div>
				<hr>
				<div class="row">
					<div class="col num-of-items" style="padding-left: 0;"></div>
					<div class="col text-right total-price">0 원</div>
				</div>
				<form>
					<p>SHIPPING</p>
					<select onchange="optionSelect()" id="delivery-option">
						<option class="text-muted" value="5000">Standard-Delivery- ₩ 5000</option>
						<option class="text-muted" value="12000">Express-Delivery- ₩ 12000</option>
					</select>
				</form>
				<div class="row" style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col">TOTAL PRICE</div>
					<div class="col text-right" id="total-price">0 원</div>
				</div>
				<button class="checkout-btn btn">결제하기</button>
				<a href="/viewport_mini_web">
					<div class="back-to-shop shopping-btn text-center">
						<span class="text-muted">Back to shop</span>
					</div>
				</a>
			</div>
		</div>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- Footer -->
	<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>

</body>
</html>