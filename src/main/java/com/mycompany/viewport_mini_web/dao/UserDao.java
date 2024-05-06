package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Users;

@Mapper
public interface UserDao {

  public int insert(Users user);

  public List<Users> selectByPage(Pager pager);

  public int count();

  public Users selectByUemail(String useremail);

  public List<Users> selectuserAll();

}
