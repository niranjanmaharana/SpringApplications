package com.rxp.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {
	
	public static void main(String[] args) {
		AbstractApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		context.registerShutdownHook();
		Circle circle = context.getBean("circle", Circle.class);
		System.out.println("circle : " + circle);
	}
}