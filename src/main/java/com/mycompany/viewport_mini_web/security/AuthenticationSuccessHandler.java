package com.mycompany.viewport_mini_web.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
      Authentication authentication) throws ServletException, IOException {
    log.info("실행");
    // 로그인 성공 후에 이동할 Url
    setDefaultTargetUrl("/");
    // 기타 기본 설정을 적용하기 위해 부모 메소드 호출
    super.onAuthenticationSuccess(request, response, authentication);
  }

}
