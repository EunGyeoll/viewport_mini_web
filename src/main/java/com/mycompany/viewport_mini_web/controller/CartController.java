package com.mycompany.viewport_mini_web.controller;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Cart;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.CartService;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Secured("ROLE_USER")
@RequestMapping("/cart")
public class CartController {
  @Autowired
 private CartService cartService;
 @Autowired
 private UserService userService;
 @Autowired
 private ProductService productService;
	@GetMapping("")
	public String cart() {
		log.info("cart() 실행");
		return "cart/cart";
	}

	@PostMapping("")
	public String cartForm(int pid,Principal principal,Model model) { 
	  //로그인이 되어있지 않으면 nullpointer 에러 발생
	  String uemail = principal.getName();
	 Product product= productService.getProduct(pid);
	 Users user = userService.getUser(uemail);
	 Cart cart=new Cart();
	 cart.setCpid(pid);
	 cart.setCuid(user.getUsid());
	 cartService.addCartProduct(cart);
	 model.addAttribute("product",product);
	 //model.addAttribute("cart",cart);
	  log.info(product.getPname());
	  return "cart/cart";
	}
	
	
}
