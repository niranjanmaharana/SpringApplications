package com.rxp.spring.model;

import org.springframework.stereotype.Component;

@Component
public class Circle implements Shape {
	private String name;

	public Circle() {}

	public Circle(String name){
		this.name = name;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public void draw() {
		System.out.println("Circle name : " + name);
	}	
}