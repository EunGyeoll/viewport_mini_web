package com.mycompany.viewport_mini_web.dto;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
  private int uid;
  private String uname;
  private String uemail;
  private Date editDate;
  private String urole;
  private String uphone;
}
