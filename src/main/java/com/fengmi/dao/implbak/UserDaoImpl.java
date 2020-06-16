//package com.fengmi.dao.implbak;
//
//import java.sql.SQLException;
//
//import org.apache.commons.dbutils.QueryRunner;
//import org.apache.commons.dbutils.handlers.BeanHandler;
//
//import com.fengmi.dao.UserDao;
//import com.fengmi.entity.User;
//import com.fengmi.utils.JDBCUtils;
//
//public class UserDaoImpl implements UserDao {
//	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
//
//	@Override
//	public User login(User user) throws SQLException {
//		return qr.query(
//				"select * from t_user where username=? and password=?",
//				new BeanHandler<>(User.class),
//				user.getUsername(),
//				user.getPassword());
//	}
//
//	@Override
//	public User getUserByName(String username) throws SQLException {
//		return qr.query(
//				"select * from t_user where username=?",
//				new BeanHandler<>(User.class),
//				username);
//	}
//
//	@Override
//	public int register(User user) throws SQLException {
//		return qr.update(
//				"insert into t_user(username, password, phone, mail) values(?,?,?,?)",
//				user.getUsername(),
//				user.getPassword(),
//				user.getPhone(),
//				user.getMail());
//	}
//}
