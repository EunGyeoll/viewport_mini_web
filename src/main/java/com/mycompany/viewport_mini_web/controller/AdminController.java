package com.mycompany.viewport_mini_web.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.mycompany.viewport_mini_web.dto.Photos;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
  @Autowired
  private UserService usersService;

  @Autowired
  private ProductService productService;


  @GetMapping("")
  public String adminMainPage(Model model) {
    return "admin/admin";
  }

  @GetMapping("/users")
  public String adminUserPage(Model model) {
    List<Users> users = usersService.getUserList();
    File destDir = new File("C:/Temp/uploadFiles");
    model.addAttribute("users",users);
    return "admin/users";
  }

  @GetMapping("/products")
  public String adminProductsPage(Model model) {
    List<Product> products = productService.getProductList();
    File destDir = new File("C:/Temp/uploadFiles");
    model.addAttribute("products",products);
    return "admin/products";
  }

  @GetMapping("/shippings")
  public String adminShippingsPage(Model model) {
    return "admin/shippings";
  }

  @GetMapping("/posts")
  public String adminPostPage(Model model) {
    return "admin/posts";
  }

  @PostMapping(value = "/editUserData", produces = "application/json; charset=UTF-8")
  public String postAdminEditData(Model model, Users users) {
    log.info("user edit post 실행");
    return "redirect:users";
  }

  @PostMapping("/createUserData")
  public String postAdminCreateData(Model model, Users user) {
    log.info("create user post 실행됨");
    log.info(user.getUname());
    log.info(user.getUpassword());
    log.info(user.getUaddressdetail());
    usersService.createUser(user);
    return "redirect:/admin/users";
  }
  @PostMapping("/editUserData")
  public String editUserData(Model model, Users user) {
    log.info("edit user post 실행");
    user.setUenabled(true);
    log.info(user.toString());
    usersService.updateUserData(user);
    return "redirect:/admin/users";
  }
  @PostMapping("/deleteUserData")
  public String adminDeleteData(int usid) {
    log.info("실행됨");
    log.info(usid+"");
    return "redirect:users";
  }


  @PostMapping("/createProduct")
  public String createProduct(Product product, Photos photos) throws IOException {
    // 요청 데이터의 유효성 검사
    log.info("실행");
    /*
     * log.info("original filename : " + photos.getPattach()..getOriginalFilename());
     * log.info("filetype : " + photos.getPattach().getContentType());
     */
    product.setPattachoname(product.getPattach().getOriginalFilename());
    product.setPattachtype(product.getPattach().getContentType());
    product.setPattachdata(product.getPattach().getBytes());
    log.info(""+product.getPattach().getContentType());
    File destDir = new File("C:/Temp/uploadFiles");
    if (!destDir.exists()) {
      destDir.mkdirs();
    }
    
    File destFile = new File(destDir, product.getPattachoname());
    productService.createProduct(product);
    
    List<MultipartFile> files = photos.getPtattach();
    for (MultipartFile file : files) {
      photos.setPtattachoname(file.getOriginalFilename());
      photos.setPtattachtype(file.getContentType());
      photos.setPtattachdata(file.getBytes());
      productService.createProductImg(photos);
    }
    log.info("List<MultipartFile> files 실행 확인 : " + files);

    return "redirect:/admin/products";
  }
//  @GetMapping("/downloadFile")
//  public void downloadFile(Product product, HttpServletRequest request,
//      HttpServletResponse response) throws Exception {
//    String filePath = "C:/Temp/uploadFiles/" + fileName;
//    String fileType = request.getServletContext().getMimeType(fileName);
//    // 한글로 되어 있는 파일 이름=> ISO-8859-1 문자셋으로 구성된 파일 이름
//    fileName = new String(product.getPattachoname().getBytes("UTF-8"), "ISO-8859-1");
//
//    // 응답 헤더에 저장할 내용
//    response.setContentType(fileType);
//    response.setHeader("Content-Disposition",
//        "attachment; filename=\"fileName\"" + fileName + "\" ");
//    //응답 본문에 파일 데이터 출력
//    OutputStream os = response.getOutputStream();
//    Path path = Paths.get(filePath);
//    Files.copy(path,os);
//    
//    os.flush();
//    os.close();
//  }

	@GetMapping("/deleteProduct")
	public String deleteProduct() {
		log.info("실행");
/*		productService.removeProduct(pid);*/
		return "redirect:/admin/products";
	}
}
