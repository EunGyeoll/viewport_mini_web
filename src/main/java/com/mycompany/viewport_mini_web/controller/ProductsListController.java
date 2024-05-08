package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.service.ProductService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/products")
public class ProductsListController {
  @Autowired
  private ProductService productService;

  @GetMapping("/productsList")
  public String getProductsList(Model model) {
    List<Product> products = productService.getProductList();
    model.addAttribute("products",products);
    return "products/productsList";
  }

  @GetMapping("/attachDownload")
  public void productsList(HttpServletResponse response, int pid) throws IOException {
    // 상품 데이터 생성

    Product product = productService.getProduct(pid);
    byte[] data = product.getPattachdata();

    response.setContentType(product.getPattachtype());
    String fileName = new String(product.getPattachoname());
    response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
    OutputStream os = response.getOutputStream();
    os.write(data);
    os.flush();
    os.close();
  }



  @GetMapping("/productDetail")
  public String productDetail() {
    log.info("productDetail() 실행");
    return "products/productDetail";
  }
}
