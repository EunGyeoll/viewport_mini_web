package com.mycompany.viewport_mini_web.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.UserDao;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.User;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {
  @Resource
  private UserDao userDao;
  
  public void createUser(User user) {
    int rowNum = userDao.insert(user);
    log.info("rowNum: " + rowNum + ", bno: " + user.getUname());
  }
  public List<User> getUserList(Pager pager) {
    List<User> userList = userDao.selectByPage(pager);
    return userList;
  }
  public int getTotalRows() {
      int totalRows = userDao.count();
      return totalRows;
  }
}
