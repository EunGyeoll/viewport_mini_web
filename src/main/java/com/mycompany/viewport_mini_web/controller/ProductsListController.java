package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/products")
public class ProductsListController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/productsList")
	public String productsList(HttpServletResponse response, Product product) throws IOException {
		// 상품 데이터 생성
		List<Product> productsList = productService.getProductList();
		
		for(Product productImg : productsList) {
			productImg = productService.getProduct(productImg.getPid());
			byte[] data = productService.getProductImg(productImg.getPid()).getPattachdata();
			log.info(productService.getProduct(productImg.getPid()) +"");
			// 응답 헤더
			response.setContentType(productImg.getPattachtype());
			String fileName = new  String(productImg.getPattachoname().getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
			// 응답 본문에 파일 데이터 출력
			OutputStream os = response.getOutputStream();
			os.write(data);	
			os.flush();
			os.close();	
		}
		return "products/productsList";
	}

	@GetMapping("/productDetail")
	public String productDetail() {
		log.info("productDetail() 실행");
		return "products/productDetail";
	}
}
