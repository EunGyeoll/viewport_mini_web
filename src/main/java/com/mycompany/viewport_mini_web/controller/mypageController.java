package com.mycompany.viewport_mini_web.controller;

import java.security.Principal;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Qna;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.BoardService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
public class mypageController {
  @Autowired
  private UserService userService;
  @Autowired
  private BoardService boardService;
  
  @GetMapping("")
  public String mypage(Model model, Principal principal) {
    String uemail = principal.getName();

    Users user = userService.getUser(uemail);
    List<Qna> qnaList = boardService.getQnaByUser(user.getUsid());
    model.addAttribute("user", user);
    model.addAttribute("qnaList",qnaList);
    return "mypage/mypage";
  }

  @PostMapping("/myPageInfo")
  public String mypageInfo(Users user) {
    log.info("실행");
    log.info(user.toString());
    userService.updateMyPageData(user);
    return "redirect:/mypage";
  }

  @PostMapping("/deleteUserData")
  public String deleteUserData(String currPw,Principal principal,Model model) {
    String uemail = principal.getName();
    Users user = userService.getUser(uemail);
    if (!userService.checkPassword(currPw, user.getUpassword())) {
      model.addAttribute("pwError", "기존 비밀번호가 일치하지 않음");
      return "redirect:/mypage";
    } else {
      userService.removeUser(uemail);
    }
    return "redirect:/logout";
  }
  @Transactional
  @PostMapping("/passwordChange")
  public String passwordChange(String currPw, String newPw, String newPwConfirm, Model model,
      Principal principal) {
    log.info("실행");
    String uemail = principal.getName();
    Users user = userService.getUser(uemail);
    if (!userService.checkPassword(currPw, user.getUpassword())) {
      model.addAttribute("pwError", "기존 비밀번호가 일치하지 않음");
      return "redirect:/mypage";
    }
    if (newPw.isEmpty() || !newPw.equals(newPwConfirm)) {
      model.addAttribute("pwError", "새로운 비밀번호가 일치하지 않음");
      return "redirect:/mypage";
    } else {
      userService.changePassword(uemail, newPw);
    }

    return "redirect:/mypage?tab=password";
  }
  
  
  
}
