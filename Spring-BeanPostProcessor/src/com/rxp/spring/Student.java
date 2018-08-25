package com.rxp.spring;

import org.springframework.beans.factory.annotation.Required;

public class Student{
	private int rollNo;
	private String studentName;

	public Student() {
		System.out.println("Student.Student()");
	}
		
	public int getRollNo() {
		return rollNo;
	}
	
	@Required
	public void setRollNo(int rollNo) {
		this.rollNo = rollNo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	@Override
	public String toString() {
		return "Student [rollNo=" + rollNo + ", studentName=" + studentName + "]";
	}
}