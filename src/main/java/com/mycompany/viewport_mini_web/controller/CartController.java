package com.mycompany.viewport_mini_web.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mycompany.viewport_mini_web.dto.CartItem;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.ProductCartData;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.CartService;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
// @Secured("ROLE_USER")
@RequestMapping("/cart")
public class CartController {
  @Autowired
  private CartService cartService;
  @Autowired
  private UserService userService;
  @Autowired
  private ProductService productService;

  // 카트 페이지
  @GetMapping("")
  public String cart(Authentication authentication, Model model) {
      Users user = userService.getUser(authentication.getName());
      List<CartItem> cartItemList = cartService.getCartByUserId(user.getUsid());

      if (cartItemList != null) {
          List<ProductCartData> productDataList = new ArrayList<>();
          for (CartItem item : cartItemList) {
              Product product = productService.getProduct(item.getCpid());
              int quantity = item.getCqty();
              productDataList.add(new ProductCartData(product, quantity));
          }
          model.addAttribute("productDataList", productDataList);
      }
      return "cart/cart";
  }

  // 카트에 상품 추가
  @PostMapping("/add")
  @ResponseBody
  public String addProductToCart(@RequestParam("pid") int pid, Authentication authentication) throws Exception {
      String uemail = authentication.getName();
      Product product = productService.getProduct(pid);
      Users user = userService.getUser(uemail);
      cartService.addCartProduct(user, product);
      return "성공";
  }

  // 카트에 존재하는 상품 수량 업데이트
  @PostMapping("/updateQuantity")
  @ResponseBody
  public String updateQuantity(@RequestBody CartItem cartItem, Authentication authentication) throws Exception {
      String uemail = authentication.getName();
      Users user = userService.getUser(uemail);
      int cartId = cartService.getCartIdByUserIdAndProductId(user.getUsid(), cartItem.getCpid());
      cartItem.setCid(cartId);
      cartItem.setCuid(user.getUsid());

      boolean updateResult = cartService.updateCartItemQty(cartItem);
      return updateResult ? "성공" : "실패";
  }

  // 카트에서 상품 삭제
  @PostMapping("/removeProduct")
  @ResponseBody
  public String removeProduct(@RequestBody CartItem cartItem, Authentication authentication) throws Exception {
      String uemail = authentication.getName();
      Users user = userService.getUser(uemail);
      boolean removeResult = cartService.removeProduct(cartItem);
      return removeResult ? "성공" : "실패";
  }
}