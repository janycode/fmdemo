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
	// ��½��������Ϣ
	private static final String LOGIN_SUCCESS = "1";
	private static final String LOGIN_ERROR = "2";
	private static final String LOGIN_CODE_ERR = "3";

	private UserService userService = new UserServiceImpl();
	
	/**
	 * ��½���� login
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
				// ��֤�����
				response.getWriter().print(LOGIN_CODE_ERR);
				return;
			}
			
			User existUser = userService.login(user);
			System.out.println(existUser + "");
			if (null != existUser) {
				// ��½�ɹ� - ҳ������ת
				request.getSession().setAttribute("existUser", existUser);
				response.getWriter().print(LOGIN_SUCCESS);
			} else {
				// ��½ʧ��
				response.getWriter().print(LOGIN_ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * У���û���������validateUsr
	 * ������Ӧ true����������Ӧ false
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
	 * ע�᷽�� register
	 * @param request
	 * @param response
	 */
	public void register(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		
		try {
			BeanUtils.populate(user, request.getParameterMap());
			System.out.println("register: " + user);
			
			if (userService.register(user)) {
				// ע��ɹ����ض��򵽳ɹ�ҳ��
				response.sendRedirect(request.getContextPath() + File.separator + "before/success.jsp");
			} else {
				//nothing to do.
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
