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
		<!-- JQuery �ܺ� ���̺귯�� -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
		<!-- css ���� -->
		<link rel="stylesheet" href="/viewport_mini_web/resources/css/nav.css?ver=1">
		<link rel="stylesheet" href="/viewport_mini_web/resources/css/payment.css?ver=1">	
		
		<!-- ������ -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	</head>
	<body>
		<!-- �׺���̼� ��  -->
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>

    <form action="" method="post" id="payment-form" name="payment-form">
        <div class="payment-wrap">
            <div class="payment-block">
                <!-- ���� ���� �Է� -->
                <section class="payment-block-order">
                    <div class="title">
                        <h6>1. �ֹ��� ����</h6>
                    </div>
                    <div>
                        <input type="text" placeholder="�̸�*" class="orderName">
                    </div>
                    <div class="order-phonenumber">
                        <p>�޴���ȭ*</p>
                        <input type="text">
                    </div>
                    <div class="order-email">
                        <p>�̸���*</p>
                        <input type="text" id="emailId">
                        <span>@</span>
                        <input type="text" id="emailSelect-direct">  
                    </div>
                </section>
                <section class="payment-block-delivery">
                    <div class="title">
                        <h6>2. ����� ����</h6>
                    </div>
                    <div>
                        <label for="delivery-radio1">
                            <input type="radio" name="delivery-radio" id="delivery-radio1"/>���� �Է�
                        </label>
                        <label for="delivery-radio2">
                            <input type="radio" name="delivery-radio" id="delivery-radio2" checked/>ȸ�� ������ ����
                        </label>  
                        
                    </div>
                    <div>
                        <input type="text" placeholder="�޴� ���*">
                    </div>
                    <div>
                        <!-- �����ȣ ã�� -->
                    </div>
                    <div>
                        <input type="text" placeholder="�⺻ �ּ�*">
                        <input type="text" placeholder="�� �ּ�*">
                    </div>
                    <div class="delivery-phonenumber">
                        <p>�޴���ȭ*</p>
                        <input type="text" id="payment-phonenumber">
                        <small id="payment-phonenumber-error"></small>
                    </div>
                    <div class="delivery-message">
                        <p>��� �޽���</p>
                        <select name="deliverySelect" id="deliverySelect">
                            <option value="" selected>��� �� ��û������ ������ �ּ���.</option>
                            <option value="">��� ���� �̸� �����ٶ��ϴ�.</option>
                            <option value="">���� �� ���ǿ� �ð��ּ���</option>
                            <option value="">���� �� �� �տ� �����ּ���.</option>
                            <option value="deliveryDirect">���� �Է�</option>
                        </select>
                        <input type="text" id="deliverySelect-direct">
                    </div>
                </section>
                <section class="payment-block-payment">
                    <div class="title">
                        <h6>3. ���� ����</h6>
                    </div>
                </section>
            </div>
            <div class="product-block">
                <div class="product-block-product">
                    <div>
                        <p>�ֹ� ��ǰ</p>
                    </div>
                    <div>
                        <ul>
                            <li><a href="#"><img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_2.jpg"></a></li>
                            <li>��Ÿ 04</li>
                            <li>���� : 1</li>
                        </ul>
                        <ul>
                            <li><a href="#"><img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg"></a></li>
                            <li>��Ÿ 01</li>
                            <li>���� : 1</li>
                        </ul>
                    </div>
                </div>
                <div class="product-block-order">
                    <div class="price-delivery">
                        <ul>
                            <li>��ǰ �ݾ�</li>
                            <li>660,000</li>
                        </ul>
                        <ul>
                            <li>��ۺ�</li>
                            <li>5,000</li>
                        </ul>
                    </div>
                    <div>
                        <ul>
                            <li>��ü �հ�</li>
                            <li>665,000</li>
                        </ul>
                    </div>
                    <div>
                        <button type="submit" id="payment-button">
                            <span>665,000</span>
                            <span>�����ϱ�</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    
    </form>
	
		<!-- JS ���� -->
		<script src="/viewport_mini_web/resources/js//payment.js"></script>
	</body>
</html>