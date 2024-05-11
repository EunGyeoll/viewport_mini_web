//웹 페이지 완전히 로드후에 js 함수들이 실행되도록 하기 위해 사용
document.addEventListener('DOMContentLoaded', () => {
    updateTotalPrice();
});


const updateTotalPrice = () => {
    // 배송 옵션 가져오기
    const deliveryOption = document.getElementById('delivery-option');
    let deliveryPrice = 0; // 기본적으로 배송비를 0으로 설정

    // 아이템의 총 가격 계산
    let itemsTotalPrice = cartItems.reduce((total, item) => total + (item.price * item.count), 0);

    // 아이템이 있을 경우에만 배송비 적용
    if (cartItems.length > 0) {
        deliveryPrice = parseInt(deliveryOption.value);
    }

    let totalPrice = itemsTotalPrice + deliveryPrice; // 총 금액 계산
    
    // 총 금액과 배송비 포함 총 금액을 화면에 표시
    const totalPriceElement = document.querySelector('.total-price');
    totalPriceElement.textContent = `${totalPrice.toLocaleString('kr-KR')}원`;
    
    const summaryTotalPriceElement = document.getElementById('total-price');
    summaryTotalPriceElement.textContent = `${totalPrice.toLocaleString('kr-KR')}원`;
};

// -버튼, +버튼을 눌렀을때 해당 아이템의 수량 증가 또는 감소 해야함 하지만 1 아래로는 떨어지지 않음
const editCount = (pid, type) => {
  let quantity = $(`.count-box[data-pid="${pid}"]`).text();
  const newQty = type === 'plus' ? parseInt(quantity) + 1 : parseInt(quantity) - 1;
  
  // newQty가 1이거나 그 이상일 경우에만 ajax가 실행이 되어야함
  if (newQty >= 1) {
      $.ajax({
          url: 'cart/updateQuantity',
          type: 'POST',
          contentType: 'application/json',
          data: JSON.stringify({ cipid: pid, ciqty: newQty }),
          success: function(response) {
            quantity = newQty;
            // 업데이트가 성공적으로 되었으면 js에서도 값을 수정해줘야 새로고침 없이도 값이 반영됨
            $(`.count-box[data-pid="${pid}"]`).text(newQty);
          },
          error: function(error) {
              console.error('아이템 수량 업데이트 중 에러발생: ', error);
          }
      });
  }
};

// 배달 옵션이 바뀌면 호출이 되어 값이 변경됨
const optionSelect = () => {
    updateTotalPrice();
};

// 유저가 카트의 아이템을 삭제 했을때 해당 아이템을 삭제후 다시 아이템 리스트 출력
const removeItem = (productId) => {
  $.ajax({
    url: 'cart/removeProduct',
    type: 'POST',
    contentType: 'application/json',
    data: JSON.stringify({ cipid: productId }), 
    success: function(response) {
      // 성공적으로 제거되면, 해당 제품의 DOM 요소를 제거
      $(`.product-row[data-pid="${productId}"]`).remove();
      alert('제품이 성공적으로 장바구니에서 제거되었습니다.');
    },
    error: function(error) {
      console.error('카트 제품 삭제중 에러 발생:', error);
      alert('제품 제거에 실패하였습니다.');
    }
  });
};


document.getElementById('delivery-option').addEventListener('change', optionSelect);
