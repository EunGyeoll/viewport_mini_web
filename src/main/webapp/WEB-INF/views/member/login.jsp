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

<body>
<div class="wrapper">
    <div class="container">
        <div class="sign-up-container">
            <!-- <form action="">
                <button class="submit"><span class="entypo-lock"><i class="fa fa-lock"></i></span></button>
                <span class="entypo-user inputUserIcon">
                   <i class="fa fa-user"></i>
                 </span>
                <input type="text" class="user" placeholder="ursername" class="logininput"/>
                <span class="entypo-key inputPassIcon">
                   <i class="fa fa-key"></i>
                 </span>
                <input type="password" class="pass" placeholder="password" class="logininput"/>
            </form> -->
        </div>
        
        <div class="sign-in-container">
            <form>
                <h1 class="logintitle"><b>Sign In</b></h1>

                <input type="email" placeholder="Email" class="logininput mb-4">
                <span class="inputUserIcon">
                   <i class="fa fa-key"></i>
               </span> 
                <input type="password" placeholder="Password" class="logininput mb-4">

                <div class="login-remember mb-4 mt-3">
                     <input type="checkbox" name="login-remember" id="login-rememberbox"> 
                    <label for="login-remember"><h5>Remember ID</h5></label>
                </div>
                
                <!-- <div class="social-links">
                    <div>
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    </div>
                    <div>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    </div>
                    <div>
                        <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                    </div>
                </div> -->

                <div class="width: 300px mb-3 ">
                  <button class="form_btn_login justify-content-center align-content-center">LOGIN</button>
                </div>

                

                <div class="width: 300px mb-3 ">
                    <button class="form_btn_signup justify-content-center align-content-center">SIGN UP</button>
                  </div> 

                <div class="kakaologin mt-3">
                  <img src="./image/kakaotalkcircle.png" class="height: 30px width:30px;">
                </div>
                

                <div class="forgot row mt-5 mb-5">
                  <div class="col text-center">
                      <a href="#" class="forgotpassword"><b>Forgot Password?</b></a>
                  </div>
               </div>
            </form>
        </div>
        
        <div class="overlay-container">
            <div class="overlay-left">
                <h2>V I E W P O R T</h2>
                <p>To keep connected with us, please login with your personal info</p>
                <button id="signIn" class="overlay_btn">Sign In</button>
            </div>
            <div class="overlay-right">
                <h2>V I E W P O R T</h2>
                 <button id="signUp" class="overlay_btn"></button>
            </div>
        </div>
    </div>
</div>
<script src = "./newlogin.js"></script>
</body>
</html>