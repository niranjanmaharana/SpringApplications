package com.rxp.spring.properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component(value = "dbProperties")
public class DBProperties {
	@Value("${db.driver}")
	private String driver;
	@Value("${db.url}")
	private String url;
	@Value("${db.username}")
	private String username;
	@Value("${db.password}")
	private String password;
	
	@Override
	public String toString() {
		return "DBProperties [driver=" + driver + ", url=" + url + ", username=" + username + ", password=" + password
				+ "]";
	}
}