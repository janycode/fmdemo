package com.fengmi.service.impl;

import com.fengmi.dao.GoodsDao;
import com.fengmi.entity.Goods;
import com.fengmi.entity.PageBean;
import com.fengmi.entity.QueryCondition;
import com.fengmi.service.GoodsService;
import com.fengmi.utils.MyBatisUtils;

import java.util.List;

public class GoodsServiceImpl implements GoodsService {
	
	//private GoodsDao goodsDao = new GoodsDaoImpl();

	@Override
	public List<Goods> getAllGoods() throws Exception {
		return MyBatisUtils.getMapper(GoodsDao.class).getAllGoods();
	}

	@Override
	public PageBean<Goods> getAllGoodsByPageNo(Integer currentPageNo) throws Exception {
		PageBean<Goods> pageBean = new PageBean<>();
		
		// 当前页码
		pageBean.setCurrentPage(currentPageNo);
		// 总记录数
		Integer totalSize = MyBatisUtils.getMapper(GoodsDao.class).getTotalNumber();
		pageBean.setTotalSize(totalSize);
		// 每页记录数 - 默认值
		Integer pageSize = pageBean.getPageSize();
		// 总页数
		Integer totalPage = (totalSize % pageSize == 0) ? (totalSize / pageSize) : (totalSize / pageSize + 1);
		pageBean.setTotalPage(totalPage);
		// 每页详细数据
		List<Goods> list = MyBatisUtils.getMapper(GoodsDao.class).getGoodsByPage(pageSize*(currentPageNo-1), pageSize);
		pageBean.setPageList(list);

		MyBatisUtils.commit();
		return pageBean;
	}

	@Override
	public boolean saveOneGoods(Goods goods) throws Exception {
		int res = MyBatisUtils.getMapper(GoodsDao.class).addGoods(goods);
		System.out.println("添加：res=" + res);
		if (res == 1) {
			MyBatisUtils.commit();
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean delGoodsById(Integer id) throws Exception {
		int res = MyBatisUtils.getMapper(GoodsDao.class).delGoodsById(id);
		System.out.println("删除：res=" + res);
		if (res == 1) {
			MyBatisUtils.commit();
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateOneGoods(Goods goods) throws Exception {
		int res = MyBatisUtils.getMapper(GoodsDao.class).updateOneGoods(goods);
		System.out.println("更新：res=" + res);
		if (res == 1) {
			MyBatisUtils.commit();
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Goods getGoodsById(Integer id) throws Exception {
		return MyBatisUtils.getMapper(GoodsDao.class).getGoodsById(id);
	}

	@Override
	public PageBean<Goods> queryGoodsByCondition(Integer currentPageNo, QueryCondition condition) throws Exception {
		PageBean<Goods> pageBean = new PageBean<>();

		// 当前页码
		pageBean.setCurrentPage(currentPageNo);
		// 总记录数
		Integer totalSize = MyBatisUtils.getMapper(GoodsDao.class).getTotalNumber(condition);
		pageBean.setTotalSize(totalSize);
		// 每页记录数 - 默认值
		Integer pageSize = pageBean.getPageSize();
		// 总页数
		Integer totalPage = (totalSize % pageSize == 0) ? (totalSize / pageSize) : (totalSize / pageSize + 1);
		pageBean.setTotalPage(totalPage);
		// 每页详细数据
		List<Goods> list = MyBatisUtils.getMapper(GoodsDao.class).getGoodsByPage(pageSize*(currentPageNo-1), pageSize, condition);
		pageBean.setPageList(list);

		MyBatisUtils.commit();
		return pageBean;
	}
}
