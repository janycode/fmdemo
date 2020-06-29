package com.fengmi.service;

import java.util.List;

import com.fengmi.entity.Goods;
import com.fengmi.entity.PageBean;
import com.fengmi.entity.QueryCondition;

public interface GoodsService {

	List<Goods> getAllGoods() throws Exception;

	PageBean<Goods> getAllGoodsByPageNo(Integer currentPageNo) throws Exception;

	boolean saveOneGoods(Goods goods) throws Exception;

	boolean updateOneGoods(Goods goods) throws Exception;

	Goods getGoodsById(Integer id) throws Exception;

    boolean delGoodsById(Integer id) throws Exception;

    // 使用分页插件 pageHelper
    PageBean<Goods> queryGoodsByCondition(Integer currentPageNo, QueryCondition condition) throws Exception;
}
