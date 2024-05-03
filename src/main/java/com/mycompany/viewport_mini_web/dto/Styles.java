package com.mycompany.viewport_mini_web.dto;

import java.sql.Blob;

import lombok.Data;

@Data
public class Styles {
	private int stid;
	private Blob stimage;
	private String stattachoname;
	private String stattchsname;
	private String stattachtype;
	private int stpnum;
	private int suserid;
}
