package com.mycompany.viewport_mini_web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Products {
  private int pid;
  private String pname;
  private String pinfo;
  private int pprice;
  private String pcategory;
 
}
