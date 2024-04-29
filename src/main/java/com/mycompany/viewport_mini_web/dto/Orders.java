package com.mycompany.viewport_mini_web.dto;

import java.util.Date;
import lombok.Data;

@Data
public class Orders {
  private int oid;
  private Date odate;
  private String ophone;
  private String oname;
  private int ouserNum;
  private int ototalPrice;
}
