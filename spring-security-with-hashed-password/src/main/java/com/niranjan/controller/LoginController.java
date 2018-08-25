package com.niranjan.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String printWelcome(ModelMap modelMap, Principal principal){
		System.out.println("**************Login Controller called**************");
		String userName = principal.getName();
		modelMap.addAttribute("userName", userName);
		modelMap.addAttribute("message", "Spring Security Custom Example !");
		return "hello";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap modelMap){
		System.out.println("login");
		return "login";
	}
	
	@RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
	public String loginFailed(ModelMap modelMap){
		modelMap.addAttribute("error", true);
		return "login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap modelMap){
		System.out.println("loggedout");
		return "login";
	}
	
	@RequestMapping(value = "/*", method = RequestMethod.GET)
	public String home(ModelMap modelMap){
		return "home";
	}
}