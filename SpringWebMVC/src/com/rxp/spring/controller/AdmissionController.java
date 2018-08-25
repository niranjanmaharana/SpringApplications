package com.rxp.spring.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rxp.spring.model.Student;

@Controller
@RequestMapping(value = "/admission")
public class AdmissionController {
	
	@ModelAttribute
	public void getModelWithHeader(ModelAndView view){
		view.addObject("headerText", "Admission System");
	}
	
	@RequestMapping(value = "/admissionForm")
	public ModelAndView addAdmissionQuery(HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView view = new ModelAndView("admissionForm");
		view.addObject("message", "Admission Form");
		return view;
	}
	
	@RequestMapping(value = "/submitAdmissionForm")
	public ModelAndView submitAdmissionQuery(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("student") Student student, 
			BindingResult bindingResult){
		System.out.println("student : " + student);
		if(bindingResult.hasErrors())
			return new ModelAndView("admissionForm").addObject("student", student);
		ModelAndView view = new ModelAndView("admissionSuccess");
		view.addObject("message", "Admission Success");
		view.addObject("student", student);
		return view;
	}
	
	//don't allow spring container to bind a particular variable with model object
	@InitBinder
	public void initBinder(WebDataBinder binder){
		//invalid field name does not raise any exception, instead simply ignores it.
		//binder.setDisallowedFields(new String[]{"mobileNumber"});
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		binder.registerCustomEditor(Date.class, "studentDob", new CustomDateEditor(dateFormat, false));
	}
}