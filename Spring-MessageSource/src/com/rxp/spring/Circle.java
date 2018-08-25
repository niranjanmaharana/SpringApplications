package com.rxp.spring;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

@Component
public class Circle implements Shape {
	private Point center;
	@Autowired
	private MessageSource messageSource;
	
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

	public MessageSource getMessageSource() {
		return messageSource;
	}

	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

	@Override
	public void draw() {
		System.out.println(messageSource.getMessage("drawing.circle", new Object[]{this.center.getX(), this.center.getY()}, null));
	}

	@Override
	public String toString() {
		return "Circle [center=" + center + "]";
	}
	
	@PostConstruct
	public void initializeCircle(){
		System.out.println("Initializing circle : " + messageSource.getMessage("init-message", null, null));
	}
	
	@PreDestroy
	public void destroyCircle(){
		System.out.println("Destroying circle : " + messageSource.getMessage("destroy-message", null, null));
	}
}