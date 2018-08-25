package org.niranjan.spring;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.niranjan.spring.model.Marksheet;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		ApplicationContext ctx = new AnnotationConfigApplicationContext("org.niranjan.spring");
		
		List<Marksheet> result = ctx.getBean(JdbcTemplate.class).query("select studentId,totalMark FROM marksheet", 
        		new RowMapper<Marksheet>() {
            @Override
            public Marksheet mapRow(ResultSet rs, int row) throws SQLException {
                return new Marksheet(rs.getString(1), Integer.parseInt(rs.getString(2)));
            }
        });
		
		System.out.println("Number of Record:"+result.size());
	}
}