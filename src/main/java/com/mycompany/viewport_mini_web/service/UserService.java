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

  public int getTotalUserRows() {
    int totalRows = userDao.count();
    return totalRows;
  }


  public void signup(Users user) {
    log.info("실행");
    PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
    user.setUpassword(passwordEncoder.encode(user.getUpassword()));
    user.setUenabled(true);
    userDao.insert(user);

  }

  public List<Users> getUserList() {
    List<Users> users = userDao.selectuserAll();
    return users;
  }

  public void updateUserData(Users user) {
    int rowNum = userDao.update(user);

  }

  public void removeUser(int usid) {
    int rowNum = userDao.deleteByUsid(usid);

  }

  public Users getUser(String uemail) {
    Users user = userDao.selectByUemail(uemail);
    return user;
  }

  public void updateMyPageData(Users user) {
    int rowNum = userDao.updateByUemail(user);

  }

  public void changePassword(String uemail, String upassword) {
    PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
   upassword = passwordEncoder.encode(upassword);
    int rowNum = userDao.updatePasswordByUemail(uemail,upassword);
  }

  public boolean checkPassword(String rawPassword, String encodedPassword) {
  PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
    return passwordEncoder.matches(rawPassword,encodedPassword);
  }

  public void removeUser(String uemail) {
    int rowNum = userDao.deleteByUemail(uemail);
    
  }

  public String getUserByUserId(int quserid) {
    String uemail = userDao.selectByUsid(quserid);
    return uemail;
  }
}
