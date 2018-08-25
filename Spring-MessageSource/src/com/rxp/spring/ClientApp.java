package com.rxp.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {
	
	public static void main(String[] args) {
		AbstractApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		context.registerShutdownHook();
		//System.out.println("Message : " + context.getMessage("greeting", null, "Default Greeting Message", null));
		Circle circle = context.getBean("circle", Circle.class);
		if(circle != null)
			circle.draw();
	}
}