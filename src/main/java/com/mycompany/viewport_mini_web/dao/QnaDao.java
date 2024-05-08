package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Qna;

@Mapper
public interface QnaDao {

  void insertNewPost(Qna qna);

}
