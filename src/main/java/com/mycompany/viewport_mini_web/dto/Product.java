package com.mycompany.viewport_mini_web.dto;

import java.sql.Blob;
import lombok.Data;

@Data
public class Product {
  private int pid;
  private String pname;
  private int pprice;
  private String pinfo;
  private String pdetail;
  private int pcatno;
  private Blob pthumbnail;
}
