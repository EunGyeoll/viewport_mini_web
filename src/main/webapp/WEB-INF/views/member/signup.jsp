<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/viewport_mini_web/resources/css/signup.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
    <title>회원가입</title>
</head>



<body>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
    <form method="post" name="signupForm" action="/viewport_mini_web/login" id="signupForm" class="h-100 bg-dark">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                    <div class="card card-registration my-4">
                        <div class="row g-0">
                            <div class="col-xl-6 d-none d-xl-block">
                                <img src="/viewport_mini_web/resources/image/signup.jpg" alt="Sample photo" class="img-fluid" style="height:100%; border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
                            </div>
                            <div class="col-xl-6">
                                <div class="card-body p-md-5 text-black">
                                    <h3 class="mb-5 text-uppercase"><b>회원가입</b></h3>
                                    
                                    
                                    <div data-mdb-input-init class="form-outline mb-4">
                                     <label class="form-label" for="signupEmail">이메일</label>
                                        <!-- 이메일 -->
					<div class="row">
					    <div class="col-md-4 mb-4">
					        <div data-mdb-input-init class="form-outline">
					            <input type="text" id="signupEmail1" class="form-control form-control-lg" />
					            <small id="emailError"></small>
					        </div>
					    </div>
					    <div class="col-md-4 mb-4">
					        <div data-mdb-input-init class="form-outline">
					            <select class="form-control input-sm" name="signupEmail2" id="signupEmail2">
					                <option value="@gmail.com">@gmail.com</option>
					                <option value="@naver.com">@naver.com</option>
					                <option value="@daum.net">@daum.net</option>
					                <option value="@outlook.com">@outlook.com</option>
					                <option value="type">직접 입력하기</option>
					            </select>
					            <input type="text" name="signupEmail3" id="signupEmail3" class="hide" /> <!-- css에서 hide를 설정함 -->
					        </div>
					    </div>
					    <div class="col-md-4 mb-4">
					        <button type="button" id="checkDuplicateEmail" onclick="emailCheck();" class="emailCheck btn btn-primary">중복 확인</button>
					    </div>
					</div>
									                                    
                                    
                                    <!-- 패스워드 -->
                                    <div class="column d-flex">
	                                    <div data-mdb-input-init class="column form-outline mb-4 me-3">
	                                        <label class="form-label" for="signupPw">비밀번호</label>
	                                        <input type="password" id="signupPw" placeholder="영어 대,소문자 숫자 혼용하여 8~15자" class="form-control form-control-lg" />
	                                        <small id="pw1Error"></small>  
	                                    </div>
	                                    <div data-mdb-input-init class="column form-outline mb-4">
	                                        <label class="form-label" for="signupPwCheck">비밀번호 확인</label>
	                                        <input type="password" id="signupPwCheck" placeholder="비밀번호 확인을 입력하세요" class="form-control form-control-lg" />
	                                        <small id="pw2Error"></small>
	                                    </div> 
                                         
                                    </div>
                                    
                                    <!-- 이름 -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="signupName">이름</label>
                                        <input type="text" id="signupName" class="form-control form-control-lg" maxlength="10"/>
                                        <small id="nameError"></small>
                                    </div>
                                    
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="signupBirth">생일</label>
                                        <input type="text" id="signupBirth" class="form-control form-control-lg" placeholder="YYYYMMDD" maxlength="10"/>
                                        <small id="birthError"></small>
                                    </div>
                                    <div data-mdb-input-init class="form-outline mb-5">
                                        <label class="form-label" for="signupPhoneNum">휴대폰 번호</label>
                                        <input type="text" id="signupPhoneNum" class="form-control form-control-lg" placeholder="숫자를 입력하세요" maxlength="13"/>
                                        <small id="phoneNumError"></small>  
                                    </div>
                                    <div class="d-md-flex justify-content-start align-items-center mb-2 py-2">
                                        <h6 class="mb-0 me-4">성별: </h6>
                                        <div class="form-check form-check-inline mb-0 me-4">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="femaleGender" value="option1" checked />
                                            <label class="form-check-label" for="femaleGender">여자</label>
                                        </div>
                                        <div class="form-check form-check-inline mb-0 me-4">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="maleGender" value="option2" />
                                            <label class="form-check-label" for="maleGender">남자</label>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-end pt-3">
                                        <button type="reset" data-mdb-button-init data-mdb-ripple-init class="btn btn-light btn-lg border-"><b>DELETE ALL</b></button>
                                        <button type="submit" id="signupButton" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg ms-2 border-radius: 50px"><b>JOIN</b></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       </div>
    </form>
    <script src="/viewport_mini_web/resources/js/signup.js"></script>
</body>
</html>
 
