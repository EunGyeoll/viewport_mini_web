package com.mycompany.viewport_mini_web.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Styles;
import com.mycompany.viewport_mini_web.service.PagerService;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.StylesService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/styles")
public class StylesController {
	@Autowired
	private StylesService stylesService;
	@Autowired
	private PagerService pagerService;		
	@Autowired
	private ProductService productService;		
	
  @GetMapping("")
  public String stylesPage(@RequestParam(required = false) String pageNo, Model model, HttpSession session) {
		int totalRows = stylesService.getStylesTotalRows(); // 전체 수를 가져옵니다.
		Pager pager = pagerService.preparePager(session, pageNo, totalRows, 12, 5); // 페이지당 행 수 12, 그룹당 페이지 수 5				
		
		List<Styles> styles = stylesService.getStylesListByPager(pager);
		List<Product> products = productService.getProductList();
		
		model.addAttribute("pager", pager);
		model.addAttribute("styles", styles);  
		model.addAttribute("products", products);
	  
	  return "styles/styles";
  }
  
	@PostMapping("/createStyles")
	public String createStyles(Styles styles, int stylesPnum, Principal principal) throws IOException {
		log.info("styles 실행");
		
		String uemail = principal.getName();
		
		styles.setStpnum(stylesPnum);

		styles.setStattachoname(styles.getStattach().getOriginalFilename());
		styles.setStattachtype(styles.getStattach().getContentType());
		byte[] stylesData = styles.getStattach().getBytes();
		log.info("" + styles.getStattach().getContentType());
		File stylesDestDir = new File("C:/Temp/uploadStyles");
		if (!stylesDestDir.exists()) {
			stylesDestDir.mkdirs();
		}
		styles.setStattchsname(UUID.randomUUID().toString() + "-" + styles.getStattach().getOriginalFilename());;
		File stylesDestFile = new File(stylesDestDir, styles.getStattchsname());
		styles.getStattach().transferTo(stylesDestFile);
		styles.setStattachdata(stylesData);;
		
		stylesService.createStyles(styles);
		return "redirect:/styles";
	}  
	
	@GetMapping("/attachStylesDownload")
	public void stylesList(HttpServletResponse response, int stid) throws IOException {
		// 스타일즈 데이터 생성
		Styles styles = stylesService.getStyles(stid);
		byte[] data = styles.getStattachdata();
		response.setContentType(styles.getStattachtype());
		String fileName = new String(styles.getStattchsname());
		fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
		log.info(fileName + "스타일 출력");
	}	
	
}
