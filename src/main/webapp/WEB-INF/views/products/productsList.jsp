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
		<link rel="stylesheet" href="/viewport_mini_web/resources/css/productsList.css?ver=1">	
		
		<!-- ������ -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	</head>
	<body>
		<!-- �׺���̼� ��  -->
		<%@ include file="/WEB-INF/views/common/nav.jsp"%>

			    <div class="wrap">
        <div class="filter-block">
            <form action="" method="post">
                <div class="filter-category">
                    <h5>ī�װ�</h5>
                    <ul>
                        <li>
                            <input type="checkbox" class="form-check-input" id="glasses" name="glasses-option" value="glasses">
                            <label class="form-check-label" for="glasses">�Ȱ�</label>
                        </li>
                        <li>
                            <input type="checkbox" class="form-check-input" id="sunglasses" name="glasses-option" value="sunglasses">
                            <label class="form-check-label" for="sunglasses">���۶�</label>
                        </li>
                    </ul>
                </div>
                <div class="filter-price">
                    <h5>����</h5>
                    <ul>
                        <li>
                            <input type="checkbox" class="form-check-input" id="lowPrice" name="price-option" value="lowPrice">
                            <label class="form-check-label" for="lowPrice">���� ���ݼ�</label>
                        </li>
                        <li>
                            <input type="checkbox" class="form-check-input" id="highPrice" name="price-option" value="highPrice">
                            <label class="form-check-label" for="highPrice">���� ���ݼ�</label>
                        </li>
                    </ul>
                </div>
                <div class="filter-sort">
                    <h5>����</h5>
                    <ul>
                        <li>
                            <input type="checkbox" class="form-check-input" id="lowPrice" name="sort-option" value="lowPrice">
                            <label class="form-check-label" for="lowPrice">�ֽż�</label>
                        </li>
                        <li>
                            <input type="checkbox" class="form-check-input" id="highPrice" name="sort-option" value="highPrice">
                            <label class="form-check-label" for="highPrice">�Ǹż�</label>
                        </li>
                    </ul>
                </div>
                <div class="filter-button">
                    <button type="reset">�ʱ�ȭ</button>
                    <button type="submit">�˻�</button>   
                </div>        
            </form>
        </div>
        <div class="list-block">
            <ul class="card-list">
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg">
                    </div>
                    <div>
                        <p>��Ÿ 01</p>
                        <p>330,000</p>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg">
                    </div>
                    <div>
                        <p>��Ÿ 01</p>
                        <p>330,000</p>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_01_2.jpg">
                    </div>
                    <div>
                        <p>��Ÿ 01</p>
                        <p>330,000</p>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NUBO_01_2.jpg">
                    </div>
                    <div>
                        <p>���� 01</p>
                        <p>259,000</p>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NUBO_01_2.jpg">
                    </div>
                    <div>
                        <p>���� 01</p>
                        <p>259,000</p>
                    </div>
                </li>                 
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NUBO_01_2.jpg">
                    </div>
                    <div>
                        <p>���� 01</p>
                        <p>259,000</p>
                    </div>
                </li>     
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_FEAR_X_GR9_2.jpg">
                    </div>
                    <div>
                        <p>�Ǿ� X 03</p>
                        <p>360,000</p>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_FEAR_X_GR9_2.jpg">
                    </div>
                    <div>
                        <p>�Ǿ� X 03</p>
                        <p>360,000</p>
                    </div>
                </li>  
                <li>
                    <div>
                        <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_FEAR_X_GR9_2.jpg">
                    </div>
                    <div>
                        <p>�Ǿ� X 03</p>
                        <p>360,000</p>
                    </div>
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
	
		<!-- JS ���� -->
		<script src="/viewport_mini_web/resources/js//productsList.js"></script>
	</body>
</html>