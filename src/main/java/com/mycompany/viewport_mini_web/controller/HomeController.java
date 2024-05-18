package com.mycompany.viewport_mini_web.controller;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.SignupForm;
import com.mycompany.viewport_mini_web.dto.SignupFormValidator;
import com.mycompany.viewport_mini_web.dto.Styles;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.StylesService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
  @Autowired
  private UserService userService;
  @Autowired
  private ProductService productService;
  @Autowired
  private StylesService stylesService;

  @InitBinder("signupForm")
  public void signupFormValidator(WebDataBinder binder) {
    binder.setValidator(new SignupFormValidator());
  }

  @GetMapping("/isAuthenticated")
  @ResponseBody
  public Boolean isAuthenticated(Authentication authentication) {
    log.info("isAuthenticated() 실행");
    Boolean isAuthenticated = authentication != null && authentication.isAuthenticated();
    return isAuthenticated;
  }

  @RequestMapping("/error403")
  public String error403() {
    return "error/error403";
  }

  @RequestMapping("/")
  public String index(Model model) {
    log.info("main 실행");
    List<Product> products = productService.getProductListRandomly();
    for (Product product : products) {
      log.info(product.getPid() + "");
    }

    List<Styles> styles = stylesService.getStylesListRandomly();

    model.addAttribute("products", products);
    model.addAttribute("styles", styles);

    return "home";
  }

  // 로그인
  @GetMapping("/loginForm")
  public String login() {
    log.info("실행");
    return "member/login";
  }

  // 회원가입
  @GetMapping("/signup")
  public String signup() {
    log.info("실행");
    return "member/signup";
  }

  @PostMapping("/signup")
  public String signup(@RequestBody @Valid SignupForm usersData) {
    log.info(usersData.toString());
    // sql 데이터 타입 설정을 변경후에
    // 생성자로 받는 방식으로 변경해야함
    Users user = new Users();
    user.setUrole("ROLE_USER");
    user.setUname(usersData.getUname());
    user.setUemail(usersData.getUemail());
    user.setUpassword(usersData.getUpassword());
    user.setUaddress(usersData.getUaddress());
    user.setUgender(usersData.getUgender());
    user.setUaddressdetail(usersData.getUaddressdetail());
    user.setUpostcode(usersData.getUpostcode());
    user.setUphonenumber(usersData.getUphonenumber());
    user.setUssn(usersData.getUssn());
    log.info(user.toString());
    userService.signup(user);
    log.info(user.toString());
    return "redirect:/loginForm";
  }

  @GetMapping("/checkDuplicateEmail")
  @ResponseBody
  public String checkDuplicateEmail(String uemail) {
    log.info(uemail);
    int result = userService.checkDuplicateEmail(uemail);
    log.info("return value: " + result);
    if (result > 0) {
      return "duplicatedEmail!";
    }
    return "Unique";
  }
}
