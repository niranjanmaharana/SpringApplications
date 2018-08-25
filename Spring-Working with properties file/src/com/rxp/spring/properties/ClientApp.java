package com.rxp.spring.properties;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		DBProperties dbProperties = context.getBean("dbProperties", DBProperties.class);
		System.out.println("dbProperties : " + dbProperties);
	}
}