package com.mycompany.viewport_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.viewport_mini_web.dto.User;

@Mapper
public interface UserDao {

  int insert(User user);

}
