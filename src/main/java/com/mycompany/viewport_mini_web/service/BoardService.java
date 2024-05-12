package com.mycompany.viewport_mini_web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.viewport_mini_web.dao.NoticeDao;
import com.mycompany.viewport_mini_web.dao.QnaDao;
import com.mycompany.viewport_mini_web.dao.UserDao;
import com.mycompany.viewport_mini_web.dto.Notice;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Qna;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
  @Autowired
  QnaDao boardDao;
  @Autowired
  UserDao userDao;
  @Autowired
  NoticeDao noticeDao;  
  
  public void insertNewPost(Qna qna,String uemail) {
    int quserid = userDao.selectByUemail(uemail).getUsid();
    qna.setQuserid(quserid);
    boardDao.insertNewPost(qna);
  }

  public List<Qna> getQnaList() {
    List<Qna> qnaList =boardDao.selectQnaAll();
    return qnaList;
  }

  public Qna getQna(int qid) {
    Qna qna = boardDao.selectByQid(qid);
    return qna;
  }

  public List<Qna> getQnaByUser(int usid) {
    List<Qna> qnaList = boardDao.findPostsByUserId(usid);
    return qnaList;
  }

  public int getTotalBoardRows() {
    int totalRow = boardDao.count();
    return totalRow;
  }
  
  public List<Qna> getUserList(Pager pager) {
    List<Qna> qnaList = boardDao.selectByPage(pager);
    return qnaList;
  }

public void createNotice(Notice notice) {
	int rowNum = noticeDao.insert(notice);
	log.info("rowNum: " + rowNum + ", nid: " + notice.getNname());
}

public List<Notice> getNoticeList(Pager pager) {
    List<Notice> noticeList = noticeDao.selectByPage(pager);
    return noticeList;
}

public void updateNoticeData(Notice notice) {
	int rowNum = noticeDao.update(notice);
}

public List<Notice> getNoticeList() {
	// TODO Auto-generated method stub
	return null;
}


}
