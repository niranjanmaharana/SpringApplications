package com.rxp.spring.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PathVariableController {
	@RequestMapping("/path/{userName}")
	protected ModelAndView pathVariableReader(HttpServletRequest request, 
			HttpServletResponse response,
			@PathVariable("userName") String userName) throws Exception {
		return new ModelAndView("message").addObject("welcomeMessage", "Hi, " + userName);
	}
	
	@RequestMapping("/path/{userName}/{country}")
	protected ModelAndView multiplePathVariableReader(HttpServletRequest request, 
			HttpServletResponse response,
			@PathVariable("userName") String userName,
			@PathVariable("country") String country) throws Exception {
		return new ModelAndView("message").addObject("welcomeMessage", "My name is " + userName + " and I am from " + country);
	}
	
	@RequestMapping("/pathMap/{userName}/{country}")
	protected ModelAndView multiplePathVariableReaderWithMap(HttpServletRequest request, 
			HttpServletResponse response,
			@PathVariable Map<String, Object> pathVars) throws Exception {
		String userName = (String)pathVars.get("userName");
		String country = (String)pathVars.get("country");
		return new ModelAndView("message").addObject("welcomeMessage", "My name is " + userName + " and I am from " + country);
	}
}