package com.rxp.spring.model;

import org.springframework.stereotype.Component;

@Component
public class Triangle implements Shape {
	private String name;

	public Triangle() {}

	public Triangle(String name){
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
		System.out.println("Triangle name : " + name);
	}
}