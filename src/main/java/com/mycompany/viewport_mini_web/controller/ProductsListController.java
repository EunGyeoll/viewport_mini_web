package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Photos;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.service.CommonService;
import com.mycompany.viewport_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/products")
public class ProductsListController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CommonService service;	

	@GetMapping("/productsList")
	public String getProductsList(Model model, String pageNo, HttpSession session) {
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		session.setAttribute("pageNo", pageNo);
		
		int intPageNo = Integer.parseInt(pageNo);
		
		int rowsPagingTarget = service.getProductTotalRows();
		Pager pager = new Pager(9, 5, rowsPagingTarget, intPageNo);
		
		List<Product> products = productService.getProductListByPager(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("products", products);
		return "products/productsList";
	}

	@GetMapping("/attachProductDownload")
	public void productsList(HttpServletResponse response, int pid) throws IOException {
		// 상품 데이터 생성
		Product product = productService.getProduct(pid);
		byte[] data = product.getPattachdata();
		response.setContentType(product.getPattachtype());
		String fileName = new String(product.getPattachsname());
		fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
		log.info(fileName + "썸네일 출력");
	}

	@GetMapping("/attachPhotosDownload")
	public void photosList(HttpServletResponse response, int ptid) throws IOException {
		// 상품 데이터 생성
		log.info(ptid + "");
		Photos photos = productService.getPhotosByPtid(ptid);
		log.info(photos.getPtattachoname());
		byte[] data = photos.getPtattachdata();
		response.setContentType(photos.getPtattachtype());
		String fileName = new String(photos.getPtattachsname());
		fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
		log.info(fileName + "출력 완료");
	}

	@GetMapping("/productDetail")
	public String productDetail(int pid, Model model) {
		Product product = productService.getProduct(pid);
		List<Photos> photos = productService.getPhotos(pid);
		List<Integer> ptids = productService.getPtids(product.getPid());
		log.info("productDetail() 실행");
		model.addAttribute("product", product);
		model.addAttribute("photos", photos);
		model.addAttribute("ptids",ptids);
		return "products/productDetail";
	}
}
