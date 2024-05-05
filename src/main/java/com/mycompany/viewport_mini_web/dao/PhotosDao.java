package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;


@Mapper
public interface PhotosDao {
	public int insert(MultipartFile photo,@Param("ptpid") int CurPid); 
}
