package com.mycompany.viewport_mini_web.dto;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class Product {
  private int pid;
  private String pname;
  private int pprice;
  private String pinfo;
  private String pdetail;
  private int pcno;
  private String pattachoname;
  private String pattachsname;
  private String pattachtype;
  private byte[] pattachdata;
//	
  private MultipartFile pattach;
}
