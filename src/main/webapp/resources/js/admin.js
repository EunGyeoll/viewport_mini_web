//const modal = document.querySelector('#userModal');
//const myModal = document.querySelectorAll('.userDataEditBtn');
//const myInput = document.getElementById('myInput');
//const deleteModalFooter = document.getElementById('delete-model-footer');
// 
//    function clickEvent(index,userName,userEmail,userRole) {
//      modal.innerHTML=`<div data-mdb-input-init class="form-outline mb-4">
//        <label class="form-label" for="userNum">유저 번호</label> 
//        <input type="text" id="userNum" class="form-control form-control-lg" value="${index}" readonly/>
//      </div>
//        <div data-mdb-input-init class="form-outline mb-4">
//        <label class="form-label" for="userName">유저 이름</label>
//        <input type="text" id="userName" class="form-control form-control-lg" value="${userName}"/> <small id="birthError"></small>
//      </div>
//        <div data-mdb-input-init class="form-outline mb-4">
//        <label class="form-label" for="userId">아이디</label>
//        <input type="text" id="userId" class="form-control form-control-lg" value="${userEmail}"/> <small id="birthError"></small>
//      </div>
//        <div data-mdb-input-init class="form-outline mb-4">
//        <label class="form-label" for="UserRole">역할</label>
//        <input type="text" id="UserRole" class="form-control form-control-lg" value="${userRole}"/> <small id="birthError"></small>
//      </div>
//      <button  type="submit" class="btn btn-dark" data-bs-dismiss="modal">수정</button>
//      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
//      `
//    }
//    function deleteBtn(index) {
//      console.log(index-1);
//    }
//    function deleteUserData(index) {
//      console.log(index);
//      deleteModalFooter.innerHTML =`<button type="button" onclick="deleteBtn(${index})" class="btn btn-dark">삭제</button>
//          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
//    }
//    
//    function tempDisplayData(data){
//      $('#user-table-body').append(`<tr>
//          <th scope="row">${data.uid}</th>
//          <td>${data.uname}</td>
//          <td>${data.uemail}</td>
//          <c:if test="${data.urole == 'User'}">
//            <td>User</td>
//          </c:if>
//          <td>010-0000-0000</td>
//          <td><fmt:formatDate value="${data.editDate}" pattern="yyyy-MM-dd" /></td>
//          <td>
//            <button type="button" class="btn btn-dark edit-btn btn-sm userDataEditBtn" onclick="clickEvent(${data.uid},'${data.uname}','${data.uemail}','${data.urole}')" data-bs-toggle="modal" data-bs-target="#editUserModal">회원 정보 수정</button>
//            <button class="btn btn-danger edit-btn btn-sm" data-bs-toggle="modal" onclick="deleteUserData(${data.uid})" data-bs-target="#deleteUserModal">삭제</button>
//          </td>
//        </tr>`);
//      
//    }
//    
//    
//    function createUserDataEvent(data){
//      const uid=$('tr').length; //이거 추후에 제거 해야함 임시로 사용하는것
//      const uname = $("#uname").val();
//      const urole= $('#urole').val();
//      const uemail = $('#uemail').val();
//
//      const userDataTemp = {uid,uname,urole,uemail,upassowrd};
//      console.log(userDataTemp);
//      $.ajax({
//        url: "createUserData",
//        type: "post",
//        data: userDataTemp,
//        success: function (data) {
//          document.querySelector('#userForm').reset();
//          console.log(data); 
//          tempDisplayData(data);
//        // location.replace("/viewport_mini_web/admin/users");
//        }
//      });
//    }
//    
//    function editUserDataEvent(data){
//      const uname = $("#uname").val();
//      const urole= $('#urole').val();
//      const uemail = $('#uemail').val();
//
//      const userDataTemp = {uid,uname,urole,uemail};
//      console.log(userDataTemp);
//      $.ajax({
//        url: "editUserData",
//        type: "post",
//        data: userDataTemp,
//        success: function (data) {
//          
//          console.log(data); 
//          tempDisplayData(data);
//        }
//      });
//    }
//    
//	const dataTransfer = new DataTransfer();
//
//    $("#pattach").change(function(){
//       
//        let fileArr = document.getElementById("pattach").files
//
//        if(fileArr != null && fileArr.length>0){
//
//          // =====DataTransfer 파일 관리========
//            for(var i=0; i<fileArr.length; i++){
//                dataTransfer.items.add(fileArr[i])
//            }
//            document.getElementById("pattach").files = dataTransfer.files;       
//        }
//         
//    })
//
// 
//    