package org.niranjan.logger.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/home")
public class HomeController {
	@RequestMapping(value = "/sayHello", method = RequestMethod.GET)
	public @ResponseBody String sayHello(HttpServletRequest request, 
			HttpServletResponse response){
		return "Success";
	}
}