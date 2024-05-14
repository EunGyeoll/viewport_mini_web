package com.mycompany.viewport_mini_web.controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mycompany.viewport_mini_web.dto.Orders;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Qna;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.BoardService;
import com.mycompany.viewport_mini_web.service.OrderService;
import com.mycompany.viewport_mini_web.service.PagerService;
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

  @Autowired
  private PagerService pagerService;
  
  @Autowired
  private OrderService orderService;
  
  @GetMapping("")
  public String mypage(Model model, Principal principal) {
    String uemail = principal.getName();

    Users user = userService.getUser(uemail);
    model.addAttribute("user", user);
   
    return "mypage/mypage";
  }

  @GetMapping("/password")
  public String showPasswordPage(Model model) {
    return "mypage/password";
  }

  // 주문내역 페이지
  @GetMapping("/orders")
  public String showOrderPage(Model model,Principal principal) {
    String uemail = principal.getName();

    Users user = userService.getUser(uemail);
    List<Orders> ordersList = orderService.getOrderListByUserId(user.getUsid());
    model.addAttribute("ordersList",ordersList);
    return "mypage/orders";
  }

  // 배송 내역 페이지
  @GetMapping("/shipment")
  public String showShipment(Model model, HttpSession session) {
//    List<Shipment> shipments = userService.getUserShipments(session);
//    model.addAttribute("shipments", shipments);
    return "mypage/shipment";
  }

  @PostMapping("/myPageInfo")
  public String mypageInfo(Users user) {
    log.info("실행");
    log.info(user.toString());
    userService.updateMyPageData(user);
    return "redirect:/mypage";
  }

  // 문의 내역 페이지
  @GetMapping("/myqna")
  public String showMyQnA(@RequestParam(required = false) String pageNo, Model model, HttpSession session,Principal principal) {
    String uemail = principal.getName();
    int totalRows = boardService.getTotalBoardRows();
    Pager pager = pagerService.preparePager(session, pageNo, totalRows, 5, 5);
    Users user = userService.getUser(uemail);
    List<Qna> qnaList = boardService.getQnaByUser(user.getUsid());
    model.addAttribute("user", user);
    model.addAttribute("qnaList", qnaList);
    model.addAttribute("pager",pager);
    return "mypage/myqna";
  }

  // 회원 탈퇴 페이지
  @GetMapping("/deleteAccount")
  public String showDeleteAccount() {
    return "mypage/deleteAccount";
  }

  @PostMapping("/deleteUserData")
  public String deleteUserData(String currPw, Principal principal, Model model) {
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

    return "redirect:/mypage/password";
  }



}
