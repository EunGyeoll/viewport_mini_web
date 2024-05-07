package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.viewport_mini_web.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Mapper
public interface ProductDao { // 이름 직관적으로 + 나중에 수정
	public int insert(Product product);

	public int selectCurrPid();

	public List<Product> selectProductList();

	public Product selectByPid(int pid);
	public Product selectPattachData(int pid);

	public int update(Product product);
	
	public int deleteByPid(int pid);
}
