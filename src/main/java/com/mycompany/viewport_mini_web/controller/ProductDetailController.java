package com.mycompany.viewport_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequestMapping("/products")
public class ProductDetailController {
	@RequestMapping("/productDetail")
	public String productDetail() {
		log.info("productDetail() 실행");
		return "products/productDetail";
	}
}
