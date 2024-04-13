

//  상품
const product = {
        title: "몬타 04",
        price: 330000,
        category: "Sunglasses",
        lens: "Blue light protection",
        info: "VIEWPORT의 2024년 컬렉션을 통해 선보이는 몬타 04 선글라스를 소개합니다. 현대적인 터치를 담은 스퀘어 실루엣에 강렬한 레드 컬러가 특징이며, 반투명 템플에 결합된 메탈 아이콘 디테일이 돋보이는 아이템입니다.",
        infoDetail: "레드 색상 반투명 아세테이트 프레임",
        imageSrcs: [
            {imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_1.jpg"},
            {imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_2.jpg"},
            {imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_3.jpg"},
            {imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_4.jpg"},
            {imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_RC6_5.jpg"},
            {imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NewWEB_ORIGINALSUN__2024_PACKAGE_1920x2604_212.jpg"}
        ]
    };

// 본문 출력 함수 
const displayProductImages = () => {
    const productImages = document.getElementById('images');
    product.imageSrcs.forEach((item) => {
        productImages.innerHTML += `<img src="${item.imgSrc}">`;
    });
};
displayProductImages();

// 사이드바 출력 함수
const displaySidebar = () => {
    const sidebarProductName = document.getElementById('productName');
    sidebarProductName.innerHTML = `${product.title}`;
    
    const sidebarProductPrice = document.getElementById('productPrice');
    sidebarProductPrice.innerHTML = `${parseInt(product.price).toLocaleString('kr-KR')}원`;

    const sidebarProductInfo = document.getElementById('productInfo');
    sidebarProductInfo.innerHTML = `${product.info}`;
};
displaySidebar();

// 모달 출력 함수 
// const displaymodal = () => {
//     const modalImage = document.getElementById('modalImg');
//     modalImage.innerHTML = `<img src="${product.imageSrcs[0].imgSrc}">`;
// };
// displaymodal();