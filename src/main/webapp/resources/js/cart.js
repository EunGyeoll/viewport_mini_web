document.addEventListener('DOMContentLoaded', () => {
    updateTotalPrice();  // 초기 가격 업데이트
});

// 아이템의 총 가격과 배송비를 계산하여 업데이트
const updateTotalPrice = () => {
    const deliveryOption = document.getElementById('delivery-option');
    let deliveryPrice = parseFloat(deliveryOption.value);
    let itemsTotalPrice = Array.from(document.querySelectorAll('.product-row')).reduce((total, item) => {
        const price = parseFloat(item.querySelector('.col[data-price]').getAttribute('data-price'));
        const quantity = parseInt(item.querySelector('.count-box').textContent);
        return total + (price * quantity);
    }, 0);

    let totalPrice = itemsTotalPrice + deliveryPrice;
    document.querySelector('.total-price').textContent = `${itemsTotalPrice.toLocaleString('kr-KR')} 원`;
    document.getElementById('total-price').textContent = `${totalPrice.toLocaleString('kr-KR')} 원`;
};

// 수량 변경 처리
const editCount = (pid, type) => {
  let countBox = document.querySelector(`.count-box[data-pid="${pid}"]`);
  let quantity = parseInt(countBox.textContent);
  const newQty = type === 'plus' ? quantity + 1 : quantity - 1;

  if (newQty >= 1) {
      $.ajax({
          url: 'cart/updateQuantity',
          type: 'POST',
          contentType: 'application/json',
          data: JSON.stringify({ cipid: pid, ciqty: newQty }),
          success: function(response) {
            countBox.textContent = newQty;
            updateTotalPrice();  
          },
          error: function(error) {
              console.error('아이템 수량 업데이트 중 에러발생: ', error);
          }
      });
  }
};

// 아이템 삭제 처리
const removeItem = (productId) => {
  $.ajax({
    url: 'cart/removeProduct',
    type: 'POST',
    contentType: 'application/json',
    data: JSON.stringify({ cipid: productId }), 
    success: function(response) {
      $(`.product-row[data-pid="${productId}"]`).remove();
      updateTotalPrice();  
    },
    error: function(error) {
      console.error('카트 제품 삭제중 에러 발생:', error);
      alert('제품 제거에 실패하였습니다.');
    }
  });
};

document.getElementById('delivery-option').addEventListener('change', updateTotalPrice); 
