package com.mycompany.viewport_mini_web.dto;

import java.sql.Blob;
import java.sql.Clob;
import lombok.Data;

@Data
public class Branch {
  private int bnum;
  private String bname;
  private String baddress;
  private Blob bimage;
  private Clob binfo;
}
