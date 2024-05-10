package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mycompany.viewport_mini_web.dto.CartItem;

@Mapper
public interface CartItemDao {

  CartItem findByCartIdAndProductId(@Param("cipid") int pid,@Param("cicid") int cid);

  CartItem createCartProduct(@Param("cicid") int cid,@Param("cipid") int pid);

  CartItem updateCiqty(@Param("ciqty") int ciqty,@Param("cipid") int pid,@Param("cicid") int cid);

  List<CartItem> selectAllCartItems(int cicid);

}
