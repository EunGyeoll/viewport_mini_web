//재사용 할 수 있는 것들을 위에 변수 설정
const form1 = document.querySelector("#signupForm");
const id = document.querySelector("#signupId");
const pw1 = document.querySelector("#signupPw");
const pw2 = document.querySelector("#signupPwCheck");
const birth = document.querySelector("#signupBirth");
const phoneNum = document.querySelector("#signupPhoneNum");
const email1 = document.querySelector("#signupEmail1");
const email2 = document.querySelector("#signupEmail2");
const emailSelect = document.querySelector("#emailSelect"); //select
const email3 = document.querySelector("#signupEmail3"); //이메일 직접 입력받는칸
const gender = document.querySelector("input[type=radio]");


//회원가입 버튼을 제출하면 유효성 검사가 실행되도록 addEventListner 사용
form1.addEventListener('submit', function (e) {
    event.preventDefault(); //

    let resultCheck = true; // resultCheck가 true이면 이 유효성검사가 실행되게 한다는 일종의 flag표시

  
    //아이디
    const idPattern = /^[a-z]+[a-z0-9]{4,10}$/g; //영어 대소문자 5~10자

    const idError = document.querySelector("#idError");
    const idResult = idPattern.test(id.value);
    if (idResult) {
        //false인 경우만 resultCheck = false로 설정한다. true인 경우에는 따로 true로 설정하지 않는 이유는 만약 아이디가 false이더라도 밑에서 비밀번호가 true면 유효성검사가 그냥 통과돼버리기 때문.
        idError.innerHTML = "";
    } else {
        idError.innerHTML = "아이디 형식에 맞게 설정해 주세요";
        idError.classList.add("text-danger");
        
        resultCheck = false;
    }

    //패스워드
    const pwPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/; //영어 대문자 소문자 숫자 필수 8~15자

    const pw1Error = document.querySelector("#pw1Error");
    const pw1Result = pwPattern.test(pw1.value);

    const pw2Error = document.querySelector("#pw2Error");
    const pw2Result = pwPattern.test(pw2.value);

    if (pw1Result) {
        pw1Error.innerHTML = "";
    } else {
        pw1Error.innerHTML = "비밀번호 형식에 맞게 설정해 주세요"
        pw1Error.classList.add("text-danger");
        resultCheck = false;
    }


    if (pw2Result && pw1.value == pw2.value) { //pw2가 정규식을 만족하고 pw1과 pw2가 동일하면
        pw2Error.innerHTML = "";
    } else {
        pw2Error.innerHTML = "비밀번호 확인 틀림"
        pw2Error.classList.add("text-danger");
        resultCheck = false;
    }


    //생년월일
    //자동으로 하이픈 추가되게
    //input type number 은 특수문자까지 입력되는 단점이 있다. 그래서 input type number 을 사용하지 않고 문자를 전역적으로 찾아내는 정규식을 사용해서 사용자가 입력한 문자를 삭제한다.
    const birthPattern =  /^(19\d{2}|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/; 
    const birthError = document.querySelector("#birthError");
    const birthResult = birthPattern.test(birth.value);
    console.log(birth.value);
    if (birthResult) {
    
    }
    else {
        birthError.innerHTML = "올바른 생년월일을 입력해 주세요";
        birthError.classList.add("text-danger");
        resultCheck = false;
    }


    //휴대폰 번호
    const phoneNumError = document.querySelector("#phoneNumError");
    // const phoneNumResult = phoneNumPattern.test(phoneNum.value);


    //휴대폰 번호가 공백이거나 0으로 시작하면 에러 문구
    if ( phoneNum.value == "" || phoneNum.value.charAt(0) != 0 ) { //지역번호여야 하기 때문에 휴대폰번호 첫글자가 0으로 시작하지 않으면
        phoneNumError.innerHTML = "올바른 연락처를 입력해 주세요";
        phoneNumError.classList.add("text-danger");
    } else {
        phoneNumError.innerHTML = "";
    }


    //이메일
    const emailPattern = /^[a-zA-Z0-9]*$/; //영어 대소문자와 숫자만 허용
    const emailError = document.querySelector("#emailError");
    const emailResult = emailPattern.test(email1.value);

    if(email1.value == "" || !emailResult) {
        const emailError = document.querySelector("#emailError")
        emailError.innerHTML = "올바른 이메일을 입력해 주세요";
        emailError.classList.add("text-danger");
    }



    //공백 없이 다 입력되었는지 확인하는 함수 실행
    // checkRequired([id, pw1, pw2, birth, phoneNum, email1, email3]); //이 함수는 입력이 필요한 필드들.


    //최종
    if (resultCheck) {
        form1.submit();
    }

});



email2.addEventListener("change", (event) => {
    console.log(event.target.value);
    if (event.target.value == "type") {
        // email3.className = "show"; 
        email3.className = 'show';
    } else {
        email3.className = "display"
    }
});



phoneNum.addEventListener("input", () => {

    // 사용자 입력값은 모두 숫자만 받는다.(나머지는 ""처리)
    let val = phoneNum.value.replace(/\D/g, "");
    let leng = val.length;

    // 출력할 결과 변수
    let result = '';
    //123-4567-89 10 11

    // 
    if (leng < 4) {
        result = val;
    } else if (leng <= 7) {
        result += val.substring(0, 3);
        result += "-";
        result += val.substring(3);
    } else if (leng >= 12) {
        val.substring(8);
    } else {
        result += val.substring(0, 3);
        result += "-";
        result += val.substring(3, 7);
        result += "-";
        result += val.substring(7);
    }
    phoneNum.value = result;
});


//자동으로 하이픈 추가
birth.addEventListener("input", () => {

    // 사용자 입력값은 모두 숫자만 받는다.(문자를 검색해서 ""처리)
    let val = birth.value.replace(/\D/g, "");
    let leng = val.length;

    // 출력할 결과 변수
    let result = '';

    // 5개일때 - 20221 : 바로 출력
    if (leng < 6) result = val;

    // 6~7일 때 - 202210 : 2022-101으로 출력
    else if (leng < 8) {
        result += val.substring(0, 4);
        result += "-";
        result += val.substring(4);
        // 8개 일 때 - 2022-1010 : 2022-10-10으로 출력

    } else {
        result += val.substring(0, 4);
        result += "-";
        result += val.substring(4, 6);
        result += "-";
        result += val.substring(6);
    }

    birth.value = result;
});


