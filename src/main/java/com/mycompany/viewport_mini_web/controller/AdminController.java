package com.mycompany.viewport_mini_web.controller;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mycompany.viewport_mini_web.dto.User;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
@GetMapping
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

  @PostMapping(value="/editUserData",produces="application/json; charset=UTF-8")
  public String postAdminEditData(Model model, User users) {
    log.info("user edit post 실행");
    return "redirect:users";
  }

  @PostMapping(value = "/createUserData", produces = "application/json; charset=UTF-8")
  @ResponseBody
  public String postAdminCreateData(Model model,User users) {
    JSONObject jsonObject = new JSONObject();
    log.info("create user post 실행됨");
    return jsonObject.toString();
  }

  @PostMapping("/deleteUserData")
  public String adminDeleteData() {
    log.info("get 실행됨");
    return "redirect:users";
  }



}
