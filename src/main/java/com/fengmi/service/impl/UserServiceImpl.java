package com.fengmi.service.impl;

import com.fengmi.dao.UserDao;
import com.fengmi.entity.User;
import com.fengmi.service.UserService;
import com.fengmi.utils.MyBatisUtils;

public class UserServiceImpl implements UserService {
	//private UserDao userDao = new UserDaoImpl();

	@Override
	public User login(User user) throws Exception {
		return MyBatisUtils.getMapper(UserDao.class).login(user);
	}

	@Override
	public User getUserByName(String username) throws Exception {
		return MyBatisUtils.getMapper(UserDao.class).getUserByName(username);
	}

	@Override
	public boolean register(User user) throws Exception {
		int res = MyBatisUtils.getMapper(UserDao.class).register(user);
		if (res == 1) {
			MyBatisUtils.commit();
			return true;
		}
		return false;
	}
}
