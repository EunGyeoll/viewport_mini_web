package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Orders;

@Mapper
public interface OrdersDao {

  public void insertOrderData(Orders orders);

  public Orders selectOrderDataByOid();

  public List<Orders> selectAllOrdersByUserId(int ouserid);

  public int getTotalSalesAmount();


}
