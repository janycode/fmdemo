package com.fengmi.dao;

import java.sql.SQLException;

import com.fengmi.entity.User;

public interface UserDao {

	User login(User user) throws SQLException;

	User getUserByName(String username) throws SQLException;

	int register(User user) throws SQLException;

}
