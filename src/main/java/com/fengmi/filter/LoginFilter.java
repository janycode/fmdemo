package com.fengmi.filter;

import java.io.File;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengmi.entity.Admin;

@WebFilter(urlPatterns = {"/after/goods_list.jsp", 
						  "/after/goods_type_list.jsp", 
						  "/after/user.jsp", 
						  "/after/add_goods.jsp",
						  "/after/add_goods_list.jsp"})
public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		Admin admin = (Admin) req.getSession().getAttribute("admin");
		if (null == admin) {
			System.out.println("Filter:" + req.getRequestURI());
			// Î´µÇÂ¼£¬Ìø×ªµ½µÇÂ½Ò³Ãæ
			resp.sendRedirect(req.getContextPath() + File.separator + "after/login.jsp");
		}
		System.out.println("No Filter");
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

	}

}
