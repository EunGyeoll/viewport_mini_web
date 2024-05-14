package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Orders;
import com.mycompany.viewport_mini_web.dto.ProductCartData;
import com.mycompany.viewport_mini_web.dto.TempPaymentData;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.CartService;
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

  @Autowired
  private CartService cartService;
  
  @GetMapping("")
  public String payment() {
    log.info("payment() 실행");
    log.info("this is test");
    return "payment/payment";
  }


  @PostMapping("")
  protected String getOrderDataFromView(HttpServletRequest request, HttpServletResponse response,
      Authentication authentication, Model model) throws ServletException, IOException {
    Users user = userService.getUser(authentication.getName());
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

  @GetMapping("/orderConfirmation")
  public String orderConfirmation(HttpSession session, Model model, Authentication authentication) {
    log.info("OrderConfirmation() 실행");
    Users user = userService.getUser(authentication.getName());
    Orders order = (Orders) session.getAttribute("orderData");
    Boolean isOrderProcessed = (Boolean) session.getAttribute("isOrderProcessed");
    List<ProductCartData> productCartDataList = new ArrayList<>();
    for (int i = 0; i < order.getOrderItems().size(); i++) {
      ProductCartData productCartData =
          new ProductCartData(productService.getProduct(order.getOrderItems().get(i).getOipid()),
              order.getOrderItems().get(i).getOiqty());
      productCartDataList.add(productCartData);
    }

    if (Boolean.TRUE.equals(isOrderProcessed)) {
      session.removeAttribute("orderData");
      session.removeAttribute("isOrderProcessed");

      model.addAttribute("user", user);
      model.addAttribute("orderData", order);
      model.addAttribute("productCartDataList", productCartDataList);
      return "payment/orderConfirmation";
    } else {
      return "redirect:/";
    }
  }

  @Transactional
  @PostMapping("/orderConfirmation")
  protected String processOrderData(@ModelAttribute("orders") Orders orders, Authentication authentication,
      Model model, HttpSession session) {
    Users user = userService.getUser(authentication.getName());

    Boolean isOrderProcessed = (Boolean) session.getAttribute("isOrderProcessed");
    if (Boolean.TRUE.equals(isOrderProcessed)) {
      return "redirect:/payment/orderConfirmation";
    }

    orders.setOuserid(user.getUsid());
    orders.getShipment().setSuserid(user.getUsid());
    orders.setOstatus("주문접수");
    orderService.addOrderData(orders);

    session.setAttribute("isOrderProcessed", true);
    session.setAttribute("orderData", orders);
    cartService.removeCart(user.getUsid());
    return "redirect:/payment/orderConfirmation";
  }
}
