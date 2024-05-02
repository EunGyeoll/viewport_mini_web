package com.mycompany.viewport_mini_web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.User;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
  @Autowired
  private UserService service;

  @Autowired
  private ProductService productService;

  @GetMapping("")
  public String adminMainPage(Model model) {
    return "admin/admin";
  }

  @GetMapping("/users")
  public String adminUserPage(Model model) {
    return "admin/users";
  }

  @GetMapping("/products")
  public String adminProductsPage(Model model) {
    return "admin/products";
  }

  @GetMapping("/shippings")
  public String adminShippingsPage(Model model) {
    return "admin/shippings";
  }

  @GetMapping("/posts")
  public String adminPostPage(Model model) {
    return "admin/posts";
  }

  @PostMapping(value = "/editUserData", produces = "application/json; charset=UTF-8")
  public String postAdminEditData(Model model, User users) {
    log.info("user edit post 실행");
    return "redirect:users";
  }

  @PostMapping("/createUserData")
  public String postAdminCreateData(Model model, User user) {
    log.info("create user post 실행됨");
    log.info(user.getUname());
    log.info(user.getUpassword());
    log.info(user.getUaddressdetail());
    service.createUser(user);
    return "redirect:/admin/users";
  }

  @PostMapping("/deleteUserData")
  public String adminDeleteData() {
    log.info("get 실행됨");
    return "redirect:users";
  }

  @PostMapping("/createProduct")
  public String createProduct(Product product) {
    // 요청 데이터의 유효성 검사
    log.info("실행");
    log.info("original filename : " + product.getPattach().getOriginalFilename());
    log.info("filetype : " + product.getPattach().getContentType());

    // 첨부 파일이 있는지 여부 조사
   if (product.getPattach() != null && !product.getPattach().isEmpty()) {
      // DTO 추가 설정
      product.setPattachoname(product.getPattach().getOriginalFilename());
      product.setPattachtype(product.getPattach().getContentType());
      try {
        product.setPattachdata(product.getPattach().getBytes());
      } catch (Exception e) {
      }
    }

   // productService.createProduct(product);
    return "redirect:/admin/products";
  }

}
