document.addEventListener('DOMContentLoaded', () => {
    // 로그인 폼 유효성 검사
    const loginform = document.querySelector("#loginform");
    const uemail = document.querySelector("#uemail");
    const upassword = document.querySelector("#upassword");
    const idError = document.querySelector("#idError");
    const pwError = document.querySelector("#pwError");

    const loginValidate = (event) => {
        event.preventDefault();
        let resultCheck = true;

        if (uemail.value === "") {
            idError.innerHTML = "아이디를 입력해 주세요";
            idError.classList.add("text-danger");
            resultCheck = false;
        } else {
            idError.innerHTML = ""; // 오류 메시지 초기화
        }

        if (upassword.value === "") {
            pwError.innerHTML = "비밀번호를 입력해 주세요";
            pwError.classList.add("text-danger");
            resultCheck = false;
        } else {
            pwError.innerHTML = ""; // 오류 메시지 초기화
        }

        if (resultCheck) { 
            loginform.submit(); 
        }
    };

    loginform.addEventListener('submit', loginValidate);

    // "비밀번호를 잊으셨나요?" 링크를 클릭했을 때 모달에 포커스를 주는 JavaScript 코드
    const forgotpw = document.getElementById('forgotPw');
    const forgotPasswordModal = document.getElementById('forgotPasswordModal');

    // 링크를 클릭했을 때 모달을 표시하는 이벤트 리스너
    forgotpw.addEventListener('click', () => {
        $('#forgotPasswordModal').modal('show');
    });

    // 임시 비밀번호 생성 및 발급
    window.generateRandomString = function() {
        const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
        let randomStr = "";
        for (let i = 0; i < 10; i++) {
            let randomIndex = Math.floor(Math.random() * chars.length);
            randomStr += chars[randomIndex];
        }

        // 사용자 입력 정보 가져오기
        var name = document.getElementById('findPwName').value;
        var email = document.getElementById('findPwEmail').value;
        var phoneNumber = document.getElementById('findPwPhonenumber').value;

        // 사용자 정보를 객체로 생성 (필요한 필드들을 모두 포함)
        var userData = {
            uname: name,
            uemail: email,
            uphonenumber: phoneNumber,
            // 추가 필드들을 여기에 포함
            // 예시: ussn: document.getElementById('findPwSsn').value
        };

        // 백엔드로 데이터 전송하여 일치 여부 확인 및 임시 비밀번호 업데이트
        fetch('/findPw', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(userData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 일치하는 경우 임시 비밀번호 출력
                document.getElementById('random').innerText = '임시 비밀번호: ' + data.temporaryPassword;
            } else {
                // 일치하지 않는 경우 메시지 표시
                document.getElementById('random').innerText = '일치하는 정보가 없습니다.';
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    };
});












/*const loginform = document.querySelector("#loginform");
const uemail = document.querySelector("#uemail");
const upassword = document.querySelector("#upassword");
const idError = document.querySelector("#idError");
const pwError = document.querySelector("#pwError");

document.addEventListener('DOMContentLoaded', () => {
    // 로그인 폼 유효성 검사
    const loginform = document.querySelector("#loginform");
    const uemail = document.querySelector("#uemail");
    const upassword = document.querySelector("#upassword");
    const idError = document.querySelector("#idError");
    const pwError = document.querySelector("#pwError");

    const loginValidate = (event) => {
        event.preventDefault();
        let resultCheck = true;

        if (uemail.value === "") {
            idError.innerHTML = "아이디를 입력해 주세요";
            idError.classList.add("text-danger");
            resultCheck = false;
        } else {
            idError.innerHTML = ""; // 오류 메시지 초기화
        }

        if (upassword.value === "") {
            pwError.innerHTML = "비밀번호를 입력해 주세요";
            pwError.classList.add("text-danger");
            resultCheck = false;
        } else {
            pwError.innerHTML = ""; // 오류 메시지 초기화
        }

        if (resultCheck) { 
            loginform.submit(); 
        }
    };

    loginform.addEventListener('submit', loginValidate);

    // "비밀번호를 잊으셨나요?" 링크를 클릭했을 때 모달에 포커스를 주는 JavaScript 코드
    const forgotpw = document.getElementById('forgotPw');
    const forgotPasswordModal = document.getElementById('forgotPasswordModal');

    // 링크를 클릭했을 때 모달을 표시하는 이벤트 리스너
    forgotpw.addEventListener('click', () => {
        $('#forgotPasswordModal').modal('show');
    });

    // 임시 비밀번호 생성 및 발급
    window.generateRandomString = function() {
        const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
        let randomStr = "";
        for (let i = 0; i < 10; i++) {
            let randomIndex = Math.floor(Math.random() * chars.length);
            randomStr += chars[randomIndex];
        }

        // 사용자 입력 정보 가져오기
        var name = document.getElementById('findPwName').value;
        var email = document.getElementById('findPwEmail').value;
        var phoneNumber = document.getElementById('findPwPhonenumber').value;

        // 사용자 정보를 객체로 생성 (필요한 필드들을 모두 포함)
        var userData = {
            uname: name,
            uemail: email,
            uphonenumber: phoneNumber,
            // 추가 필드들을 여기에 포함
            // 예시: ussn: document.getElementById('findPwSsn').value
        };

        // 백엔드로 데이터 전송하여 일치 여부 확인 및 임시 비밀번호 업데이트
        fetch('/findPw', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(userData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 일치하는 경우 임시 비밀번호 출력
                document.getElementById('random').innerText = '임시 비밀번호: ' + data.temporaryPassword;
            } else {
                // 일치하지 않는 경우 메시지 표시
                document.getElementById('random').innerText = '일치하는 정보가 없습니다.';
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    };
});



//"비밀번호를 잊으셨나요?" 링크를 클릭했을 때 모달에 포커스를 주는 JavaScript 코드
const forgotpw = document.getElementById('forgotPw');
const forgotPasswordModal = document.getElementById('forgotPasswordModal');

// 링크를 클릭했을 때 모달을 표시하는 이벤트 리스너	
forgotpw.addEventListener('click', () => {
    $('#forgotPasswordModal').modal('show');
});


//임시 비밀번호 발급
//버튼의 onclick="generateRandomString()"임
	function generateRandomString() {
	    const chars =
	      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
	    let randomStr = "";
	    for (let i = 0; i < 10; i++) {
	      let randomIndex = Math.floor(Math.random() * chars.length);
	      randomStr += chars[randomIndex];
	    }
	    let random = document.getElementById("random");
	    random.innerText = randomStr;
	
	    console.log(randomStr);	
	  }
	



	//임시비밀번호 생성 메소드
	function generateRandomString() {
	    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
	    let randomStr = "";
	    for (let i = 0; i < 10; i++) {
	        let randomIndex = Math.floor(Math.random() * chars.length);
	        randomStr += chars[randomIndex];
	    }

    // 사용자 입력 정보 가져오기 (해당 변수들 아래에 사용)
    var name = document.getElementById('findPwName').value;
    var email = document.getElementById('findPwEmail').value;
    var phoneNumber = document.getElementById('findPwPhonenumber').value;

    // 사용자 정보를 객체로 생성
    var userData = {
            uname: name,
            uemail: email,
            uphonenumber: phoneNumber
        };
    
    // 백엔드로 데이터 전송하여 일치 여부 확인
    fetch('/findPw', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(userData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // 일치하는 경우 임시 비밀번호 출력
            document.getElementById('random').innerText = '임시 비밀번호: ' + randomStr;
        } else {
            // 일치하지 않는 경우 메시지 표시
            document.getElementById('random').innerText = '일치하는 정보가 없습니다.';
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}




//비밀번호 찾기에서 입력한 정보들이 일치하면
function generateRandomString() {
    var name = document.getElementById('findPwName').value;
    var email = document.getElementById('findPwEmail').value;
    var birth = document.getElementById('findPwBirth').value;

    // 사용자가 입력한 정보를 객체로 생성
    var userData = {
        name: name,
        email: email,
        birth: birth
    };

    // 서버로 데이터를 전송하여 비교하고 처리
    fetch('/checkUserData', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(userData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // 일치하는 경우 임시 비밀번호 출력
            document.getElementById('random').innerText = '임시 비밀번호: ' + data.randomPassword;
        } else {
            // 일치하지 않는 경우 메시지 표시
            document.getElementById('random').innerText = '일치하는 정보가 없습니다.';
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}
*/