package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.viewport_mini_web.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Mapper
public interface ProductDao {
	public int insert(Product product);

	public int selectCurrPid();

	public List<Product> selectProductList();

	public int deleteByPid(int pid);

	public Product selectByPid(int pid);

	public Product selectPattachData(int pid);
}
