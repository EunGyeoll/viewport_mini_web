//웹 페이지 완전히 로드후에 js 함수들이 실행되도록 하기 위해 사용
document.addEventListener('DOMContentLoaded', () => {
    displayCartItems();
    updateTotalPrice();
});
//카트에 담긴 리스트들 예시
const cartItems = [
    {
        title: "몬타 01",
        price: 330000,
        count: 1,
        category: "Sunglasses",
        lens: "Blue light protection",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_GC10_2.jpg"
    },
    {
        title: "가우스 NC3",
        price: 330000,
        count: 1,
        category: "Sunglasses",
        lens: "Blue light protection",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_GAUSS_NC3_2.jpg"
    },
    {
        title: "메종마르지엘라 - MM116",
        price: 330000,
        count: 1,
        category: "Glasses",
        lens: "",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MM116_BRC9_1_1.jpg"
    },
];


//카트에 담은 아이템들을 출력하는 함수
const displayCartItems = () => {
    const cartItemsList = document.getElementById('cart-list-container');
    const itemNum = document.getElementById('num-of-items');
    cartItemsList.innerHTML = ''; // 기존의 내용을 클리어.
    let totalPrice = 0; // 배달비를 제외한 전체 가격

    if (cartItems.length === 0) {
        // 아이템이 없을 경우 "장바구니가 비어있습니다." 메시지를 표시
      itemNum.innerHTML= `<span>${cartItems.length} items</span>`;
        cartItemsList.innerHTML = '<div class="row main align-items-center"><div class="col text-center">장바구니가 비어있습니다.</div></div>';
        updateTotalPrice(0); // 장바구니가 비었을 경우 총 금액을 0으로 업데이트
    } else {
        itemNum.innerHTML= `<span>${cartItems.length} items</span>`; // 카트에 아이템이 있을 경우 아이템의 수를 표시해줄 span태그 추가
        cartItems.forEach((item, index) => {
            const itemHTML = `
                <div class="row main align-items-center">
                    <div class="col-2"><img class="img-fluid" src="${item.imgSrc}"></div>
                    <div class="col">
                        <div class="row text-muted">${item.category}</div>
                        <div class="row">${item.title}</div>
                    </div>
                    <div class="col">
                        <button onclick='editCount(${index}, "minus")' class="btn">-</button>
                        <span class="border count-box">${item.count}</span>
                        <button onclick='editCount(${index}, "plus")' class="btn">+</button>
                    </div>
                    <div class="col">${(parseInt(item.price) * item.count).toLocaleString('kr-KR')}원 <span class="item-close-btn" onclick="removeItem(${index})">&#10005;</span></div>
                </div>
            `;
 
            cartItemsList.innerHTML += itemHTML;
            totalPrice += parseInt(item.price) * item.count;
        });

        updateTotalPrice(totalPrice); // 배달비를 포함해야하므로 총 금액 업데이트
    }
};


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
const editCount = (index, type) => {
    if (type === 'plus') {
        cartItems[index].count += 1;
    } else if (type === 'minus' && cartItems[index].count > 1) {
        cartItems[index].count -= 1;
    }
    displayCartItems();
};

//배달 옵션이 바뀌면 호출이 되어 값이 변경됨
const optionSelect = () => {
    updateTotalPrice();
};
// 유저가 카트의 아이템을 삭제 했을때 해당 아이템을 삭제후 다시 아이템 리스트 출력
const removeItem = (index) => {
    cartItems.splice(index, 1);
    displayCartItems();
};

document.getElementById('delivery-option').addEventListener('change', optionSelect);
