package com.mycompany.viewport_mini_web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.viewport_mini_web.dto.Branch;
import com.mycompany.viewport_mini_web.service.FindStoresService;
import com.mycompany.viewport_mini_web.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/findStores")
public class FindStoresController {
	  @Autowired
	  private FindStoresService findStoresService ;

	  @GetMapping("")
	  public String findStores(Model model) {
		 /* session.setAttribute*/
		  /*Branch branch = findStoresService.getBranch(bnum);*/
		  log.info("실행");
		  List<Branch> branches = findStoresService.getBranch();
		  model.addAttribute("branches", branches);
		  return "findStores/findStores";
	  }
}
