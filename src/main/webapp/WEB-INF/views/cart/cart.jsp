<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<!-- 아이콘 -->
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
							<!-- <span>3 items</span> -->
						</div>
					</div>
				</div>
				<div class="row border-top border-bottom" id="cart-list-container">
					<!-- <div class="row main align-items-center">
                        <div class="col-2"><img class="img-fluid" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_GC10_2.jpg"></div>
                        <div class="col">
                            <div class="row text-muted">Sunglasses</div>
                            <div class="row">몬타 GC10</div>
                        </div>
                        <div class="col">
                            <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                        </div>
                        <div class="col">₩ 44.00 <span class="close">&#10005;</span></div>
                    </div> -->
				</div>
				<!-- <div class="row">
                    <div class="row main align-items-center">
                        <div class="col-2"><img class="img-fluid" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_GAUSS_NC3_2.jpg"></div>
                        <div class="col">
                            <div class="row text-muted">Sunglasses</div>
                            <div class="row">가우스 NC3</div>
                        </div>
                        <div class="col">
                            <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                        </div>
                        <div class="col">₩ 44.00 <span class="close">&#10005;</span></div>
                    </div>
                </div>
                <div class="row border-top border-bottom">
                    <div class="row main align-items-center">
                        <div class="col-2"><img class="img-fluid" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NONN_GR7_2.jpg"></div>
                        <div class="col">
                            <div class="row text-muted">Sunglasses</div>
                            <div class="row">논엔 GR7</div>
                        </div>
                        <div class="col">
                            <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                        </div>
                        <div class="col">₩ 44.00 <span class="close">&#10005;</span></div>
                    </div>
                </div> -->

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
				<button class="checkout-btn btn">CHECKOUT</button>
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