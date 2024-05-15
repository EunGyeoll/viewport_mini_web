package com.mycompany.viewport_mini_web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.ShipmentDao;
import com.mycompany.viewport_mini_web.dto.Orders;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShipmentService {
  @Autowired
  ShipmentDao shipmentDao;
  public void createShipment(Orders order) {
    shipmentDao.updateShipmentByOrderId(order);
  }
  
}
