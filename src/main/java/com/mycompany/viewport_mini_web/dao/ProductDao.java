package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.viewport_mini_web.dto.Product;


@Mapper
public interface ProductDao {
	public int insert(Product product); 
}
