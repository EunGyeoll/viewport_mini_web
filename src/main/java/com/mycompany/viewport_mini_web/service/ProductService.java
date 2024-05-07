package com.mycompany.viewport_mini_web.service;

import java.util.List;

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

	public void createProduct(Product product) {
		int rowNum = productDao.insert(product);

	}

	public void createProductImg(Photos photos) {
		int CurPid = productDao.selectCurrPid();
		log.info("" + CurPid);
		photos.setPtpid(CurPid);
		photosDao.insert(photos);
	}

	public List<Product> getProductList() {
		List<Product> products = productDao.selectProductList();
		return products;
	}


	public Product getProduct(int pid) {
		Product product = productDao.selectByPid(pid);
		return product;
	}

	public byte[] getPattachData(int pid) {
		Product product = productDao.selectPattachData(pid);
		return product.getPattachdata();
	}

	public void updateProduct(Product product) {
		int rowNum = productDao.update(product);

	}

	public void updateProductImg(Photos photos) {
		int rowNum = photosDao.updateImg(photos);
	}
	
	public void removeProduct(int pid) {
		photosDao.deleteByPtpid(pid);
		productDao.deleteByPid(pid);

	}	

}
