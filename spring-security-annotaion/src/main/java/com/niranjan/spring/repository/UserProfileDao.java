package com.niranjan.spring.repository;

import java.util.List;

import com.niranjan.spring.model.UserProfile;

public interface UserProfileDao {
	 
    List<UserProfile> findAll();
     
    UserProfile findByType(String type);
     
    UserProfile findById(int id);
}