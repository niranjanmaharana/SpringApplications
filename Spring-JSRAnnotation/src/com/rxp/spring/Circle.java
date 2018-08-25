package com.rxp.spring;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class Circle implements Shape {
	private Point center;
	
	public Circle() {}
	
	public Circle(Point center) {
		super();
		this.center = center;
	}

	public Point getCenter() {
		return center;
	}

	@Resource
	public void setCenter(Point center) {
		this.center = center;
	}

	@Override
	public void draw() {
		System.out.println("Circle.draw()");
	}

	@Override
	public String toString() {
		return "Circle [center=" + center + "]";
	}
	
	@PostConstruct
	public void initializeCircle(){
		System.out.println("Initializing circle");
	}
	
	@PreDestroy
	public void destroyCircle(){
		System.out.println("Destroying circle");
	}
}