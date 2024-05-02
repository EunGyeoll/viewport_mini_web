package com.mycompany.viewport_mini_web.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mycompany.viewport_mini_web.dto.Pager;

import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.User;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private UserService service;
	private ProductService productService;

	@GetMapping
	public String adminMainPage(Model model) {
		return "admin/admin";
	}

<<<<<<< HEAD
  @GetMapping("/users")
  public String adminUserPage(String pageNo, Model model, HttpSession session) {

    // pageNo를 받지 못했을 경우, 세션에 저장되어 있는지 확인
    if (pageNo == null) {
      pageNo = (String) session.getAttribute("pageNo");
      // 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
      if (pageNo == null) {
        pageNo = "1";
      }
    }
    // 세션에 pageNo 저장
    session.setAttribute("pageNo", pageNo);

    // 문자열을 정수로 변환
    int intPageNo = Integer.parseInt(pageNo);
    // Pager 객체 생성
    int rowsPagingTarget = service.getTotalRows();
    Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);

    // Service에서 게시물 목록 요청
    List<User> userList = service.getUserList(pager);

    // JSP에서 사용할 수 있도록 설정
    model.addAttribute("pager", pager);
    model.addAttribute("users", userList);
    return "admin/user";

  }
=======
	@GetMapping("/users")
	public String adminUserPage(Model model) {
		return "admin/users";
	}
>>>>>>> branch 'master' of https://github.com/mingyeongwon/viewport_mini_web.git

	@GetMapping("/products")
	public String adminProductsPage(Model model) {
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
	public String postAdminEditData(Model model, User users) {
		log.info("user edit post 실행");
		return "redirect:users";
	}

	@PostMapping("/createUserData")
	public String postAdminCreateData(Model model, User user) {
		log.info("create user post 실행됨");
		log.info(user.getUname());
		log.info(user.getUpassword());
		log.info(user.getUaddressdetail());
		service.createUser(user);
		return "redirect:/admin/users";
	}

<<<<<<< HEAD
  @PostMapping("/deleteUserData")
  public String adminDeleteData() {
    log.info("get 실행됨");
    return "redirect:users";
  }
  @PostMapping("/createProductData")
  public String createProductData(Product product) {
	  log.info("create product data 실행");
	  log.info("product name : " + product.getPname());
	  
	  productService.createProduct(product);
	  return "redirect:/admin/products";
  }
  
  
=======
	@PostMapping("/deleteUserData")
	public String adminDeleteData() {
		log.info("get 실행됨");
		return "redirect:users";
	}

	@PostMapping("/createProduct")
	public String createProduct(Product product) {
		// 요청 데이터의 유효성 검사
		log.info("original filename : " + product.getPattach().getOriginalFilename());
		log.info("filetype : " + product.getPattach().getContentType());

		// 첨부 파일이 있는지 여부 조사
		if (product.getPattach() != null && !product.getPattach().isEmpty()) {
			// DTO 추가 설정
			product.setPattachoname(product.getPattach().getOriginalFilename());
			product.setPattachtype(product.getPattach().getContentType());
			try {
				product.setPattachdata(product.getPattach().getBytes());
			} catch (Exception e) {
			}
		}

		productService.createProduct(product);
		return "redirect:/admin/products";
	}
>>>>>>> branch 'master' of https://github.com/mingyeongwon/viewport_mini_web.git



}
