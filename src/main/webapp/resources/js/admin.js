const modal = document.querySelector('#userModal');
const myModal = document.querySelectorAll('.userDataEditBtn');
const myInput = document.getElementById('myInput');
const deleteModalFooter = document.getElementById('delete-model-footer');

const deleteProductModalFooter = document.getElementById('deleteProduct-modal-footer');
const editProductModal = document.querySelector('#productModal'); 

    function clickEvent(usid,uemail,uname,uphonenumber,uaddress,uaddressdetail,ugender,urole) {
      modal.innerHTML=`<div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userNum">유저 번호</label> 
        <input type="text" id="userNum" name="usid" class="form-control form-control-lg" value="${usid}" readonly/>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userName">유저 이름</label>
        <input type="text" id="userName" name="uname" class="form-control form-control-lg" value="${uname}"/> <small id="birthError"></small>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">아이디</label>
        <input type="text" id="userId" name="uemail"class="form-control form-control-lg" value="${uemail}"/> <small id="birthError"></small>
      </div>
          <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">주소</label>
        <input type="text" id="userAddress" name="uaddress" class="form-control form-control-lg" value="${uaddress}"/> <small id="birthError"></small>
      </div>
          <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">상세주소</label>
        <input type="text" id="userAddressDetail" name="uaddressdeatil" class="form-control form-control-lg" value="${uaddressdetail}"/> <small id="birthError"></small>
      </div>
         <div data-mdb-input-init class="form-outline mb-4">
        <label class="form-label" for="userId">연락처</label>
        <input type="text" id="uphonenumber" name="uphonenumber"class="form-control form-control-lg" value="${uphonenumber}"/> <small id="birthError"></small>
      </div>
        <div data-mdb-input-init class="form-outline mb-4">
              <label class="form-label" for="ugender">성별</label> <input type="radio" id="man" name="ugender" value="true" ${ugender=== 'true'? "checked" : ""} />남자 <input type="radio" id="woman" name="ugender" value="false" ${ugender==='false' ? "checked" : ""} />여자 <small id="birthError"></small>
            </div>
       <div data-mdb-input-init class="form-outline mb-4">
           <label class="form-label" for="urole">역할</label> 
           <input type="radio" id="admin" name="urole" value="ROLE_ADMIN" ${urole === "ROLE_ADMIN" ? "checked" : ""}/> 관리자 <input type="radio" id="user" name="urole" value="ROLE_USER" ${urole==="ROLE_USER"? "checked" : ""} /> 유저 <small id="birthError"></small>
       </div>
      <button  type="submit" class="btn btn-dark" data-bs-dismiss="modal">수정</button>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      `
    }
    function deleteBtn(index) {
      
    }
    function deleteUserData(usid) {
      console.log(usid);
      deleteModalFooter.innerHTML =`<button type="submit"  name="usid" value="${usid}" class="btn btn-dark">삭제</button>
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
    }
    
// function tempDisplayData(data){
// $('#user-table-body').append(`<tr>
// <th scope="row">${data.uid}</th>
// <td>${data.uname}</td>
// <td>${data.uemail}</td>
// <c:if test="${data.urole == 'User'}">
// <td>User</td>
// </c:if>
// <td>010-0000-0000</td>
// <td><fmt:formatDate value="${data.editDate}" pattern="yyyy-MM-dd" /></td>
// <td>
// <button type="button" class="btn btn-dark edit-btn btn-sm userDataEditBtn"
// onclick="clickEvent(${data.uid},'${data.uname}','${data.uemail}','${data.urole}')"
// data-bs-toggle="modal" data-bs-target="#editUserModal">회원 정보 수정</button>
// <button class="btn btn-danger edit-btn btn-sm" data-bs-toggle="modal"
// onclick="deleteUserData(${data.uid})"
// data-bs-target="#deleteUserModal">삭제</button>
// </td>
// </tr>`);
//      
// }
    
    
// function createUserDataEvent(data){
// const uid=$('tr').length; //이거 추후에 제거 해야함 임시로 사용하는것
// const uname = $("#uname").val();
// const urole= $('#urole').val();
// const uemail = $('#uemail').val();
//
// const userDataTemp = {uid,uname,urole,uemail,upassowrd};
// console.log(userDataTemp);
// $.ajax({
// url: "createUserData",
// type: "post",
// data: userDataTemp,
// success: function (data) {
// document.querySelector('#userForm').reset();
// console.log(data);
// tempDisplayData(data);
// // location.replace("/viewport_mini_web/admin/users");
// }
// });
// }
    
    function editUserDataEvent(data){
      const uname = $("#uname").val();
      const urole= $('#urole').val();
      const uemail = $('#uemail').val();

      const userDataTemp = {uid,uname,urole,uemail};
      console.log(userDataTemp);
      $.ajax({
        url: "editUserData",
        type: "post",
        data: userDataTemp,
        success: function (data) {
          
          console.log(data); 
          tempDisplayData(data);
        }
      });
    }
//    
// const dataTransfer = new DataTransfer();
//
// $("#pattach").change(function(){
//       
// let fileArr = document.getElementById("pattach").files
//
// if(fileArr != null && fileArr.length>0){
//
// // =====DataTransfer 파일 관리========
// for(var i=0; i<fileArr.length; i++){
// dataTransfer.items.add(fileArr[i])
// }
// document.getElementById("pattach").files = dataTransfer.files;
// }
//         
// })
    
    function clickEventProduct(pname, pprice,pinfo, pdetail, pcatno){
    	editProductModal.innerHTML=`<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="pname">상품 이름</label> 
							<input type="text" id="pname" name="pname" class="form-control form-control-lg" /> <small id="nameError"></small>
						</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="pprice">가격</label> <input
							type="text" id="pprice" name="pprice"
							class="form-control form-control-lg" /> <small id="priceError"></small>
					</div>

					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="pinfo">상품 설명</label> <input
							type="text" id="pinfo" name="pinfo"
							class="form-control form-control-lg" /> <small id="infoError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="pdetail">상품 상세 설명</label> <input
							type="text" id="pdetail" name="pdetail"
							class="form-control form-control-lg" /> <small id="detailError"></small>
					</div>
					<div data-mdb-input-init class="form-outline mb-4">
						<label class="form-label" for="pcatno">카테고리</label> <input
							type="text" id="pcatno" name="pcatno"
							class="form-control form-control-lg" /> <small
							id="categoryError"></small>
					</div>

				</div>
					<button  type="submit" class="btn btn-dark" data-bs-dismiss="modal">수정</button>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
    }
    
    function deleteProduct(pid) {
    	deleteProductModalFooter.innerHTML=`<button type="submit" name="pid" value="${pid}" class="btn btn-dark">삭제</button>
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
    }

 
//<div data-mdb-input-init class="form-outline mb-4">
//<label class="form-label" for="pattach">썸네일 사진</label> <input
//	type="file" id="pattach" name="pattach"
//	class="form-control form-control-lg" /> <small id="imageError"></small>
//</div>
//<div data-mdb-input-init class="form-outline mb-4">
//<label class="form-label" for="ptattach">상품 사진</label> <input
//	type="file" id="ptattach" name="ptattach"
//	class="form-control form-control-lg" multiple="multiple" /> <small
//	id="imageError"><a href="#">file1</a></small>
//</div>