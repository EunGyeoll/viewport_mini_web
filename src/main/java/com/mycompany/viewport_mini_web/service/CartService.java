package com.mycompany.viewport_mini_web.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.CartDao;
import com.mycompany.viewport_mini_web.dao.CartItemDao;
import com.mycompany.viewport_mini_web.dto.Cart;
import com.mycompany.viewport_mini_web.dto.CartItem;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Users;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CartService {
  @Autowired
  private CartDao cartDao;
  @Autowired
  private CartItemDao cartItemDao;

  public void addCartProduct(Users user, Product product) {
    log.info("실행");
    Cart cart = cartDao.findByUsid(user.getUsid());
    if (cart == null) {
      cart = new Cart();
      // 이부분에서 널포인터 access 발생
      cart.setCuid(user.getUsid());
      cartDao.createCart(cart);
    }
    CartItem cartItem = cartItemDao.findByCartIdAndProductId(product.getPid(), cart.getCid());
    if (cartItem == null) {
      cartItem = new CartItem();
      cartItemDao.createCartProduct(cart.getCid(), product.getPid());
    } else {
      cartItemDao.updateCiqty(cartItem.getCiqty() + 1, product.getPid(), cart.getCid());
    }
  }

  public Cart getCartByUserId(int usid) {
    Cart cart = cartDao.findCartByUserId(usid);
    return cart;
  }

  public List<CartItem> getAllCartItems(int cid) {
    List<CartItem> cartItemList = cartItemDao.selectAllCartItems(cid);
    return cartItemList;
  }

  public boolean updateCartItemQty(int cipid, int ciqty,int cicid) {
    CartItem cartItem = cartItemDao.findByCartIdAndProductId(cipid, cicid);
    if (cartItem != null && ciqty > 0) {
      cartItem.setCiqty(ciqty);
      cartItemDao.updateCiqty(ciqty, cipid, cicid);
      return true;
    }
    return false;
  }

  public boolean removeProduct(int cipid, int cicid) {
    CartItem cartItem = cartItemDao.findByCartIdAndProductId(cipid, cicid);
    log.info("실행");
    if(cartItem != null) {
      cartItemDao.removeCartItemByProductId(cipid,cicid);
      return true;
    }
    return false;
  }
}
