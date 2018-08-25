package com.rxp.springaop.model;

public class Student {
	private int rollNo;
	private String studentName;
	
	public Student() {}

	public Student(int rollNo, String studentName) {
		super();
		this.rollNo = rollNo;
		this.studentName = studentName;
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

	@Override
	public String toString() {
		return "Student [rollNo=" + rollNo + ", studentName=" + studentName + "]";
	}
}