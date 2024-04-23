<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="/viewport_mini_web/resources/css/productsList.css?ver=1">	
		
		<!-- 아이콘 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
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
                        <li>
                            <input type="checkbox" class="form-check-input" id="glasses" name="glasses-option" value="glasses">
                            <label class="form-check-label" for="glasses">안경</label>
                        </li>
                        <li>
                            <input type="checkbox" class="form-check-input" id="sunglasses" name="glasses-option" value="sunglasses">
                            <label class="form-check-label" for="sunglasses">선글라스</label>
                        </li>
                    </ul>
                </div>
                <div class="filter-price">
                    <h5>가격</h5>
                    <ul>
                        <li>
                            <input type="checkbox" class="form-check-input" id="lowPrice" name="price-option" value="lowPrice">
                            <label class="form-check-label" for="lowPrice">낮은 가격순</label>
                        </li>
                        <li>
                            <input type="checkbox" class="form-check-input" id="highPrice" name="price-option" value="highPrice">
                            <label class="form-check-label" for="highPrice">높은 가격순</label>
                        </li>
                    </ul>
                </div>
                <div class="filter-sort">
                    <h5>정렬</h5>
                    <ul>
                        <li>
                            <input type="checkbox" class="form-check-input" id="lowPrice" name="sort-option" value="lowPrice">
                            <label class="form-check-label" for="lowPrice">최신순</label>
                        </li>
                        <li>
                            <input type="checkbox" class="form-check-input" id="highPrice" name="sort-option" value="highPrice">
                            <label class="form-check-label" for="highPrice">판매순</label>
                        </li>
                    </ul>
                </div>
                <div class="filter-button">
                    <button type="reset">초기화</button>
                    <button type="submit">검색</button>   
                </div>        
            </form>
        </div>
        <div class="list-block">
            <ul class="card-list">
                <li>
                	<a href="#">
                		<div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg">
	                    </div>
	                    <div>
	                        <p>몬타 01</p>
	                        <p>330,000</p>
	                    </div>
                	</a>

                </li>
                <li>
                	<a href="#">
	                    <div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NUBO_01_2.jpg">
	                    </div>
	                    <div>
	                        <p>누보 01</p>
	                        <p>259,000</p>
	                    </div>               	
                	</a>

                </li>
                <li>
                	<a href="#">
	                    <div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_FEAR_X_GR9_2.jpg">
	                    </div>
	                    <div>
	                        <p>피어 X 03</p>
	                        <p>360,000</p>
	                    </div>              	
                	</a>
                </li>
                <li>
                	<a href="#">
                		<div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg">
	                    </div>
	                    <div>
	                        <p>몬타 01</p>
	                        <p>330,000</p>
	                    </div>
                	</a>

                </li>
                <li>
                	<a href="#">
	                    <div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NUBO_01_2.jpg">
	                    </div>
	                    <div>
	                        <p>누보 01</p>
	                        <p>259,000</p>
	                    </div>               	
                	</a>

                </li>
                <li>
                	<a href="#">
	                    <div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_FEAR_X_GR9_2.jpg">
	                    </div>
	                    <div>
	                        <p>피어 X 03</p>
	                        <p>360,000</p>
	                    </div>              	
                	</a>
                </li>
                <li>
                	<a href="#">
                		<div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg">
	                    </div>
	                    <div>
	                        <p>몬타 01</p>
	                        <p>330,000</p>
	                    </div>
                	</a>

                </li>
                <li>
                	<a href="#">
	                    <div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NUBO_01_2.jpg">
	                    </div>
	                    <div>
	                        <p>누보 01</p>
	                        <p>259,000</p>
	                    </div>               	
                	</a>

                </li>
                <li>
                	<a href="#">
	                    <div>
	                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_FEAR_X_GR9_2.jpg">
	                    </div>
	                    <div>
	                        <p>피어 X 03</p>
	                        <p>360,000</p>
	                    </div>              	
                	</a>
                </li>
            </ul>
            <div class="pagination-center">
                <div class="pagination">
                    <a href="#">&laquo;</a>
                    <a class="active" href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">&raquo;</a>
                </div>
            </div>
        </div>
    </div>	
    
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
		
		<!-- JS 설정 -->
		<script src="/viewport_mini_web/resources/js//productsList.js"></script>
	</body>
</html>