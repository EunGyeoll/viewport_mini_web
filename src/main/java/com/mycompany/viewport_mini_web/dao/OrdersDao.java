package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Orders;

@Mapper
public interface OrdersDao {

  public void insertOrderData(Orders orders);

  public Orders selectOrderDataByOid();


}
