package com.rxprism.manager;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.rxprism.vo.User;

@Component
public class UserManager {
	public User getLoggedInUserInfo() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			User user = (User) authentication.getDetails();
			return user;
		} else
			return null;
	}

	public boolean isAnonymousAccess() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			return false;
		} else
			return true;
	}

	public boolean isValidatedUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			User user = (User) authentication.getDetails();
			if (user != null && user.isActive())
				return true;
			else
				return false;
		} else
			return false;
	}

	public ModelAndView logoutUnauthorizedAccess() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		User user = getLoggedInUserInfo();
		if (user == null && isAnonymousAccess() == true) {
			mav.addObject("msg", "You are not authenticated please login!");
		} else if (null != user && user.isActive()) {
			mav.addObject("msg",
					"User has expired or blocked please contact Admin!");
		}
		return mav;
	}
}