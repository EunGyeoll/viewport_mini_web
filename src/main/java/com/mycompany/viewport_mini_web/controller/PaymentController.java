package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.TempPaymentData;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.OrderService;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequestMapping("/payment")
public class PaymentController {
  @Autowired
  private UserService userService;
  @Autowired
  private OrderService orderService;

  @Autowired
  private ProductService productService;

  @GetMapping("")
  public String payment() {
    log.info("payment() 실행");
    log.info("this is test");
    return "payment/payment";
  }

  @GetMapping("/orderConfirmation")
  public String OrderConfirmation() {
    log.info("OrderConfirmation() 실행");
    return "payment/orderConfirmation";
  }

  @PostMapping("")
  protected String getOrderDataFromView(HttpServletRequest request, HttpServletResponse response,
      Principal principal, Model model) throws ServletException, IOException {
    Users user = userService.getUser(principal.getName());
    String[] productIds = request.getParameterValues("productIds");
    String[] quantities = request.getParameterValues("quantities");
    String totalPriceWithoutDelivery = request.getParameter("totalPriceWithoutDelivery");
    String totalPriceWithDelivery = request.getParameter("totalPriceWithDelivery");
    String deliveryType = request.getParameter("deliveryType");

    TempPaymentData tempPaymentData = orderService.addOrderConfirmData(productIds, quantities,
        totalPriceWithoutDelivery, totalPriceWithDelivery, deliveryType);
    
    model.addAttribute("tempData", tempPaymentData);
    model.addAttribute("user", user);
    return "payment/payment";
  }
}
