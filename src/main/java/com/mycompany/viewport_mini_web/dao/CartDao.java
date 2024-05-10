package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Cart;
import com.mycompany.viewport_mini_web.dto.CartItem;

@Mapper
public interface CartDao {

  void insertUserWithProduct(Cart cart);

  Cart findByUsid(int usid);

  Cart createCart(Cart cart);

  Cart findCartByUemail(int cuid);


}
