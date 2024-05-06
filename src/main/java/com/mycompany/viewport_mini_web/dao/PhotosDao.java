package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mycompany.viewport_mini_web.dto.Photos;


@Mapper
public interface PhotosDao {
	public int insert(Photos photo);

	public int deleteByPtpid(int pid); 
}
