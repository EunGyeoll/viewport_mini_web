
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="d-flex justify-content-around fixed-top" id="nav">
	<ul class="d-flex" id="nav-logo">
		<li><a href="${pageContext.request.contextPath}/"><span id="nav-logo-text">VIEWPORT</span></a></li>
	</ul>
	<ul id="nav-menu" class="d-flex justify-content-center">
		<li class="h-100"><a href="#"><span class="align-middle">안경</span></a></li>
		<li class="h-100"><a href="#"><span class="align-middle">선글라스</span></a></li>
		<li class="h-100"><a href="${pageContext.request.contextPath}/styles"><span class="align-middle">스타일</span></a></li>
		<li class="h-100"><a href="${pageContext.request.contextPath}/findStores"><span class="align-middle">스토어</span></a></li>
		<%-- <sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
		<li class="h-100"><a href="${pageContext.request.contextPath}/admin"><span class="align-middle">어드민</span></a></li>
		<%-- </sec:authorize> --%>

	</ul>
	<ul class="d-flex justify-content-end" id="nav-icon">

<%-- 		<sec:authorize access="isAnonymous()"> --%>
			<li class="h-100"><a href="${pageContext.request.contextPath}/loginForm"> <span class="align-middle"><i class="fa-solid fa-right-to-bracket" style="color: #000000;"></i></span>
			</a></li>
			<li class="h-100"><a href="${pageContext.request.contextPath}/signup"> <span class="align-middle"><i class="fa-solid fa-user-plus" style="color: #000;"></i></span>
			</a></li>
<%-- 		</sec:authorize>
		<sec:authorize access="isAuthenticated()"> --%>
			<div class="h-100 d-flex align-items-center">
				<div>
					<b class="text-dark me-2"> <sec:authentication property="principal.username" /></b>
				</div>
			</div>
			<%-- 사이트간 요청 위조 방지 설정이 비 활성화되어 있을 경우 GET 방식으로 요청 가능 --%>
			<li class="h-100"><a href="${pageContext.request.contextPath}/cart"> <span class="align-middle"><i class="fa-solid fa-cart-shopping" style="color: #000;"></i></span>
			</a></li>
			<li class="h-100"><a href="${pageContext.request.contextPath}/mypage"> <span class="align-middle"><i class="fa-solid fa-user" style="color: #000000;"></i></span>
			</a></li>


			<li class="h-100"><a href="${pageContext.request.contextPath}/logout"> <span class="align-middle"><i class="fa-solid fa-right-from-bracket" style="color: #000000;"></i></span>
			</a></li>
	<%-- 	</sec:authorize> --%>

	</ul>
</div>




<!-- JS 설정 -->
