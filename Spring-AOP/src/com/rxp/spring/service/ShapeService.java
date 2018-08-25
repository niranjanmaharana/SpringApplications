package com.rxp.spring.service;

import org.springframework.stereotype.Component;

import com.rxp.spring.model.Circle;
import com.rxp.spring.model.Triangle;

@Component
public class ShapeService {
	private Circle circle;
	private Triangle triangle;
	
	public ShapeService() {}
	
	public Circle getCircle() {
		return circle;
	}
	public void setCircle(Circle circle) {
		this.circle = circle;
	}
	public Triangle getTriangle() {
		return triangle;
	}
	public void setTriangle(Triangle triangle) {
		this.triangle = triangle;
	}
}