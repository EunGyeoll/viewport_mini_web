const el_idform = document.querySelector("#idform");
const idInput = document.querySelector("#loginId");
const pwInput = document.querySelector("#loginPw");

const loginValidate = (event) => {
    event.preventDefault();
    let resultCheck = true;

    if (idInput.value == "") {
        document.querySelector("#idError").innerHTML = "아이디를 입력해 주세요";
        resultCheck = false;
    } else {
        idError.value = "잘 입력함";

    }


    console.log(pwInput.value);
    if (pwInput.value == "") {
        document.querySelector("#pwError").innerHTML = "비밀번호를 입력해 주세요";
        resultCheck = false;
    } else {
        console.log("올바른 비밀번호");
    }
    console.log(idInput.value, pwInput.value);
    if (resultCheck) { el_idform.submit(); }
}

el_idform.addEventListener('submit', loginValidate);