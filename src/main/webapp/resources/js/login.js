const el_idform = document.querySelector("#idform");
const idInput = document.querySelector("#loginId");
const pwInput = document.querySelector("#loginPw");



console.log(idInput.value);

const loginValidate = (event) => {
    event.preventDefault();
    let resultCheck = true;

    if (idInput.value == "") {
        document.querySelector("#idError").innerHTML = "아이디를 입력해 주세요";
        idError.classList.add("text-danger");
        resultCheck = false;

    } else {
        idError.value = "";

    }


    console.log(pwInput.value);
    if (pwInput.value == "") {
        document.querySelector("#pwError").innerHTML = "비밀번호를 입력해 주세요";
        pwError.classList.add("text-danger");
        resultCheck = false;
        
    } else {
        console.log("올바른 비밀번호");
        pwError.value = "";
    }
    console.log(idInput.value, pwInput.value);

    if (resultCheck) { el_idform.submit(); }

}

el_idform.addEventListener('submit', loginValidate);



//옆으로 넘기는 기능
const signUpBtn = document.getElementById("signUp");
const seeMoreBtn = document.getElementById("seeMore");
const container = document.querySelector(".container");

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});
signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
}); 