package com.rxp.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rxp.spring.service.ShapeService;

public class ClientApp {
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ShapeService service = context.getBean("shapeService", ShapeService.class);
		System.out.println(service.getCircle().getName());
	}
}