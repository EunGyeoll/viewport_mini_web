/*$(document).ready(function() {
  $('#createStylesButton').click(function() {
      const productId = ${product.pid}; 
      $.ajax({
          url: '/viewport_mini_web/styles/getStyleDetails',
          type: 'GET',
          data: { pid: productId },
          success: function(response) {
              $('#myModal').modal('show');
          },
          error: function() {
            window.location.href = 'http://localhost:8080/viewport_mini_web/loginForm';
          }
      });
  });
});*/


$(document).ready(function() {
    $("#style-img").click(function() {

        $.ajax({
            url: "/styles/getStyleDetails", 
            type: "GET",
            data: { stid: stid }, 
            success: function(response) {

                $("#myModal").modal("show");
            },
            error: function(error) {
            	console.error('스타일 모달 에러발생: ', error);
            }
        });
    });
});