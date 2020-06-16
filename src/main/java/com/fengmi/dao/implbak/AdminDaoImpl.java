package com.fengmi.dao.implbak;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.fengmi.dao.AdminDao;
import com.fengmi.entity.Admin;
import com.fengmi.utils.JDBCUtils;

//public class AdminDaoImpl implements AdminDao {
//
//	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
//
//	@Override
//	public Admin login(Admin admin) throws SQLException {
//		return qr.query(
//				"select * from admin where username=? and password=?",
//				new BeanHandler<>(Admin.class),
//				admin.getUsername(),
//				admin.getPassword());
//	}
//
//}
