package com.mycompany.viewport_mini_web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.viewport_mini_web.dao.PhotosDao;
import com.mycompany.viewport_mini_web.dao.ProductDao;
import com.mycompany.viewport_mini_web.dto.Photos;
import com.mycompany.viewport_mini_web.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {
	@Resource
	private ProductDao productDao;
	
	@Resource
	private PhotosDao photosDao;

	public void createProduct(Product product, Photos photos) {
		int rowNum1 = productDao.insert(product);
		int rowNum2 = photosDao.insert(photos);
		log.info("rowNum1: " + rowNum1 + ", pid: " + product.getPid());
		log.info("rowNum2: " + rowNum2 + ", ptid: " + photos.getPtid());
	}

}
