package com.niranjan.spring.repository;

import java.util.List;

import com.niranjan.spring.model.User;

public interface UserDao {
	 
    User findById(int id);
     
    User findBySSO(String sso);
     
    void save(User user);
     
    void deleteBySSO(String sso);
     
    List<User> findAllUsers();
 
}