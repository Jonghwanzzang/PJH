package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler2 implements AuthenticationSuccessHandler {
	
	private RequestCache reqeustCache = new HttpSessionRequestCache();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp,
			Authentication auth) throws IOException, ServletException {
		log.warn("onAuthenticationSuccess");
		
		User user = (User) auth.getPrincipal();
		log.info("=== ★user★ : "+user.getUsername());
		log.info("=== ★password★ : "+user.getPassword());
	
		clearAuthenticationAttribute(req);
		
		SavedRequest savedRequest = reqeustCache.getRequest(req, resp);
		String targetUrl = savedRequest.getRedirectUrl();
		
		log.warn("★Login Success tagetUrl★ : "+ targetUrl);
		
		resp.sendRedirect(targetUrl);
	}

	// 인증 오류가 세션에 담겨 있다면 인증이 성공했으므로 clear 해줘야 함
	private void clearAuthenticationAttribute(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		
		if(session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
}