package com.fengmi.service.impl;

import com.fengmi.dao.AdminDao;
import com.fengmi.entity.Admin;
import com.fengmi.service.AdminService;
import com.fengmi.utils.MyBatisUtils;

public class AdminServiceImpl implements AdminService {

	//private AdminDao adminDao = new AdminDaoImpl();

	@Override
	public Admin login(Admin admin) throws Exception {
		return MyBatisUtils.getMapper(AdminDao.class).login(admin);
	}
	
}
