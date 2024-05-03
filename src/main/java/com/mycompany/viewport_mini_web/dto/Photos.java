package com.mycompany.viewport_mini_web.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Photos {
  private int ptid;
  private String pattachoname;
  private String pattachsname;
  private String pattachtype;
  private byte[] pattachdata;
  
  private MultipartFile pattach;
}
