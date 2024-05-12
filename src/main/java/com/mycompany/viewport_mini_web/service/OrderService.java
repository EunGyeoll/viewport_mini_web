package com.mycompany.viewport_mini_web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.OrderItemDao;
import com.mycompany.viewport_mini_web.dao.OrdersDao;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderService {
  @Autowired
  private OrdersDao orderDao;
  @Autowired
  private OrderItemDao orderItemDao;
  public void addOrderConfirmData(String[] productIds, String[] quantities,
      String totalPriceWithoutDelivery, String totalPriceWithDelivery, String deliveryType) {
    
  }

}
