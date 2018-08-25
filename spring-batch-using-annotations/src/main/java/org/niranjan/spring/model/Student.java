package org.niranjan.spring.model;

public class Student {
	private String stdId;
	private int subMarkOne;
	private int subMarkTwo;
	
	public Student() {
		super();
	}
	public String getStdId() {
		return stdId;
	}
	public void setStdId(String stdId) {
		this.stdId = stdId;
	}
	public int getSubMarkOne() {
		return subMarkOne;
	}
	public void setSubMarkOne(int subMarkOne) {
		this.subMarkOne = subMarkOne;
	}
	public int getSubMarkTwo() {
		return subMarkTwo;
	}
	public void setSubMarkTwo(int subMarkTwo) {
		this.subMarkTwo = subMarkTwo;
	}
}