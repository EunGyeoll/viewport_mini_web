package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Users;

@Mapper
public interface UserDao {

  int insert(Users user);

  List<Users> selectByPage(Pager pager);

  int count();

  Users selectByUemail(String useremail);

}
