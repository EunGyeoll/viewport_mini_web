package com.mycompany.viewport_mini_web.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.mycompany.viewport_mini_web.dao.UserDao;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Users;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {
  @Resource
  private UserDao userDao;
  
  public void createUser(Users user) {
    int rowNum = userDao.insert(user);
    log.info("rowNum: " + rowNum + ", bno: " + user.getUname());
  }
  public List<Users> getUserList(Pager pager) {
    List<Users> userList = userDao.selectByPage(pager);
    return userList;
  }
  public int getTotalRows() {
      int totalRows = userDao.count();
      return totalRows;
  }

  
  public void signup(Users user) {
    PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
    user.setUpassword(passwordEncoder.encode(user.getUpassword()));
    
    user.setUenabled(true);
    userDao.insert(user);
    
  }
}
