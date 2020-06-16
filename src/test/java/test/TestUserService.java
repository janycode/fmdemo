package test;

import org.junit.Before;
import org.junit.Test;

import com.fengmi.entity.User;
import com.fengmi.service.UserService;
import com.fengmi.service.impl.UserServiceImpl;

/**
 * UserServiceImpl µ¥Ôª²âÊÔ
 * 
 * @author Jerry
 */
public class TestUserService {

	private UserService us;

	@Before
	public void init() {
		us = new UserServiceImpl();
	}

	@Test
	public void test() throws Exception {
		User user = new User();
		user.setUsername("admin");
		user.setPassword("1234");
		print(us.login(user));
	}
	
	private void print(Object o) {
		System.out.println(o);
	}

}
