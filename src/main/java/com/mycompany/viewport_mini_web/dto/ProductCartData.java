package com.mycompany.viewport_mini_web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ProductCartData {
  private Product product;
  private int quantity;
}
