package com.rxp.spring;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;

public class DisplayBeanNames implements BeanPostProcessor{

	@Override
	public Object postProcessAfterInitialization(Object object, String beanName) throws BeansException {
		System.out.println("After initializing bean : " + beanName);
		System.out.println("After initialization bean : " + object);
		return object;
	}

	@Override
	public Object postProcessBeforeInitialization(Object object, String beanName) throws BeansException {
		System.out.println("Before initializing bean : " + beanName);
		System.out.println("Before initialization bean : " + object);
		return object;
	}

}