package com.mycompany.viewport_mini_web.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Cart;
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
@Secured("ROLE_USER")
@RequestMapping("/cart")
public class CartController {
  @Autowired
  private CartService cartService;
  @Autowired
  private UserService userService;
  @Autowired
  private ProductService productService;

  @GetMapping("")
  public String cart(Authentication authentication, Model model) {
    Users user = userService.getUser(authentication.getName());
    
    Cart cart = cartService.getCartByUserId(user.getUsid());
    if(cart == null ) {
      cartService.createCart(user);
    } else {
  
    List<CartItem> cartItemList = cartService.getAllCartItems(cart.getCid());

    List<ProductCartData> productDataList = new ArrayList<>();
    for (CartItem item : cartItemList) {
      Product product = productService.getProduct(item.getCipid());
      int quantity = item.getCiqty();
      productDataList.add(new ProductCartData(product, quantity));
    }
    model.addAttribute("totalProductCount", productDataList.size());
    model.addAttribute("productDataList", productDataList);
    }
    return "cart/cart";
  }

  @PostMapping("/add")
  public String cartForm(int pid, Authentication authentication, Model model) {
    log.info("실행");

    String uemail = authentication.getName();
    Product product = productService.getProduct(pid);

    Users user = userService.getUser(uemail);

    cartService.addCartProduct(user, product);

    return "redirect:/cart";
  }

  @PostMapping("/updateQuantity")
  public ResponseEntity<?> updateQuantity(@RequestBody CartItem cartItem, Authentication authentication) {
    try {
      String uemail = authentication.getName();
      Users user = userService.getUser(uemail);
      Cart cart = cartService.getCartByUserId(user.getUsid());
      // 카트에 담긴 상품중 수량을 업데이트하고 그 업데이트가 제대로 됐는지 업데이트 결과를 저장함
      // 만약 업데이트가 실패 또는 성공 했다면 그 결과를 프론트로 전달
      boolean updateResult =
          cartService.updateCartItemQty(cartItem.getCipid(), cartItem.getCiqty(), cart.getCid());
      if (updateResult) {
        return ResponseEntity.ok().build();
      } else {
        return ResponseEntity.badRequest().body("업데이트가 불가능합니다.");
      }
    } catch (Exception e) {
      return ResponseEntity.internalServerError().body("업데이트중 에러발생");
    }
  }
  
  @PostMapping("/removeProduct")
  public ResponseEntity<?> removeProduct(@RequestBody CartItem cartItem, Authentication authentication) {
    try {
      String uemail = authentication.getName();
      Users user = userService.getUser(uemail);
      Cart cart = cartService.getCartByUserId(user.getUsid());

      boolean removeResult =
          cartService.removeProduct(cartItem.getCipid(), cart.getCid());
      if (removeResult) {
        return ResponseEntity.ok().build();
      } else {
        return ResponseEntity.badRequest().body("삭제가 불가능합니다.");
      }
    } catch (Exception e) {
      return ResponseEntity.internalServerError().body("삭제중 에러발생");
    }
  }

}
