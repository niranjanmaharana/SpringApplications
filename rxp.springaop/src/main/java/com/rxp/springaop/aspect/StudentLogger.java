package com.rxp.springaop.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

import com.rxp.springaop.service.StudentService;

@Aspect
public class StudentLogger {
	private static Logger logger = Logger.getLogger(StudentService.class);
	
	@Before("execution(* com.rxp.springaop.service.StudentService.getStudent())")
	public void executeBefore(JoinPoint joinPoint){
		logger.info("Logic to be executed before the method execution starts.");
	}
	
	@After("execution(* com.rxp.springaop.service.StudentService.getStudent())")
	public void executeAfter(JoinPoint joinPoint){
		logger.info("Logic to be executed after the method execution completes.");
	}
}