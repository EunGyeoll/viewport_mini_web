$(document).ready(function() {
	$("#style-img").click(function() {
		const stid = $(this).data("stid"); 
		$.ajax({
			url: "/styles/getStyleDetails",
			type: "GET",
			data: {stid: stid},
			success: function(response) {
				const data = JSON.parse(response);
				
				$("#styleModalImg").attr("src", data.imageUrl);
				$("#myModal").modal("show");
			},
			error: function(xhr, status, error) {
                // 에러 발생 시 처리할 내용
                console.error("Error:", error);
			}
		})
	})
})