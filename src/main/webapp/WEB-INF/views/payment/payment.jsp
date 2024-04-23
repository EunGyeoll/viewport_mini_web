<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- JQuery 외부 라이브러리 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- css 설정 -->
		<link rel="stylesheet" href="/viewport_mini_web/resources/css/nav.css?ver=1">
		<link rel="stylesheet" href="/viewport_mini_web/resources/css/payment.css?ver=1">	
		
		<!-- 아이콘 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	</head>
	<body>
		<!-- 네비게이션 바  -->
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>

    <form action="" method="post" id="payment-form" name="payment-form">
        <div class="payment-wrap">
            <div class="payment-block">
                <!-- 결제 정보 입력 -->
                <section class="payment-block-order">
                    <div class="title">
                        <h6>1. 주문자 정보</h6>
                    </div>
                    <div>
                        <input type="text" placeholder="이름*" class="orderName">
                    </div>
                    <div class="order-phonenumber">
                        <p>휴대전화*</p>
                        <input type="text">
                    </div>
                    <div class="order-email">
                        <p>이메일*</p>
                        <input type="text" id="emailId">
                        <span>@</span>
                        <input type="text" id="emailSelect-direct">  
                    </div>
                </section>
                <section class="payment-block-delivery">
                    <div class="title">
                        <h6>2. 배송지 정보</h6>
                    </div>
                    <div>
                        <label for="delivery-radio1">
                            <input type="radio" name="delivery-radio" id="delivery-radio1"/>직접 입력
                        </label>
                        <label for="delivery-radio2">
                            <input type="radio" name="delivery-radio" id="delivery-radio2" checked/>회원 정보와 동일
                        </label>  
                        
                    </div>
                    <div>
                        <input type="text" placeholder="받는 사람*">
                    </div>
                    <div>
                        <!-- 우편번호 찾기 -->
                    </div>
                    <div>
                        <input type="text" placeholder="기본 주소*">
                        <input type="text" placeholder="상세 주소*">
                    </div>
                    <div class="delivery-phonenumber">
                        <p>휴대전화*</p>
                        <input type="text" id="payment-phonenumber">
                        <small id="payment-phonenumber-error"></small>
                    </div>
                    <div class="delivery-message">
                        <p>배송 메시지</p>
                        <select name="deliverySelect" id="deliverySelect">
                            <option value="" selected>배송 시 요청사항을 선택해 주세요.</option>
                            <option value="">배송 전에 미리 연락바랍니다.</option>
                            <option value="">부재 시 경비실에 맡겨주세요</option>
                            <option value="">부재 시 문 앞에 놓아주세요.</option>
                            <option value="deliveryDirect">직접 입력</option>
                        </select>
                        <input type="text" id="deliverySelect-direct">
                    </div>
                </section>
                <section class="payment-block-payment">
                    <div class="title">
                        <h6>3. 결제 수단</h6>
                    </div>
                </section>
            </div>
            <div class="product-block">
                <div class="product-block-product">
                    <div>
                        <p>주문 상품</p>
                    </div>
                    <div>
                        <ul>
                            <li><a href="#"><img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_2.jpg"></a></li>
                            <li>몬타 04</li>
                            <li>수량 : 1</li>
                        </ul>
                        <ul>
                            <li><a href="#"><img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg"></a></li>
                            <li>몬타 01</li>
                            <li>수량 : 1</li>
                        </ul>
                    </div>
                </div>
                <div class="product-block-order">
                    <div class="price-delivery">
                        <ul>
                            <li>상품 금액</li>
                            <li>660,000</li>
                        </ul>
                        <ul>
                            <li>배송비</li>
                            <li>5,000</li>
                        </ul>
                    </div>
                    <div>
                        <ul>
                            <li>전체 합계</li>
                            <li>665,000</li>
                        </ul>
                    </div>
                    <div>
                        <button type="submit" id="payment-button">
                            <span>665,000</span>
                            <span>결제하기</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    
    </form>
	
		<!-- JS 설정 -->
		<script src="/viewport_mini_web/resources/js//payment.js"></script>
	</body>
</html>