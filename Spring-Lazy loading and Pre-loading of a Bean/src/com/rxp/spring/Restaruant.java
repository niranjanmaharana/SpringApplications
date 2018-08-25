package com.rxp.spring;

public class Restaruant {
	private String greetingMessage;

	public Restaruant() {
		System.out.println("Restaruant.Restaruant()");
	}
	
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