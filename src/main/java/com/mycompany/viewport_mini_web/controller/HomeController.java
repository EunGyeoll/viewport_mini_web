package com.mycompany.viewport_mini_web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;

	@RequestMapping("/")
	public String index(Model model) {
		log.info("main 실행");

		List<Product> products = productService.getProductListRandomly();
		for(Product product : products) {
			log.info(product.getPid() + "");
		}

		model.addAttribute("products", products);

		return "home";
	}

	// 로그인
	@GetMapping("/loginForm")
	public String login() {
		log.info("실행");
		return "member/login";
	}

	// 회원가입
	@GetMapping("/signup")
	public String signup() {
		log.info("실행");
		return "member/signup";
	}

	@PostMapping("/signup")
	public String signup(Users users) {
		users.setUrole("ROLE_USER");
		userService.signup(users);
		log.info(users.toString());
		return "redirect:/loginForm";
	}
}
