package com.rxp.spring;

public class Restaruant {
	private String greetingMessage;

	public String getGreetingMessage() {
		return greetingMessage;
	}
	
	public void setGreetingMessage(String greetingMessage) {
		this.greetingMessage = greetingMessage;
	}
	
	@Override
	public String toString() {
		return "Restaruant [greetingMessage=" + greetingMessage + "]";
	}
}