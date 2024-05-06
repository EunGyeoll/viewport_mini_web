package com.mycompany.viewport_mini_web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
public class mypageController {
  @Autowired
  private UserService userService;
  
  @GetMapping("")
  public String mypage() {
    
    return "mypage/mypage";
  }
  
  @PostMapping("/myPageInfo")
  public String mypageInfo() {
    log.info("실행");
    return "redirect:/mypage";
  }
}
