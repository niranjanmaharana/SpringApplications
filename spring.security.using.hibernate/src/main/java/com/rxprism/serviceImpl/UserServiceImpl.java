package com.rxprism.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rxprism.daoImpl.UserDaoImpl;
import com.rxprism.service.UserService;
import com.rxprism.vo.User;

@Repository
public class UserServiceImpl implements UserService {
	@Autowired private UserDaoImpl userDao;

	public User getUserByCredentail(String userName, String password) {
		return userDao.getUserByCredentail(userName, password);
	}

	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	public User getUserById(int userId) {
		return userDao.getUserById(userId);
	}
}