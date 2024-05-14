package com.mycompany.viewport_mini_web.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.mycompany.viewport_mini_web.dto.Notice;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Photos;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.BoardService;
import com.mycompany.viewport_mini_web.service.CommonService;
import com.mycompany.viewport_mini_web.service.OrderService;
import com.mycompany.viewport_mini_web.service.PagerService;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
// @Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {
  @Autowired
  private UserService usersService;
  @Autowired
  private CommonService service;
  @Autowired
  private ProductService productService;
  @Autowired
  private PagerService pagerService;
  @Autowired
  private BoardService boardService;
  @Autowired
  private OrderService orderService;
  @GetMapping("")
  public String adminMainPage(Model model) {
    int userCount = usersService.getUserCount();
    int totalSalesAmount = orderService.getTotalSalesAmount();
    model.addAttribute("userCount", userCount);
    model.addAttribute("totalSalesAmount",totalSalesAmount);
    return "admin/admin";
  }

  @GetMapping("/users")
  public String adminUserPage(@RequestParam(required = false) String pageNo, Model model,
      HttpSession session) {
    int totalRows = usersService.getTotalUserRows(); // 사용자의 전체 수를 가져옵니다.
    Pager pager = pagerService.preparePager(session, pageNo, totalRows, 10, 5); // 페이지당 행 수 10, 그룹당
                                                                                // 페이지 수 5

    List<Users> users = usersService.getUserList(pager);
    model.addAttribute("pager", pager);
    model.addAttribute("users", users);
    return "admin/users";
  }

  @GetMapping("/products")
  public String adminProductsPage(@RequestParam(required = false) String pageNo, Model model,
      HttpSession session) {
    int totalRows = productService.getTotalProductRows();
    Pager pager = pagerService.preparePager(session, pageNo, totalRows, 5, 5);
    List<Product> products = productService.getProductListByPager(pager);
    File destDir = new File("C:/Temp/uploadProduct");
    String[] productImgNames = destDir.list();
    model.addAttribute("products", products);
    model.addAttribute("pager", pager);
    return "admin/products";
  }

  @GetMapping("/shippings")
  public String adminShippingsPage(Model model) {
    return "admin/shippings";
  }

  @GetMapping("/notices")
  public String adminNoticesPage(@RequestParam(required = false) String pageNo, Model model,
      HttpSession session) {
    int totalRows = usersService.getTotalUserRows(); // 사용자의 전체 수를 가져옵니다.
    Pager pager = pagerService.preparePager(session, pageNo, totalRows, 10, 5); // 페이지당 행 수 10, 그룹당
                                                                                // 페이지 수 5

    List<Notice> notices = boardService.getNoticeList(pager);
    model.addAttribute("pager", pager);
    model.addAttribute("notices", notices);
    return "admin/notices";
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
    usersService.updateUserData(user);
    return "redirect:/admin/users";
  }

  @PostMapping("/deleteUserData")
  public String adminDeleteData(int usid) {
    log.info("실행됨");
    log.info(usid + "");
    usersService.removeUser(usid);
    return "redirect:users";
  }

  @PostMapping("/createProduct")
  public String createProduct(Product product, Photos photos) throws IOException {
    log.info("실행");

    product.setPattachoname(product.getPattach().getOriginalFilename());
    product.setPattachtype(product.getPattach().getContentType());
    byte[] productData = product.getPattach().getBytes();
    log.info("" + product.getPattach().getContentType());
    File productDestDir = new File("C:/Temp/uploadProduct");
    if (!productDestDir.exists()) {
      productDestDir.mkdirs();
    }
    product.setPattachsname(
        UUID.randomUUID().toString() + "-" + product.getPattach().getOriginalFilename());
    File productDestFile = new File(productDestDir, product.getPattachsname());
    product.getPattach().transferTo(productDestFile);
    product.setPattachdata(productData);
    productService.createProduct(product);

    File photosDestDir = new File("C:/Temp/uploadPhotos");
    if (!photosDestDir.exists()) {
      photosDestDir.mkdirs();
    }
    List<MultipartFile> files = photos.getPtattach();
    for (MultipartFile file : files) {
      byte[] photoData = file.getBytes();
      photos.setPtattachsname(UUID.randomUUID().toString() + "-" + file.getOriginalFilename());
      File photosDestFile = new File(photosDestDir, photos.getPtattachsname());
      file.transferTo(photosDestFile);

      photos.setPtattachoname(file.getOriginalFilename());
      photos.setPtattachtype(file.getContentType());
      photos.setPtattachdata(photoData);
      productService.createProductImg(photos);
    }
    log.info("List<MultipartFile> files 실행 확인 : " + files);

    return "redirect:/admin/products";
  }

  @GetMapping("/downloadFile")
  public void downloadFile(String productImgName, Product product, HttpServletRequest request,
      HttpServletResponse response) throws Exception {
    String filePath = "C:/Temp/uploadProduct/" + productImgName;
    String fileType = request.getServletContext().getMimeType(productImgName);
    // 한글로 되어 있는 파일 이름=> ISO-8859-1 문자셋으로 구성된 파일 이름
    productImgName = new String(productImgName.getBytes("UTF-8"), "ISO-8859-1");

    // 응답 헤더에 저장할 내용
    response.setContentType(fileType);
    response.setHeader("Content-Disposition",
        "attachment; filename=\"fileName\"" + productImgName + "\" ");
    // 응답 본문에 파일 데이터 출력
    OutputStream os = response.getOutputStream();
    Path path = Paths.get(filePath);
    Files.copy(path, os);

    os.flush();
    os.close();
  }

  @PostMapping("/editProduct")
  public String editProduct(Product product, Photos photos) throws IOException {
    log.info("editProduct 실행");

    // 첨부 파일이 있는지 여부 조사
    if (product.getPattach() != null && !product.getPattach().isEmpty()) {
      product.setPattachoname(product.getPattach().getOriginalFilename());
      product.setPattachtype(product.getPattach().getContentType());
      byte[] productData = product.getPattach().getBytes();
      log.info("" + product.getPattach().getContentType());
      log.info("product: " + product.getPcategory());
      log.info("product: " + product.getPshape());

      File productDestDir = new File("C:/Temp/uploadProduct");
      if (!productDestDir.exists()) {
        productDestDir.mkdirs();
      }
      product.setPattachsname(
          UUID.randomUUID().toString() + "-" + product.getPattach().getOriginalFilename());
      File productDestFile = new File(productDestDir, product.getPattachsname());
      product.getPattach().transferTo(productDestFile);
      product.setPattachdata(productData);
    }
    productService.updateProduct(product);

    if (photos.getPtattach() != null && !photos.getPtattach().isEmpty()) {
      File photosDestDir = new File("C:/Temp/uploadPhotos");
      if (!photosDestDir.exists()) {
        photosDestDir.mkdirs();
      }
      List<Integer> ptids = productService.getPtids(product.getPid());
      List<MultipartFile> files = photos.getPtattach();
      int count = 0;

      for (MultipartFile file : files) {
        photos.setPtid(ptids.get(count));

        byte[] photoData = file.getBytes();
        photos.setPtattachsname(UUID.randomUUID().toString() + "-" + file.getOriginalFilename());
        File photosDestFile = new File(photosDestDir, photos.getPtattachsname());
        file.transferTo(photosDestFile);

        if (file.getOriginalFilename() != null || !file.getOriginalFilename().isEmpty()) {

          photos.setPtattachoname(file.getOriginalFilename());
          photos.setPtattachtype(file.getContentType());
          photos.setPtattachdata(photoData);
          productService.updateProductImg(photos);
        }
        count++;
      }
      log.info("List<MultipartFile> files 실행 확인 : " + files);
    }

    return "redirect:/admin/products";
  }

  @PostMapping("/deleteProduct")
  public String deleteProduct(int pid) {
    log.info("deleteProduct 실행");
    productService.removeProduct(pid);
    return "redirect:/admin/products";
  }

  @PostMapping("/createNotice")
  public String createNotice(Notice notice) throws IOException {
    log.info(notice.getNname());
    boardService.createNotice(notice);
    return "redirect:/admin/notices";
  }

  @PostMapping("/editNoticeData")
  public String editNoticeData(Model model, Notice notice) {
    log.info("edit notice 실행");
    boardService.updateNoticeData(notice);
    return "redirect:/admin/notices";
  }

  @PostMapping("/deleteNoticeData")
  public String adminDeleteNotice(int nid) {
    log.info(nid + "삭제");
    boardService.removeNotice(nid);
    return "redirect:/admin/notices";
  }

}
