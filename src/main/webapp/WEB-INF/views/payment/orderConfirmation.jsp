
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 완료 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderConfirmation.css?ver=1">

</head>

<body>
	<div id="center" class=" center d-flex flex-row">

		<div class="orderLeft justify-content-center alilgn-items-center" style="flex-grow: 5; margin-right: 50px;">
			<h2>
				<b>Your Order Confirmed!</b>
			</h2>
			<p>
			<h6>주문이 완료되었습니다.</h6>
			<br> <br>
			<div class="billingaddress" id="billingaddress">
				<hr>
				<table>

					<div class="billingInfo col">
						<h3 class="mb-5">
							<b>BILLING INFO</b>
						</h3>
						<p>
							<b>NAME:</b> John Doe
						</p>
						<p>
							<b>ADDRESS:</b> 123 Main St, City, Country
						</p>
						<p>
							<b>PHONE:</b> 010-1234-5555
						</p>
						<div class="mt-4">
							<button class="btn btn-lg btn-dark">
								<i class="fas fa-home"></i> <b>HOME</b>
							</button>
						</div>
						<!--btn class= 이렇게 안하고 div class="btn" 일케 해도 버튼으로 됨 부트스트랩으로-->
					</div>

					<!-- <form>
                                    <h5><b>배송 상태 알림 서비스</b></h5>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="emailNotification">
                                        <label class="form-check-label" for="emailNotification">이메일 알림 받기</label>
                                    </div>
                                    <div class="form-group mt-3">
                                        <label for="phoneInput"><b>SMS 알림 받기</b></label>
                                        <input type="text" class="form-control" id="phoneInput" placeholder="휴대폰 번호">
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-4"><i class="fas fa-envelope"></i> <b>알림 설정</b></button>
                                </form> -->
				</table>
			</div>
		</div>


		<div class="orderRight justify-content-center align-items-center h-150" style="flex-grow: 5; border-radius: 1.3cap;">
			<h3>
				<b>결제 정보</b>
			</h3>
			<br>

			<h6 id="orderNum">주문번호</h6>
			<hr>
			<br>
			<div class="row border-top border-bottom" id="cart-list-container">
				<div class="row main align-items-center">
					<div class="col-3">
						<img class="img-fluid" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_GC10_2.jpg">
					</div>
					<div class="col-6">
						<div class="row text-muted">Sunglasses</div>
						<div class="row">몬타 GC10</div>
						<span class="border row">수량: 1</span>
					</div>
					<div class="col-3">₩ 44.00</div>
				</div>
			</div>
			<div class="orderedProducts">

				<hr>
				<div class="orderPrice">
					<p>
						<b>SUBTOTAL:</b> ₩ 555.00
					</p>
					<p>
						<b>SHIPPING FEE:</b> ₩ 0.00
					</p>
					<p>
						<b>DISCOUNT:</b> -₩ 0.00
					</p>
					<p class="mt-3">
						<b>TOTAL:</b> ₩ 44.00
					</p>
				</div>
				<br>




			</div>
		</div>
</body>
</html>