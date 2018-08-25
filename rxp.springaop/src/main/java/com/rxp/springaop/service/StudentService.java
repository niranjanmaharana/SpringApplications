package com.rxp.springaop.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.rxp.springaop.model.Student;

public class StudentService {
	@Autowired private Student student;
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public Student getStudent(){
		System.out.println(student);
		return student;
	}
}