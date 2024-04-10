package com.mycompany.viewport_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
  @RequestMapping("/")
  public String index() {
    log.info("실행");
    return "home";
  }
  //로그인
  @RequestMapping("/login")
  public String login() {
    log.info("실행");
    return "member/login";
  }
  //회원가입
  @RequestMapping("/signup")
  public String signup() {
    log.info("실행");
    return "member/signup";
  }
}
