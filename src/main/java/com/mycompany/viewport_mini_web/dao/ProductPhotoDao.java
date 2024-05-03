package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.viewport_mini_web.dto.Product;

import lombok.extern.slf4j.Slf4j;


@Mapper
public interface ProductPhotoDao {
	public int insert(Product product); 
}
