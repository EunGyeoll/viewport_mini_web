package com.mycompany.viewport_mini_web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mycompany.viewport_mini_web.dto.Products;
import com.mycompany.viewport_mini_web.dto.Shipment;
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
    List<User> users = new ArrayList<>();
    for (int i = 1; i <= 4; i++) {
      if (i == 1)
        users.add(new User(i, "name" + i, "email" + i, new Date(), "Admin", "010-0000-000" + i));
      else {
        users.add(new User(i, "name" + i, "email" + i, new Date(), "User", "010-0000-000" + i));
      }
    }
    model.addAttribute("users", users);
    return "admin/users";
  }

  @GetMapping("/products")
  public String adminProductsPage(Model model) {
    List<Products> products = new ArrayList<>();
    for (int i = 1; i <= 4; i++) {
      if (i == 1)
        products.add(new Products(i, "name" + i, "info" + i, 330000, "Glasses"));
      else {
        products.add(new Products(i, "name" + i, "email" + i, 300000, "Sunglasses"));
      }
    }
    model.addAttribute("products", products);
    return "admin/products";
  }

  @GetMapping("/shippings")
  public String adminShippingsPage(Model model) {
    List<Shipment> shippings = new ArrayList<>();
    for (int i = 1; i <= 4; i++) {
      if (i == 1)
        shippings.add(new Shipment(i, "name" + i, "email" + i, "In progress"));
      else {
        shippings.add(new Shipment(i, "name" + i, "email" + i, "Done"));
      }
    }
    model.addAttribute("shippings", shippings);
    return "admin/shippings";
  }
  @GetMapping("/posts")
  public String adminPostPage(Model model) {
   
    
    return "admin/posts";
  }

  @PostMapping(value="/editUserData",produces="application/json; charset=UTF-8")
  public String postAdminEditData(Model model, User users) {
    log.info("user edit post 실행");
    
    users.setEditDate(new Date());
    log.info(users.toString());
    return "redirect:users";
  }

  @PostMapping(value = "/createUserData", produces = "application/json; charset=UTF-8")
  @ResponseBody
  public String postAdminCreateData(Model model,User users) {
    JSONObject jsonObject = new JSONObject();
    log.info("create user post 실행됨");
    jsonObject.put("uname", users.getUname());
    jsonObject.put("uemail", users.getUemail());
    jsonObject.put("urole", users.getUrole());
    jsonObject.put("uid", users.getUid());
    jsonObject.put("udate", users.getUid());
    return jsonObject.toString();
  }

  @PostMapping("/deleteUserData")
  public String adminDeleteData() {
    log.info("get 실행됨");
    return "redirect:users";
  }



}
