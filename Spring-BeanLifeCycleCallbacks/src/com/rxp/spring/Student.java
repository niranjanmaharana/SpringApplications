package com.rxp.spring;

public class Student/* implements InitializingBean, DisposableBean*/{
	
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

	@Override
	public String toString() {
		return "Student [rollNo=" + rollNo + ", studentName=" + studentName + "]";
	}

	/*@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("Student bean has been initialized.");
	}

	@Override
	public void destroy() throws Exception {
		System.out.println("Student bean is about to be destroyed.");
	}*/
	
	public void init(){
		System.out.println("Student bean has been initialized.");
	}
	
	public void destroy(){
		System.out.println("Student bean is about to be destroyed.");
	}
}