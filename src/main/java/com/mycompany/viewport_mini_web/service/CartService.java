package com.mycompany.viewport_mini_web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.CartDao;
import com.mycompany.viewport_mini_web.dto.Cart;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CartService {
  @Autowired
  private CartDao cartDao;

  public void addCartProduct(Cart cart) {
    cartDao.insertUserWithProduct(cart);
  }
}
