package com.rxp.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/rxp/spring/applicationContext.xml");
		Triangle triangle = context.getBean("triangle", Triangle.class);
		System.out.println(triangle);
	}
}