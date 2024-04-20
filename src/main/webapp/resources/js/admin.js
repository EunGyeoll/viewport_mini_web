  const modal = document.querySelector('#userModal');
  const myModal = document.querySelectorAll('.userDataEditBtn');
  const myInput = document.getElementById('myInput');
  const deleteModalFooter = document.getElementById('delete-model-footer');
  
    function clickEvent(index,userName,userEmail,userRole) {
      modal.innerHTML=`<div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userNum">유저 번호</label> 
        <input type="text" id="userNum" class="form-control form-control-lg" value="${index}" readonly/>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userName">유저 이름</label>
        <input type="text" id="userName" class="form-control form-control-lg" value="${userName}"/> <small id="birthError"></small>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">아이디</label>
        <input type="text" id="userId" class="form-control form-control-lg" value="${userEmail}"/> <small id="birthError"></small>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="UserRole">역할</label>
        <input type="text" id="UserRole" class="form-control form-control-lg" value="${userRole}"/> <small id="birthError"></small>
      </div>
      <button  type="submit" class="btn btn-dark" data-bs-dismiss="modal">수정</button>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      `
    }
    function deleteBtn(index) {
      console.log(index-1);
    }
    function deleteUserData(index) {
      console.log(index);
      deleteModalFooter.innerHTML =`<button type="button" onclick="deleteBtn(${index})" class="btn btn-dark">삭제</button>
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
      
    }