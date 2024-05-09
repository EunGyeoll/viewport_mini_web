package com.mycompany.viewport_mini_web.dto;

import java.util.Date;
import lombok.Data;

@Data
public class Users {
  private int usid;
  private String upassword;
  private String uname;
  private String uemail;
  private boolean ugender;
  private String uphonenumber;
  private String uaddress;
  private String uaddressdetail;
  private String urole;
  private Date udate;
  private int ussn;
  private boolean uenabled;
}
