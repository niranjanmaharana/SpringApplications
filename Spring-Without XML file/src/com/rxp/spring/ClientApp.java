package com.rxp.spring;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class ClientApp {
	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(BeanConfigurer.class);
		Student student = context.getBean("student1", Student.class);
		System.out.println("Student : " + student);
		College college = context.getBean("college", College.class);
		System.out.println("College : " + college);
		Date date = context.getBean(Date.class);
		System.out.println("Current Date : " + date);
	}
}