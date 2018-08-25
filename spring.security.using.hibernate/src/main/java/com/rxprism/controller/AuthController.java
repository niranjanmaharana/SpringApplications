package com.rxprism.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rxprism.manager.UserManager;
import com.rxprism.vo.User;

@Controller
@RequestMapping("/am")
public class AuthController {
	@Autowired UserManager userManager;
	
	@RequestMapping("/success")
	public String loadHomePage(){
		if(userManager.isValidatedUser() == true)
			return "redirect:/dashboard/view";
		else
			return "redirect:/failed";
	}
	
	@RequestMapping("/failed")
	public ModelAndView loadLoginPage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		User user = userManager.getLoggedInUserInfo();
		if(user == null) mav.addObject("msg", "Invalid credential ! Please try again.");
		else if(userManager.isAnonymousAccess() == true) mav.addObject("msg", "You are not authenticated please login !");
		else if (null != user && user.isActive()) mav.addObject("msg", "User has expired or blocked ! Please contact admin !");
		return mav;
	}
}