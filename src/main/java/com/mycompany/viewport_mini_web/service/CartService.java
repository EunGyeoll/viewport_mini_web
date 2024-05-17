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
    CartItem cart = cartItemDao.findCartByUserIdAndProductId(user.getUsid(), product.getPid());
    if (cart == null) {
      cart = new CartItem();
      // 이부분에서 널포인터 access 발생
      cart.setCuid(user.getUsid());
      cartItemDao.createCartWithProduct(cart.getCid(), product.getPid(), user.getUsid());
    } else {
      // 기존 카트 아이템의 수량을 증가
      cart.setCqty(cart.getCqty() + 1);
      cartItemDao.updateCqty(cart);
    }
  }

  public List<CartItem> getCartByUserId(int usid) {
    List<CartItem> cartItemList = cartItemDao.findCartByUserId(usid);
    return cartItemList;
  }

  public List<CartItem> getAllCartItems(int cuid) {
    List<CartItem> cartItemList = cartItemDao.selectAllCartItems(cuid);
    return cartItemList;
  }

  // Service
  public boolean updateCartItemQty(CartItem cartItem) {
    CartItem existingCartItem = cartItemDao.findByCartIdAndProductId(cartItem);
    if (existingCartItem != null && cartItem.getCqty() > 0) {
      existingCartItem.setCqty(cartItem.getCqty());
      cartItemDao.updateCqty(existingCartItem);
      log.info("Quantity updated successfully for product ID {} in cart ID {}", cartItem.getCpid(),
          cartItem.getCid());
      return true;
    } else {
      log.warn("Product not found in cart or invalid quantity");
      return false;
    }
  }

  public boolean removeProduct(CartItem cartItem) {
    CartItem existingCartItem = cartItemDao.findRemoveProduct(cartItem);
    
    if (existingCartItem != null) {
      cartItemDao.removeCartItemByProductId(cartItem);
      log.info("Product removed successfully from cart ID {}", cartItem.getCid());
      return true;
    } else {
      log.info("Product not found in cart");
      return false;
    }
  }


  /*
   * public boolean removeCart(int cuid) { CartItem cartItem =
   * cartItemDao.findByCartIdAndProductId(cuid); log.info("실행"); if(cartItem != null) {
   * cartItemDao.removeCartByUserId(cuid); return true; } return false; }
   */
  public boolean removeCart(int usid) {
    List<CartItem> cartItem = cartItemDao.selectAllCartItems(usid);

    log.info("실행");
    if (cartItem != null) {
      cartItemDao.removeCart(usid);
      return true;
    }
    return false;
  }

  public int getCartIdByUserIdAndProductId(int cuid, int cpid) {
    int cartId = cartItemDao.findCartIdWithUserIdAndProductId(cuid, cpid);
    log.info(cartId + "");
    return cartId;
  }
}
