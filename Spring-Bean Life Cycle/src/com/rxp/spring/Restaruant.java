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
	
	public void init(){
		System.out.println("Restaruant instance is initialized !");
	}
	
	public void destroy(){
		System.out.println("Restaruant instance is about to be destroyed !");
	}
	
	@Override
	public String toString() {
		return "Restaruant [greetingMessage=" + greetingMessage + "]";
	}
}