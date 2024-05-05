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

	public void createProduct(Product product, List<MultipartFile> files) {
	  
		int rowNum1 = productDao.insert(product);
		int CurPid= productDao.selectCurrPid();
		log.info(""+CurPid);
		for(MultipartFile file : files ) {
		  
		  photosDao.insert(file,CurPid);
		}
		//int rowNum2 = photosDao.insert(photos);
		//log.info("rowNum1: " + rowNum1 + ", pid: " + product.getPid());
		//log.info("rowNum2: " + rowNum2 + ", ptid: " + photos.getPtid());
		
/*		for() {
		    // 첨부 파일이 있는지 여부 조사
			   if (photos.getPattach() != null && !photos.getPattach().isEmpty()) {
			      // DTO 추가 설정
				   photos.setPattachoname(photos.getPattach().getOriginalFilename());
				   photos.setPattachtype(photos.getPattach().getContentType());
			      try {
			    	  photos.setPattachdata(photos.getPattach().getBytes());
			      } catch (Exception e) {
			    	  
			      }
			  }
		}*/
	}

}
