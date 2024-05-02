package com.mycompany.viewport_mini_web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.viewport_mini_web.dao.ProductDao;
import com.mycompany.viewport_mini_web.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {
  @Resource
  private ProductDao productDao;
  
  public void createProduct(Product product) {
    int rowNum = productDao.insert(product);
    log.info("rowNum: " + rowNum + ", pid: " + product.getPid());
  }
  
}
