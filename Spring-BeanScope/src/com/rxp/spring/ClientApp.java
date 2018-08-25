package com.rxp.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ClientApp {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		/*Restaruant restaruant1 = context.getBean("restaruant", Restaruant.class);
		restaruant1.setGreetingMessage("Welcome to our Restaruant !");
		System.out.println(restaruant1);
		
		Restaruant restaruant2 = context.getBean("restaruant", Restaruant.class);
		System.out.println(restaruant2);*/
		
		Student student = context.getBean("student", Student.class);
		System.out.println(student);
		
		College college = context.getBean("college", College.class);
		System.out.println(college);
	}
}