package com.mycompany.viewport_mini_web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
@RequestMapping("/mypage")
public class mypageController {
  @Autowired
  private UserService userService;
  
  @GetMapping("")
  public String mypage(Model model) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String uemail = authentication.getName();
    Users user = userService.getUser(uemail);
    model.addAttribute("user",user);
    return "mypage/mypage";
  }
  
  @PostMapping("/myPageInfo")
  public String mypageInfo(Users user) {
    log.info("실행");
    log.info(user.toString());
    userService.updateMyPageData(user);
    return "redirect:/mypage";
  }
}
