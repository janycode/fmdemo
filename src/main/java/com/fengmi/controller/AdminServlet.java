package com.fengmi.controller;

import java.util.Date;
import java.util.UUID;

import javax.management.Query;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fengmi.entity.QueryCondition;
import org.apache.commons.beanutils.BeanUtils;

import com.fengmi.entity.Admin;
import com.fengmi.entity.Goods;
import com.fengmi.entity.PageBean;
import com.fengmi.service.AdminService;
import com.fengmi.service.GoodsService;
import com.fengmi.service.impl.AdminServiceImpl;
import com.fengmi.service.impl.GoodsServiceImpl;

/**
 * 后台管理系统 - 功能
 * @author Administrator
 */
@WebServlet("/admin")
@MultipartConfig
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	private AdminService adminService = new AdminServiceImpl();
	private GoodsService goodsService = new GoodsServiceImpl();
	
	/**
	 * 登陆功能 login
	 * @param request
	 * @param response
	 */
	public String login(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("login...");
		
		Admin admin = new Admin();
		try {
			BeanUtils.populate(admin, request.getParameterMap());
			if (null != adminService.login(admin)) {
				request.getSession().setAttribute("admin", admin);
				return "redirect:/admin?methodName=toGetGoodsList";
			} else {
				request.setAttribute("errMsg", "账号或密码错误，请重试！");
				return "/after/login.jsp";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/after/login.jsp";
	}
	
	/**
	 * 登出功能 logout
	 * @param request
	 * @param response
	 */
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("logout...");
		
		request.getSession().invalidate();
		return "redirect:/after/login.jsp";
	}

	/**
	 * 分页显示功能 跳转 goods_list.jsp
	 * @param request
	 * @param response
	 * @return
	 */
	public String toGetGoodsList(HttpServletRequest request, HttpServletResponse response) {
		String currentPageStr = request.getParameter("currentPage");
		Integer currentPageNo = currentPageStr == null ? 1 : Integer.parseInt(currentPageStr);
		
		try {
			PageBean<Goods> pageBean = goodsService.getAllGoodsByPageNo(currentPageNo);
			request.setAttribute("pageBean", pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/after/goods_list.jsp";
	}

	/**
	 * 添加 / 修改方法 saveOrUpdate
	 * @param request
	 * @param response
	 * @return
	 */
	public String saveOrUpdate(HttpServletRequest request, HttpServletResponse response) {
		Goods goods = new Goods();
		String id = request.getParameter("id"); // ""
		
		try {
			// 单独设置 添加/修改 时间
			goods.setDeployDate(new Date());
			// 单独设置 图片路径
			Part part = request.getPart("imgPath");
			String imgPath = UUID.randomUUID().toString().replace("-", "") + "-" + part.getSubmittedFileName();
			part.write("D:\\tomcat\\apache-tomcat-9.0.35-fileServer\\webapps\\uploadfile\\images\\" + imgPath);
			goods.setImgPath(imgPath);
			// 工具类 封装其他属性
			BeanUtils.populate(goods, request.getParameterMap());
			System.out.println("新的：" + goods);

			if (null == id || "".equals(id)) {
				// id 为""空时：添加
				if (!goodsService.saveOneGoods(goods)) {
					// 添加失败
					request.setAttribute("errMsg", "未知错误，添加失败！");
					return "/after/add_goods.jsp";
				}
				// 添加成功，nothing to do
			} else {
				// id 不空时：修改
				if (!goodsService.updateOneGoods(goods)) {
					// 修改失败
					request.setAttribute("errMsg", "未知错误，修改失败！");
					return "/after/add_goods.jsp";
				}
				// 修改成功，nothing to do
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/admin?methodName=toGetGoodsList";
	}

	/**
	 * 根据 id 获取商品信息
	 * @param request
	 * @param response
	 * @return
	 */
	public String getGoodsById(HttpServletRequest request, HttpServletResponse response) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		try {
			Goods goods = goodsService.getGoodsById(id);
			System.out.println("修改：" + goods);
			request.setAttribute("goods", goods);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/after/add_goods.jsp";
	}

	/**
	 * 通过 id 删除1个商品
	 * @param request
	 * @param response
	 * @return
	 */
	public String delGoodsById(HttpServletRequest request, HttpServletResponse response) {
		Integer id = Integer.valueOf(request.getParameter("id"));

		try {
			boolean result = goodsService.delGoodsById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin?methodName=toGetGoodsList";
	}

	/**
	 * 根据 条件 查询商品，并分页
	 * @param request
	 * @param response
	 * @return
	 */
	public String queryGoodsByCondition(HttpServletRequest request, HttpServletResponse response) {
		// 第一次进入控制 那么获取到的 pageNo参数的值 应该是 null
		String currentPageStr = request.getParameter("currentPage");
		if (null == currentPageStr) {
			currentPageStr = "1";
			request.getSession().setAttribute("condition", null);
		}

		String inputGoodsName = request.getParameter("inputGoodsName");
		String typeId = request.getParameter("typeId");
		QueryCondition qc = new QueryCondition();
		QueryCondition condition = (QueryCondition) request.getSession().getAttribute("condition");
		// 如果输入不为空，使用输入条件；如果 session 不为空，则使用域中条件
		if ((null != inputGoodsName && !"".equals(inputGoodsName))
			|| (null != typeId && !"".equals(typeId))) {
			qc.setInputGoodsName(inputGoodsName);
			qc.setTypeId(typeId);
		} else if(!"".equals(condition.getInputGoodsName()) || !"".equals(condition.getTypeId())) {
			qc = condition;
		}
		System.out.println("查询条件：" + qc);

		try {
			PageBean<Goods> pageBean = goodsService.queryGoodsByCondition(Integer.parseInt(currentPageStr), qc);
			request.setAttribute("pageBean", pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/after/goods_list.jsp";
	}
}
