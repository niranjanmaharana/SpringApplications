package com.rxp.spring;

public class Student {
	private int rollNo = 101;
	private String studentName = "Pitambar";
	{
		System.out.println("Student.enclosing_method() -> rollNo : " + rollNo + ", studentName : " + studentName);
	}
	public Student() {
		System.out.println("Student.Student()");
	}
	
	public Student(int rollNo) {
		System.out.println("Student.Student(int)");
		this.rollNo = rollNo;
	}
	
	public Student(String studentName){
		this.studentName = studentName;
		System.out.println("Student.getRollNo(String)");
	}

	public Student(int rollNo, String studentName){
		System.out.println("Student.Student(int, String) -> rollNo : " + rollNo + ", studentName : " + studentName);
		this.rollNo = rollNo;
		this.studentName = studentName;
	}
	
	public int getRollNo() {
		return rollNo;
	}

	public void setRollNo(int rollNo) {
		System.out.println("Student.setRollNo() -> rollNo : " + rollNo);
		this.rollNo = rollNo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		System.out.println("Student.setStudentName() -> studentName : " + studentName);
		this.studentName = studentName;
	}

	@Override
	public String toString() {
		return "Student [rollNo=" + rollNo + ", studentName=" + studentName + "]";
	}
}