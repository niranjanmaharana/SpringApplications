package com.rxprism.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.rxprism.manager.AuthManager;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired private AuthManager authenticationManager;
	@Autowired private DataSource dataSource;
	@Autowired private LogoutHandler logoutHandler;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests().antMatchers("/", "/home", "/am/**").permitAll()
			.antMatchers("/region/**","/state/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/user/**").access("hasRole('ROLE_ADMIN')")
			.anyRequest().authenticated()
			.and().formLogin().loginPage("/")
			.loginProcessingUrl("/am/processing")
			.defaultSuccessUrl("/am/success")
			.failureUrl("/am/failed")
			.usernameParameter("username")
			.passwordParameter("passowrd")
			.and().logout().logoutUrl("/am/logout").logoutSuccessHandler(logoutHandler)
			.and().exceptionHandling()
			.accessDeniedPage("/am/failed");
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**", "/fonts/**", "/static/**","contents/userImages/**", "/css/**", "/js/**", "/images/**");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(this.authenticationManager);
	}
}