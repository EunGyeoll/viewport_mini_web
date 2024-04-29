
    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <div class="d-flex justify-content-around fixed-top" id="nav">
        <ul class="d-flex" id="nav-logo">
            <li><a href="${pageContext.request.contextPath}/"><span id="nav-logo-text">VIEWPORT</span></a></li>
        </ul>
        <ul id="nav-menu" class="d-flex justify-content-center">
            <li class="h-100"><a href="#"><span class="align-middle">안경</span></a></li>
            <li class="h-100"><a href="#"><span class="align-middle">선글라스</span></a></li>
            <li class="h-100"><a href="${pageContext.request.contextPath}/styles"><span class="align-middle">스타일</span></a></li>
            <li class="h-100"><a href="${pageContext.request.contextPath}/findStores"><span class="align-middle">스토어</span></a></li>
        </ul>
        <ul class="d-flex justify-content-end" id="nav-icon">
                <li class="h-100"><a href="#">
                    <span class="align-middle"><i class="fa-solid fa-magnifying-glass" style="color: #000;"></i></span>
                </a></li>
                <li class="h-100"><a href="${pageContext.request.contextPath}/login">
                    <span class="align-middle"><i class="fa-solid fa-user" style="color: #000;"></i></span>
                </a></li>
                <li class="h-100"><a href="${pageContext.request.contextPath}/signup">
                    <span class="align-middle"><i class="fa-solid fa-user-plus" style="color: #000;"></i></span>
                </a></li>
                <li class="h-100"><a href="${pageContext.request.contextPath}/cart">
                    <span class="align-middle"><i class="fa-solid fa-cart-shopping" style="color: #000;"></i></span>
                </a></li>

        </ul>        
    </div>

    
    

    <!-- JS 설정 -->
 