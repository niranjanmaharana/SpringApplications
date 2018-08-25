package com.rxprism.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.rxprism.service.UserService;
import com.rxprism.vo.User;

@Component
public class AuthManager implements AuthenticationProvider{
	@Autowired UserService userService;

	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken token = null;
		String password = authentication.getCredentials().toString();
 		String userName = authentication.getName();
 		User user = userService.getUserByCredentail(userName, password);
 		if(user == null){
 			return null;
 		}else{
 			List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
			grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole().getUserRole()));
			token = new UsernamePasswordAuthenticationToken(user, userName, grantedAuthorities);
			token.setDetails(user);
			return token;
 		}
	}

	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}