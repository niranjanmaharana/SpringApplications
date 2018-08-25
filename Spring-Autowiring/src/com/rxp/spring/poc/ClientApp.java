package com.rxp.spring.poc;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/rxp/spring/poc/applicationContext.xml");
		
		Triangle triangle = context.getBean("triangle", Triangle.class);
		System.out.println(triangle);
	}
}