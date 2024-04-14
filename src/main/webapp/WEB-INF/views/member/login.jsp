<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/viewport_mini_web/resources/css/login.css" />

    <title>login</title>

</head>

<body >

    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
          
                <div class="col-lg-12 login-title">
                    LOGIN
                </div>
                <div class="col-lg-12 login-form ">
                        <form method="post" id= "idform" action="/viewport_mini_web" class="" onsubmit="loginValidate()" novalidate>
                            <div class="form-group col" >
                                <label class="form-control-label user-select-none">USERNAME</label>
                                <input type="text" name="loginId" id="loginId" placeholder = "ID" class="form-control" >
                                <small class="error-message" id="idError"></small>
                                
                            </div>

                            <div class="form-group col">
                                <label class="form-control-label user-select-none">PASSWORD</label>
                                <input type="password" name="loginPw" id="loginPw"class="form-control" placeholder = "PW"  >
                                <small class="error-message" id="pwError" ></small>
                            </div>

                            <div class="col-lg-12 loginbttm row">
                                <button type="submit" id = "login-btn" class="btn btn-outline-light text-center ">로그인</button>
                            </div>
                            <div class="col-lg-12 mt-3">
                                <input type="checkbox" name="login-remember" id="login-remember">
                                <label class="text-light" for="login-remember">로그인 기억하기</label>
                            </div>
                            <div class="col-lg-12 loginbttm row  mt-5">
                                <small class="text-light signup-info-msg mb-1 user-select-none">VIEWPORT 회원이 아니신가요?</small>
                                <button type="button" onclick="location.href='signup'" id ="signup-btn" class="btn btn-outline-light text-center">회원가입</a></button>
                            </div>
                        
                        </form>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
<script src = "/viewport_mini_web/resources/js/login.js"></script>
</body>
</html>