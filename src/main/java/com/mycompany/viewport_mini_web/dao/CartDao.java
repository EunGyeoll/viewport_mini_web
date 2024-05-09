package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Cart;

@Mapper
public interface CartDao {

  void insertUserWithProduct(Cart cart);

}
