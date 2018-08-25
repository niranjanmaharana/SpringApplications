package com.rxp.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		((AbstractApplicationContext)context).registerShutdownHook();
		
		Restaruant restaruant = context.getBean("restaruant", Restaruant.class);
		restaruant.setGreetingMessage("Welcome to our Restaruant !");
		System.out.println(restaruant);
	}
}