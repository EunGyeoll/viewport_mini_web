<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		
		<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

		<!-- 사용자 정의 자바 스크립트-->
 	 <link rel="stylesheet" href="/viewport_mini_web/resources/css/app_style.css">


	</head>

	 <body>
	 	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
      
        <main>
            <section class="section1 container-fluid">
                <div class="video-background">
                    <iframe
                        src="https://www.youtube.com/embed/nGzDI4ShrhQ?autoplay=1&mute=1&loop=1&playlist=nGzDI4ShrhQ&controls=0&showinfo=0"
                        frameborder="0" allow="autoplay; encrypted-media; fullscreen"
                        style=" width:100%; height:100%;"></iframe>
                </div>
                <div class="overlay-text">
                    <h2>This is your VIEWPORT</h2>
                </div>
            </section>

            <section class="section2 container-fluid">
                <h2 class="section-title">Featured Items</h2>
                <div class="">
                    <!-- 한줄에 3개의 카드가 들어가도록 부트스트랩을 사용 -->
                <div class="card-container d-flex row row-cols-1 row-cols-md-3 g-4" id="featuredItems">
                
                    <!-- <div class="card" style="width: 18rem;">
                        <a href="">
                            <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_GC10_2.jpg"
                                class="card-img" alt="...">
                            <div class="card-body">
                                <p class="lens">Blue light protection</p>
                                <h5 class="card-title">몬타 01</h5>
                                <p class="card-text">330,000원</p>
                            </div>
                        </a>
                    </div>
                    <div class="card" style="width: 18rem;">
                        <a href="">
                            <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_GAUSS_NC3_2.jpg"
                                class="card-img" alt="...">
                            <div class="card-body">
                                <p class="lens">Blue light protection</p>
                                <h5 class="card-title">가우스 NC3</h5>
                                <p class="card-text">330,000원</p>
                            </div>
                        </a>
                    </div>
                    <div class="card" style="width: 18rem;">
                        <a href="">
                            <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NONN_GR7_2.jpg"
                                class="card-img" alt="...">
                            <div class="card-body">
                                <p class="lens"></p>
                                <h5 class="card-title">엔온 GR7</h5>
                                <p class="card-text">330,000원</p>
                            </div>
                        </a>
                    </div> -->
                              
                    <!-- <div class="card" style="width: 18rem;">
                        <a href="">
                            <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_TTA_01_2.jpg"
                                class="card-img" alt="...">
                            <div class="card-body">
                                <p class="lens">Blue light protection</p>
                                <h5 class="card-title">트레이비 01</h5>
                                <p class="card-text">330,000원</p>
                            </div>
                        </a>
                    </div>
                    <div class="card" style="width: 18rem;">
                        <a href="">
                            <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MM109_G10_1_1.jpg"
                                class="card-img" alt="...">
                            <div class="card-body">
                                <p class="lens"></p>
                                <h5 class="card-title">메종마르지엘라 - MM109</h5>
                                <p class="card-text">330,000원</p>
                            </div>
                        </a>
                    </div>
                    <div class="card" style="width: 18rem;">
                        <a href="">
                            <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MM116_BRC9_1_1.jpg"
                                class="card-img" alt="...">
                            <div class="card-body">
                                <p class="lens"></p>
                                <h5 class="card-title">메종마르지엘라 - MM116</h5>
                                <p class="card-text">330,000원</p>
                            </div>
                        </a>
                    </div> -->
         
                </div>
                
            </div>
            
                <div class="text-center">
                    
                    <button class="btn btn-outline-light mb-5">View More</button>
                </div>
                
            </section>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
        </main>
      	<script src="/viewport_mini_web/resources/js/app.js"></script>
    </body>
</html>