package com.mycompany.viewport_mini_web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Shippings {
  private int sid;
  private String sname;
  private String snumber;
  private String sstatus;
}
