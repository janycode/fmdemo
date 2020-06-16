package com.fengmi.controller;

import java.io.File;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.fengmi.entity.User;
import com.fengmi.service.UserService;
import com.fengmi.service.impl.UserServiceImpl;

@WebServlet("/user")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	// 登陆结果标记信息
	private static final String LOGIN_SUCCESS = "1";
	private static final String LOGIN_ERROR = "2";
	private static final String LOGIN_CODE_ERR = "3";

	private UserService userService = new UserServiceImpl();
	
	/**
	 * 登陆方法 login
	 * @param request
	 * @param response
	 * @return
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			String inputQrCode = request.getParameter("validatecode");
			
			String qrCode = (String) request.getSession().getAttribute("key");
			System.out.println("inputQrCode = " + inputQrCode);
			System.out.println("generQrCode = " + qrCode);
			if (!qrCode.equals(inputQrCode)) {
				// 验证码错误
				response.getWriter().print(LOGIN_CODE_ERR);
				return;
			}
			
			User existUser = userService.login(user);
			System.out.println(existUser + "");
			if (null != existUser) {
				// 登陆成功 - 页面有跳转
				request.getSession().setAttribute("existUser", existUser);
				response.getWriter().print(LOGIN_SUCCESS);
			} else {
				// 登陆失败
				response.getWriter().print(LOGIN_ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 校验用户名方法：validateUsr
	 * 存在响应 true；不存在响应 false
	 * @param request
	 * @param response
	 */
	public void validateUsr(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		
		try {
			User user = userService.getUserByName(username);
			if (null != user) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 注册方法 register
	 * @param request
	 * @param response
	 */
	public void register(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		
		try {
			BeanUtils.populate(user, request.getParameterMap());
			System.out.println("register: " + user);
			
			if (userService.register(user)) {
				// 注册成功，重定向到成功页面
				response.sendRedirect(request.getContextPath() + File.separator + "before/success.html");
			} else {
				//nothing to do.
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
