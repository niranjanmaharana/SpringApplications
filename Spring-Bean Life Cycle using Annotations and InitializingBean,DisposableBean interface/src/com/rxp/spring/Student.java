package com.rxp.spring;

import org.springframework.web.bind.annotation.InitBinder;

public class Student {
	private int rollNo;
	private String studentName;

	public Student() {
		System.out.println("Student.Student()");
	}
		
	public int getRollNo() {
		return rollNo;
	}

	public void setRollNo(int rollNo) {
		this.rollNo = rollNo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public void init(){
		System.out.println("Student instance is initialized.");
	}
	
	public void destroy(){
		System.out.println("Student instance is about to be destroyed !");
	}
	
	@Override
	public String toString() {
		return "Student [rollNo=" + rollNo + ", studentName=" + studentName + "]";
	}
}