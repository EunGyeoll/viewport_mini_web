
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/viewport_mini_web/resources/css/nav.css">
<link rel="stylesheet" href="/viewport_mini_web/resources/css/signup.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer">
<title>회원가입</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<div class="wrapper">  
    <div class="card">
        <form method="post" name="signupForm" class="signupForm col-xl-7" action="/viewport_mini_web/login" id="signupForm">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="formwrapper">
                    <div class="signup-card text-black">
                        <div class="signuptitle"><b>Sign up!</b></div>
                        <div class="undersignuptitle">회원가입 후 특별한 혜택을 만나보세요.</div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="signupEmail1">이메일</label>
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <div class="form-outline">
                                        <input type="text" id="signupEmail1" class="form-control form-control-md"> 
                                        <small id="emailError"></small>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <div class="form-outline">
                                        <select class="form-control input-sm" name="signupEmail2" id="signupEmail2">
                                            <option value="@gmail.com">@gmail.com</option>
                                            <option value="@naver.com">@naver.com</option>
                                            <option value="@daum.net">@daum.net</option>
                                            <option value="@outlook.com">@outlook.com</option>
                                            <option value="type">직접 입력하기</option>
                                        </select> 
                                        <input type="text" name="signupEmail3" id="signupEmail3" class="form-control hide ">
                                    </div>
                                </div>
                                <div class="col-md-4 mb-4">
                                <button type="button" id="emailCheck" class="emailCheck btn btn-primary" 
								    data-bs-toggle="modal" data-bs-target="#myModal">중복 확인</button>
								</div>

<!-- 모달 창 -->
<div class="modal" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>
                            </div>
                        </div>
                        <div class="column d-flex">
                            <div class="column form-outline mb-4 me-3">
                                <label class="form-label" for="signupPw">비밀번호</label> <input type="password" id="signupPw" placeholder="영어, 숫자 혼용 8~15자" class="form-control form-control-md"> 
                                <small id="pw1Error"></small>
                            </div>
                            <div class="column form-outline mb-4">
                                <label class="form-label" for="signupPwCheck">비밀번호 확인</label> <input type="password" id="signupPwCheck" placeholder="비밀번호 확인을 입력하세요" class="form-control form-control-md"> 
                                <small id="pw2Error"></small>
                            </div>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="signupName">이름</label> <input type="text" id="signupName" class="form-control form-control-md" maxlength="10"> <small id="nameError"></small>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="signupBirth">생일</label> <input type="text" id="signupBirth" class="form-control form-control-md" placeholder="YYYYMMDD" maxlength="10"> <small id="birthError"></small>
                        </div>
                        <div class="form-outline mb-5">
                            <label class="form-label" for="signupPhoneNum">휴대폰 번호</label> <input type="text" id="signupPhoneNum" class="form-control form-control-md" placeholder="숫자를 입력하세요" maxlength="13"> <small id="phoneNumError"></small>
                        </div>
                        <div class="bl_stack form">
                            <div class="el_ttl">주소</div>
                            <div class="bl_stack bl_stack--row">
                                <input type="text" class="el_input hp_txt-center" placeholder="" disabled="" id="zonecode">
                                <button type="button" class="el_btn el_btn--outline hp_shrink-0" id="search-btn" onclick="onClickSearch()">우편번호 찾기</button>
                            </div>
                            <input type="text" class="el_input" placeholder="" disabled="" id="roadAddress"> <input type="text" class="el_input" placeholder="상세주소를 입력해주세요." id="roadAddressDetail">
                        </div>
                        <div class="gender d-md-flex justify-content-start align-items-center mb-4 py-2">
                            <div class="mb-0 me-4"><h6><b>성별:</b></h6></div>
                            <div class="form-check form-check-inline mb-0 me-4">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="femaleGender" value="option1" checked=""> <label class="form-check-label" for="femaleGender">여자</label>
                            </div>
                            <div class="form-check form-check-inline mb-0 me-4">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="maleGender" value="option2"> <label class="form-check-label" for="maleGender">남자</label>
                            </div>
                        </div>
                        <div>
                            <fieldset>
                                <div class="switchbtn mb-4">
                                    <input role="switch" type="checkbox" />
                                    <span>  VIEWPORT의 특별한 소식과 이벤트 수신하기</span>
                            </div>
                            </fieldset>
                        </div>
                        <div class="d-flex justify-content-end pt-3">
                            <button type="reset" data-mdb-button-init="" data-mdb-ripple-init="" class="resetbtn justify-content-center align-content-center"><b>DELETE ALL</b></button>
                            <button type="submit" id="signupButton" data-mdb-button-init="" data-mdb-ripple-init="" class="signupbtn justify-content-center align-content-center"><b>JOIN</b></button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 d-none d-xl-block">
                    <!-- 이미지 -->
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Include your JavaScript files -->
<script src="/viewport_mini_web/resources/js/login.js"></script>
<script src="/viewport_mini_web/resources/js/signup.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
