package com.mycompany.viewport_mini_web.service;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.ShipmentDao;
import com.mycompany.viewport_mini_web.dto.Shipment;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShipmentService {
  @Autowired
  ShipmentDao shipmentDao;
  
  public void createShipment(Shipment shipment) {
    String shipType = shipment.getStype();
    if(shipType.equals("5000")) {
      shipType = "StandardShip";
    } else {
      shipType="ExpressShip";
    }
    String sshipmentnum = new Date().getTime()+shipType;
   
    shipment.setSshipmentnum(sshipmentnum);
    shipmentDao.updateShipmentByOrderId(shipment);
  }

  public Shipment getShipmentDataByOrderId(int oid) {
    Shipment shipment = shipmentDao.getShipmentDataByOrderId(oid);
    return shipment;
  }
  
}
