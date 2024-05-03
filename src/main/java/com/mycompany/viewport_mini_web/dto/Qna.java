package com.mycompany.viewport_mini_web.dto;

import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;
import lombok.Data;

@Data
public class Qna {
  private int qid;
  private String qcategory;
  private String qtitle;
  private Date qdate;
  private Clob qcontent;
  private int quserid;
  private String qstatus;
  private Blob qattachdata;
  private String qattachoname;
  private String qattachsname;
  private String qattachtype;
}
