package com.rxp.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/greet")
public class HelloController{

	@RequestMapping("/welcome")
	protected ModelAndView welcome(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("message").addObject("welcomeMessage", "Hi, Generated for /welcome");
	}
	
	@RequestMapping("/hi")
	protected ModelAndView hi(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("message").addObject("welcomeMessage", "Hi, Generated for /hi");
	}
}