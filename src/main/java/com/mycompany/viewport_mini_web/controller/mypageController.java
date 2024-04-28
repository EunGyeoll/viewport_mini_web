package com.mycompany.viewport_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("mypage")
public class mypageController {
  @GetMapping
  public String mypage() {
    return "mypage/mypage";
  }
}
