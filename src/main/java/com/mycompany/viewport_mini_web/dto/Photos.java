package com.mycompany.viewport_mini_web.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Photos {
  private int ptid;
  private String pattachoname;
  private String pattachsname;
  private String pattachtype;
  private byte[] pattachdata;
  
  private List<MultipartFile> pattach;
}
