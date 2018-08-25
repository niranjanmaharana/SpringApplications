package com.rxprism.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rxprism.manager.UserManager;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
	@Autowired UserManager userManager;
	
	@RequestMapping("/view")
	public ModelAndView loadDashboard(){
		if(userManager.isValidatedUser() == true){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("home");
			return mav;
		}else{
			return userManager.logoutUnauthorizedAccess();
		}
	}
}