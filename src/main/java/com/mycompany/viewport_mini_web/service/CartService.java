package com.mycompany.viewport_mini_web.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.CartItemDao;
import com.mycompany.viewport_mini_web.dto.CartItem;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Users;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CartService {
  @Autowired
  private CartItemDao cartItemDao;

  public void addCartProduct(Users user, Product product) {
    log.info("실행");
    CartItem cart = cartItemDao.findCartByUserIdAndProductId(user.getUsid(),product.getPid());
    if (cart == null) {
      cart = new CartItem();
      // 이부분에서 널포인터 access 발생
      cart.setCuid(user.getUsid());
      cartItemDao.createCartWithProduct(cart.getCid(), product.getPid(),user.getUsid());
    } else {
      cartItemDao.updateCqty(cart.getCqty() + 1, product.getPid(), user.getUsid(),cart.getCid());
    }    
  }

  public CartItem getCartByUserId(int usid) {
    CartItem cart = cartItemDao.findCartByUserId(usid);
    return cart;
  }

  public List<CartItem> getAllCartItems(int cuid) {
    List<CartItem> cartItemList = cartItemDao.selectAllCartItems(cuid);
    return cartItemList;
  }

  public boolean updateCartItemQty(int cpid, int cqty,int cid,int cuid) {
    CartItem cartItem = cartItemDao.findByCartIdAndProductId(cid);
    if (cartItem != null && cqty > 0) {
      cartItem.setCqty(cqty);
      cartItemDao.updateCqty(cqty, cpid, cid,cuid);
      return true;
    }
    return false;
  }

  public boolean removeProduct(int cpid, int cid,int cuid) {
    CartItem cartItem = cartItemDao.findByCartIdAndProductId(cid);
    log.info("실행");
    if(cartItem != null) {
      cartItemDao.removeCartItemByProductId(cpid,cid,cuid);
      return true;
    }
    return false;
  }
/*  public boolean removeCart(int cuid) {
    CartItem cartItem = cartItemDao.findByCartIdAndProductId(cuid);
    log.info("실행");
    if(cartItem != null) {
      cartItemDao.removeCartByUserId(cuid);
      return true;
    }
    return false;
  }*/
  public void removeCart(int usid) {
    cartItemDao.removeCart(usid);
  }

  public int getCartIdByUserIdAndProductId(int cuid, int cpid) {
    int cartId = cartItemDao.findCartIdWithUserIdAndProductId(cuid,cpid);
    log.info(cartId+"");
    return cartId;
  }
}
