package com.rxp.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/rxp/spring/applicationContext.xml");
		Triangle triangle = context.getBean("triangleByName", Triangle.class);
		System.out.println(triangle);
		
		Circle circle = context.getBean("circle", Circle.class);
		System.out.println(circle);
	}
}