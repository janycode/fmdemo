package com.fengmi.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 1.解决 post 请求中文乱码
		request.setCharacterEncoding("utf-8");
        
		// 2.解决 响应 中文乱码
		response.setCharacterEncoding("utf-8"); 
		
		// 3.解决 浏览器解析 中文乱码(text/css 用于 login.css 样式文件的加载)
		response.setContentType("text/css;charset=utf-8");
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

	}

}
