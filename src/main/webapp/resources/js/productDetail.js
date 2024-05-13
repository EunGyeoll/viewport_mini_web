//
//
////상품
//const product = {
//        title: "몬타 04",
//        price: 330000,
//        category: "Sunglasses",
//        lens: "Blue light protection",
//        info: "VIEWPORT의 2024년 컬렉션을 통해 선보이는 몬타 04 선글라스를 소개합니다. 현대적인 터치를 담은 스퀘어 실루엣에 강렬한 레드 컬러가 특징이며, 반투명 템플에 결합된 메탈 아이콘 디테일이 돋보이는 아이템입니다.",
//        infoDetail: "레드 색상 반투명 아세테이트 프레임",
//        imageSrcs: [
//            {imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_1.jpg"}
//        ]
//    };
//
//// 본문 출력 함수 
//const displayProductImages = () => {
//    const productImages = document.getElementById('images');
//    product.imageSrcs.forEach((item) => {
//        productImages.innerHTML += `<img src="${item.imgSrc}">`;
//    });
//};
//
//// 사이드바 출력 함수
//const displaySidebar = () => {
//    const sidebarProductName = document.getElementById('productName');
//    sidebarProductName.innerHTML = `${product.title}`;
//    
//    const sidebarProductPrice = document.getElementById('productPrice');
//    sidebarProductPrice.innerHTML = `${parseInt(product.price).toLocaleString('kr-KR')}원`;
//
//    const sidebarProductInfo = document.getElementById('productInfo');
//    sidebarProductInfo.innerHTML = `${product.info}`;
//};
//
//
//displayProductImages();
//
//displaySidebar();

$(document).ready(function() {
  $('.btn.btn1').click(function() {
      const productId = ${product.pid}; // 현재 페이지의 상품 ID를 가져옵니다.
      $.ajax({
          url: '/viewport_mini_web/cart/add',
          type: 'POST',
          data: { pid: productId },
          success: function(response) {
              // 성공적으로 장바구니에 추가되었을 때 모달 표시
              $('#myModal1').modal('show');
          },
          error: function() {
              alert('장바구니에 추가하는데 실패했습니다.');
          }
      });
  });
});

// 모달 출력 함수 
// const displaymodal = () => {
//     const modalImage = document.getElementById('modalImg');
//     modalImage.innerHTML = `<img src="${product.imageSrcs[0].imgSrc}">`;
// };
// displaymodal();