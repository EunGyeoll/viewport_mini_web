package com.mycompany.viewport_mini_web.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.OrderItemDao;
import com.mycompany.viewport_mini_web.dao.OrdersDao;
import com.mycompany.viewport_mini_web.dao.ProductDao;
import com.mycompany.viewport_mini_web.dto.ProductCartData;
import com.mycompany.viewport_mini_web.dto.TempPaymentData;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderService {
  @Autowired
  private OrdersDao orderDao;
  @Autowired
  private OrderItemDao orderItemDao;
  @Autowired
  private ProductDao productDao;
  public TempPaymentData addOrderConfirmData(String[] productIds, String[] quantities,
      String totalPriceWithoutDelivery, String totalPriceWithDelivery, String deliveryType) {
      TempPaymentData tempPaymentData = new TempPaymentData();
      tempPaymentData.setTotalPrice(Integer.parseInt(totalPriceWithoutDelivery));
      tempPaymentData.setTotalPriceWithDelivery(Integer.parseInt(totalPriceWithDelivery));
      tempPaymentData.setDeliveryType(Integer.parseInt(deliveryType)); // Assuming deliveryType is a string
      List<ProductCartData> ItemList = new ArrayList<>();
      
      for (int i = 0; i < productIds.length; i++) {
        ProductCartData item = new ProductCartData(productDao.selectByPid(Integer.parseInt(productIds[i])),Integer.parseInt(quantities[i]));
        ItemList.add(item);
      }
      tempPaymentData.setItemList(ItemList);
      return tempPaymentData;
  }
}
