$('#resetButton').click(function(){ // 초기화 버튼 클릭 시 checkbox 모두 해제
	$('input[type="checkbox"]').prop("checked", false);
});

$('input[type="checkbox"]').click(function(){ // 각각의 checkbox 그룹에 대해 하나만 선택
    const name = $(this).attr('name');
    if (name !== 'shape-option') { // shape-option 그룹은 선택에서 제외
        $('input[type="checkbox"][name="' + name + '"]').not(this).prop('checked', false);
    }
});

function checkForm() { // checkbox ajax
	const checkArray = new Array();
	
	    

}