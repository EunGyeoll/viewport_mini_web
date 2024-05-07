package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.viewport_mini_web.dto.Photos;


@Mapper
public interface PhotosDao {
	public int insert(Photos photos);

	public int deleteByPtpid(int ptpid);

	public int updateImg(Photos photos);

}
