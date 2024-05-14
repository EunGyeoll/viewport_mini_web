package com.mycompany.viewport_mini_web.dto;

import java.sql.Blob;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Styles {
	private int stid;
	private Blob stimage;
	private byte[] stattachdata;
	private String stattachoname;
	private String stattchsname;
	private String stattachtype;
	private int stpnum;
	private int stuserid;
	
	private MultipartFile stattach;	
	}
