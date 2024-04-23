const form1 = document.querySelector("#payment-form");
const phoneNum = document.querySelector("#payment-phonenumber");
const deliveryChoice = document.querySelector("input[type=radio]");


// 배송 메세지 직접 입력 
$(function() {
    $('#deliverySelect-direct').hide();

    $('#deliverySelect').change(function() {
        //직접 입력 클릭 시 나타남
        if($('#deliverySelect').val() == "deliveryDirect") {
            $('#deliverySelect-direct').show();
        }  else {
            $('#deliverySelect-direct').hide();
        }
    }); 
});



//회원가입 버튼을 제출하면 유효성 검사가 실행되도록 addEventListner 사용
form1.addEventListener('submit', function (e) {
    event.preventDefault();

    let resultCheck = true; // resultCheck가 true이면 이 유효성검사가 실행되게 한다는 일종의 flag표시


    //휴대폰 번호
    const phoneNumError = document.querySelector("#payment-phonenumber-error");


    //휴대폰 번호가 공백이거나 0으로 시작하면 에러 문구
    if ( phoneNum.value == "" || phoneNum.value.charAt(0) != 0 ) { //지역번호여야 하기 때문에 휴대폰번호 첫글자가 0으로 시작하지 않으면
        phoneNumError.innerHTML = "올바른 연락처를 입력해 주세요";
        phoneNumError.classList.add("text-danger");
    } else {
        phoneNumError.innerHTML = "";
    }

    //공백 없이 다 입력되었는지 확인하는 함수 실행
    // checkRequired([phoneNum]); //이 함수는 입력이 필요한 필드들.

    //최종
    if (resultCheck) {
        form1.submit();
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