package com.mycompany.viewport_mini_web.dto;

import java.util.List;
import lombok.Data;

@Data
public class Cart {
  private int cid;
  private String cshippingType;
  private int cuid;
  
  private List<CartItem> cartitemList;
}
