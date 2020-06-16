package com.fengmi.dao;

import java.sql.SQLException;

import com.fengmi.entity.Admin;

public interface AdminDao {

	Admin login(Admin admin) throws SQLException;

}
