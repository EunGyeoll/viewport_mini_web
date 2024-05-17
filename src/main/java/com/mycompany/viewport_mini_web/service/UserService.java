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
	
	public void signup(Users user) {
		log.info("실행");
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		user.setUpassword(passwordEncoder.encode(user.getUpassword()));
		user.setUenabled(true);
		userDao.insert(user);

	}

	  public int checkDuplicateEmail(String uemail) {
		    int result = userDao.checkDuplicateEmail(uemail);
		    return result;
		  }
	  
	public Users getUser(String uemail) {
		Users user = userDao.selectByUemail(uemail);
		return user;
	}
	
	
	public void updatePw(Users user, String temporaryPassword) {
	    // 임시 비밀번호를 업데이트하기 전에 필요한 로직을 수행할 수 있습니다.
	    // 예를 들어, 여기서는 비밀번호 암호화를 수행하지 않고 그대로 저장합니다.
	    user.setUpassword(temporaryPassword);
	    // 사용자 정보를 데이터베이스에 업데이트
	    userDao.updatePw(user);
	}

	 // 임시 비밀번호 생성 메서드
   public String generateTemporaryPassword(int length) {
       String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
       StringBuilder builder = new StringBuilder();
       for (int i = 0; i < length; i++) {
           int randomIndex = (int) (Math.random() * chars.length());
           builder.append(chars.charAt(randomIndex));
       }
       return builder.toString();
   }
   
	
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



	public void updateMyPageData(Users user) {
		int rowNum = userDao.updateByUemail(user);

	}

	public void changePassword(String uemail, String upassword) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		upassword = passwordEncoder.encode(upassword);
		int rowNum = userDao.updatePasswordByUemail(uemail, upassword);
	}

	public boolean checkPassword(String rawPassword, String encodedPassword) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return passwordEncoder.matches(rawPassword, encodedPassword);
	}

	public void removeUser(String uemail) {
		int rowNum = userDao.deleteByUemail(uemail);

	}

	public String getUserByUserId(int quserid) {
		String uemail = userDao.selectByUsid(quserid);
		return uemail;
	}

	public int getUserCount() {
		int userCount = userDao.getUserCount();
		return userCount;
	}

	public String getUserByStuserId(int stuserid) {
		String uemail = userDao.selectByUsid(stuserid);
		return uemail;
	}

}



