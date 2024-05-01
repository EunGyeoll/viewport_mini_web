package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.User;

@Mapper
public interface UserDao {

  int insert(User user);

  List<User> selectByPage(Pager pager);

  int count();

}
