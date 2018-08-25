package com.rxp.spring;

import java.util.Date;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

@Configuration
public class BeanConfigurer {
	
	public BeanConfigurer() {
		System.out.println("BeanConfigurer.BeanConfigurer()");
	}
	
	@Bean(name = "student")
	@DependsOn("college")
	public Student getStudent(){
		Student student = new Student();
		student.setRollNo(101);
		student.setStudentName("Niranjan");
		return student;
	}
	
	@Bean(name = "student1")
	public Student getStudent1(){
		Student student = new Student();
		student.setRollNo(102);
		student.setStudentName("Pabitra");
		return student;
	}
	
	@Bean(name = "college")
	public College getCollege(){
		College college = new College();
		college.setCollegeId(12356);
		college.setCollegeName("GIIT, Berhampur");
		return college;
	}
	
	@Bean
	public Date getCurrentDate(){
		return new Date();
	}
}