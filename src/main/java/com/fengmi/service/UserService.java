package com.fengmi.service;

import com.fengmi.entity.User;

public interface UserService {
	
	User login(User user) throws Exception;

	User getUserByName(String username) throws Exception;

	boolean register(User user) throws Exception;
	
}
