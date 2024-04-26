package com.mycompany.viewport_mini_web.dto;

import java.sql.Blob;

import lombok.Data;

@Data
public class Styles {
	private int sid;
	private Blob simage;
	private int spnum;
	private int suserid;
}
