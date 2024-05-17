package com.mycompany.viewport_mini_web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FindPasswordController {

    @Autowired
    private UserService userService;

    @PostMapping("/findPw")
    public ResponseEntity<?> findPassword(@RequestBody Users userData) {
	
    	 // 서비스를 사용하여 데이터베이스에서 사용자 정보 조회
        Users user = userService.getUser(userData.getUemail());
        // 조회된 사용자 정보와 전달된 DTO의 데이터를 비교하여 일치 여부 확인
        if (user != null && user.getUname().equals(userData.getUname())) {
            String temporaryPassword = userService.generateTemporaryPassword(10); // 임시 비밀번호 생성
            userService.updatePw(user, temporaryPassword); // 임시 비밀번호로 업데이트
            
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("temporaryPassword", temporaryPassword);
            return ResponseEntity.ok(response);
        } else {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            return ResponseEntity.ok(response);
        }
    }
}
