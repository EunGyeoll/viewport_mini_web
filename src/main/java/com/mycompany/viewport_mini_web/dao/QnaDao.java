package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Qna;

@Mapper
public interface QnaDao {

  void insertNewPost(Qna qna);

  List<Qna> selectQnaAll();

  Qna selectByQid(int qid);

}
