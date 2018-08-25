package com.rxp.springaop;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rxp.springaop.model.Student;
import com.rxp.springaop.service.StudentService;

/**
 * Hello world!
 *
 */
public class App{
	private static Logger logger = Logger.getLogger(StudentService.class);
    public static void main( String[] args )
    {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService studentService = context.getBean(StudentService.class);
        Student student = studentService.getStudent();
        logger.info("Student object found from service : " + student);
    }
}