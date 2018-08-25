package com.rxprism.configuration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class LogoutHandler implements LogoutSuccessHandler{
	public void onLogoutSuccess(HttpServletRequest request,HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		if (authentication != null && authentication.getDetails() != null) {
            try {
            	request.getSession().invalidate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		response.setStatus(HttpServletResponse.SC_OK);
		response.sendRedirect(request.getContextPath());
	}
}