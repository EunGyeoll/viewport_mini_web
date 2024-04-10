package com.mycompany.viewport_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cart")
public class CartController {
  @RequestMapping("")
  public String cart() {
    log.info("cart() 실행");
    return "cart/cart";
  }
}
