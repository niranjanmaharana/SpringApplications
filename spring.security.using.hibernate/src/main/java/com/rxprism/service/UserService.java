package com.rxprism.service;

import java.util.List;

import com.rxprism.vo.User;

public interface UserService {
	public User getUserByCredentail(String userName,String password);
	public List<User> getAllUsers();
	public User getUserById(int userId);
}