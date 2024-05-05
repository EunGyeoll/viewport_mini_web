package com.mycompany.viewport_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	public void createProduct(Product product) {
		int rowNum1 = productDao.insert(product);
	
	}
	   public void createProductImg(Photos photos) {
	        int CurPid= productDao.selectCurrPid();
	        log.info(""+CurPid);
	        photos.setPtpid(CurPid);
	          photosDao.insert(photos);
	    }


}
