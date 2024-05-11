package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mycompany.viewport_mini_web.dto.CartItem;

@Mapper
public interface CartItemDao {

  CartItem findByCartIdAndProductId(@Param("cipid") int cipid,@Param("cicid") int cicid);

  void createCartProduct(@Param("cicid") int cicid,@Param("cipid") int cipid);

  void updateCiqty(@Param("ciqty") int ciqty,@Param("cipid") int cipid,@Param("cicid") int cicid);

  List<CartItem> selectAllCartItems(int cicid);

  void removeCartItemByProductId(@Param("cipid") int cipid,@Param("cicid") int cicid);


}
