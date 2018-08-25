package com.rxprism.dao;

import java.util.List;

import com.rxprism.vo.User;

public interface UserDao {
	public User getUserByCredentail(String userName,String password);
	public List<User> getAllUsers();
	public List<User> getAllDoctors();
	public User getUserById(int userId);
}