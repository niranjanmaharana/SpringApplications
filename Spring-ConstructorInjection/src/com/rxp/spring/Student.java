package com.rxp.spring;

public class Student {
	private String studentName;
	private String address;
	
	public Student(String studentName, String address) {
		this.studentName = studentName;
		this.address = address;
	}
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Student [studentName=" + studentName + ", address=" + address + "]";
	}
}