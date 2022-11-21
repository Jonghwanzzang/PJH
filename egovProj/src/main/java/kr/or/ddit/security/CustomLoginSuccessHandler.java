package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;
// notice/regsiter --> loginForm -> 로그인 -> CustomLoginSuccessHandler
//	-> 사용자가 작업.. -> notice/regsiter 로 리다이렉트 해줌
//  (spring 시큐리티에서 기본적으로 사용되는 구현 클래스) 
	

@Slf4j
public class CustomLoginSuccessHandler extends 
			SavedRequestAwareAuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req 
							, HttpServletResponse resp, Authentication auth) throws ServletException, IOException {
		
		//Authentication(인증) -> 로그인
		User custom =  (User) auth.getPrincipal();
		
		log.info("★username★ : " + custom.getUsername());
		
		super.onAuthenticationSuccess(req, resp, auth);
			
		
		
	}

}
