package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Cart;
import com.mycompany.viewport_mini_web.dto.CartItem;
import com.mycompany.viewport_mini_web.dto.Product;
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
  public String cart(Principal principal, Model model) {
    log.info("cart() 실행");
    Users user = userService.getUser(principal.getName());
    Cart cart = cartService.getCartByUemail(user.getUsid());
    List<CartItem> cartItemList = cartService.getAllCartItems(cart.getCid());
    List<Product> productList = new ArrayList<>();
    for (int i = 0; i < cartItemList.size(); i++) {
      productList.add(productService.getProduct(cartItemList.get(i).getCipid()));
    }
    model.addAttribute("productList", productList);
    return "cart/cart";
  }

  @PostMapping("/add")
  public String cartForm(int pid, Principal principal, Model model) {
    log.info("실행");
    // 로그인이 되어있지 않으면 null pointer 에러 발생
    if (principal == null) {
      return "redirect:/login";
    }
    String uemail = principal.getName();
    Product product = productService.getProduct(pid);

    Users user = userService.getUser(uemail);

    cartService.addCartProduct(user, product);

    return "redirect:/cart";
  }

  @GetMapping("/attachCartItemDownload")
  public void cartProductsList(HttpServletResponse response, int pid) throws IOException {
    // 상품 데이터 생성
    log.info("실행");
    Product product = productService.getProduct(pid);
    byte[] data = product.getPattachdata();
    log.info(product.getPattachsname());
    response.setContentType(product.getPattachtype());
    String fileName = new String(product.getPattachsname());
    fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
    response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
    OutputStream os = response.getOutputStream();
    os.write(data);
    os.flush();
    os.close();
  }
}
