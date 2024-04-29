
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery 외부 라이브러리 설정 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- css 설정 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderConfirmation.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
    <title>주문 확인</title>
  </head>
  <body>
  <%@ include file="/WEB-INF/views/common/nav.jsp"%>
    <section class="container d-flex align-items-center main-box">
      <div class="left-sidebox h-75 col-2 bg-dark Regular shadow pt-5 text-center">
        <h2 class="text-light text-center">ORDER RECEIPT</h2>
        <p class="text-light text-center">#SDKNO7651907</p>
      </div>
      <div class="col h-75">
        <div class="item-container h-100 border p-5 Regular shadow  overflow-auto">
          <div class="row" id="cart-list-container">
            <div>
              <h2>주문 확인</h2>
              <strong>Hello, ian</strong>
              <p>
                Your order has been confirmed and will be shipped within the
                next two days
              </p>
            </div>
            <div class="row border-top p-4 text-center">
              <div class="col">
                <div>주문 일자</div>
                <div>21 Sep,2024</div>
              </div>
              <div class="col">
                <div>주문 번호</div>
                <div>AJE051823</div>
              </div>
              <div class="col">
                <div>배송지</div>
                <div>서울시 강남구 서초구</div>
              </div>
            </div>
            <div class="row main align-items-center border-top">
              <div class="col-2">
                <img
                  class="img-fluid p-2"
                  src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_GC10_2.jpg"
                />
              </div>
              <div class="col">
                <div class="row text-muted">Sunglasses</div>
                <div class="row text-muted">몬타 GC10</div>
                <div class="row text-muted">수량: 1</div>
              </div>

              <div class="col text-end">₩40,000</div>
            </div>

            <div class="row main align-items-center border-top">
              <div class="col-2">
                <img
                  class="img-fluid p-2"
                  src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_GC10_2.jpg"
                />
              </div>
              <div class="col">
                <div class="row text-muted">Sunglasses</div>
                <div class="row">몬타 GC10</div>
                <div class="row text-muted">수량: 1</div>
              </div>

              <div class="col text-end">₩40,000</div>
            </div>
          </div>
          <div class="result-box row border-top p-3">
            <div class="left-result-box col">
              <p>
                we'll be sending a shipping confirmation email when the items
                shipped successfully.
              </p>
              <strong>Thank you for joining with us</strong>
            </div>
            <div class="right-result-box col-4">
              <div class="row mb-2 d-flex">
                <div class="col">배송</div>
                <div class="col text-end">200,000 원</div>
              </div>
              <div class="row mb-2 d-flex">
                <div class="col">배송비</div>
                <div class="col text-end">200,000 원</div>
              </div>
              <div class="row mb-2 d-flex">
                <div class="col">세금</div>
                <div class="col text-end">200,000 원</div>
              </div>
              <div class="row mb-2 d-flex ">
                <div class="col">할인</div>
                <div class="col text-end ">200,000 원</div>
              </div>
              <hr />
              <div class="row mb-2 d-flex">
                <div class="col">총 금액</div>
                <div class="col text-end">200,000 원</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    <script src="/viewport_mini_web/resources/js/orderConfirmation.js"></script>
  </body>
</html>
