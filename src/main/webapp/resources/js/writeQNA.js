const qnaForm = document.querySelector('#subBtn');

qnaForm.addEventListener('click',(event)=> {

  event.preventDefault();
  let data ={
      qtitle:$('#qtitle').val(),
      qcontent:$('#qcontent').val(),
  }
  
  $(document).ready(function() {
    $('#qnaForm').submit(function(event) {
        // 기본 이벤트 제거
        //event.preventDefault();

        // FormData 생성
        var formData = new FormData();
        formData.append('qtitle', $('#qtitle').val());
        formData.append('quid', $('#quid').val());
        formData.append('qcontent', $('#qcontent').val());
        formData.append('qattach', $('#qattach')[0].files[0]);

        //formData.submit();
        // AJAX 요청 생성
        $.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            url: 'http://localhost:8080/viewport_mini_web/board/writeQNA',
            data: formData,
            processData: false, // 데이터를 query string으로 변환하지 않음
            contentType: false, // Content-Type 헤더를 설정하지 않음
            cache: false, // 캐시 사용하지 않음
            success: function(data) {
                console.log('Success:', data);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
});

  
})
