package com.rxp.spring;

public class Circle {
	private Point center;

	public Point getCenter() {
		return center;
	}
	public void setCenter(Point center) {
		this.center = center;
	}
	@Override
	public String toString() {
		return "Circle [center=" + center + "]";
	}
}