package com.rxp.spring.model;

import java.util.Date;
import java.util.List;

public class Student {
	private int rollNo;
	private String studentName;
	
	private long mobileNumber;
	//@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date studentDob;
	private List<String> skills;
	private Address address;
	
	public Student() {
		super();
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
	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public Date getStudentDob() {
		return studentDob;
	}
	public void setStudentDob(Date studentDob) {
		this.studentDob = studentDob;
	}
	public List<String> getSkills() {
		return skills;
	}
	public void setSkills(List<String> skills) {
		this.skills = skills;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Student [rollNo=" + rollNo + ", studentName=" + studentName + ", mobileNumber=" + mobileNumber
				+ ", skills=" + skills + ", address=" + address + "]";
	}
}