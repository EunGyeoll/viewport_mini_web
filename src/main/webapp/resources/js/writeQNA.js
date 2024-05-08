const qnaForm = document.querySelector('#subBtn');

qnaForm.addEventListener('click',(event)=> {

  console.log("start")
  event.preventDefault();
  console.log($('#qtitle').val());
  let data ={
      qtitle:$('#qtitle').val(),
      qcontent:$('#qcontent').val(),
  }
  console.log(data);
  
  $.ajax({
    type:"post",
    url:"http://localhost:8080/viewport_mini_web/board/writeQNA",
    data:JSON.stringify(data),
    contentType: "application/json; charset=UTF-8",
    dataType:"json"
  }).done(function(res){
    console.log(res);
  })
  
  
})
