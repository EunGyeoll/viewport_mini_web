package com.mycompany.viewport_mini_web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.QnaDao;
import com.mycompany.viewport_mini_web.dao.UserDao;
import com.mycompany.viewport_mini_web.dto.Qna;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
  @Autowired
  QnaDao boardDao;
  @Autowired
  UserDao userDao;
  public void insertNewPost(Qna qna,String uemail) {
    int quserid = userDao.selectByUemail(uemail).getUsid();
    qna.setQuserid(quserid);
    
    boardDao.insertNewPost(qna);
  }

}
