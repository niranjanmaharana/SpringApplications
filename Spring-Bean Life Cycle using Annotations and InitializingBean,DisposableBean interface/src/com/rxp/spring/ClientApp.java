package com.rxp.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		((AbstractApplicationContext)context).registerShutdownHook();
		
		//using annotation
		Restaruant restaruant = context.getBean("restaruant", Restaruant.class);
		System.out.println(restaruant);
	}
}