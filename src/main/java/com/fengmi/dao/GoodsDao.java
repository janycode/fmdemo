package com.fengmi.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fengmi.entity.Goods;
import com.fengmi.entity.QueryCondition;
import org.apache.ibatis.annotations.Param;

public interface GoodsDao {

	List<Goods> getAllGoods() throws Exception;

	Integer getTotalNumber() throws Exception;

	List<Goods> getGoodsByPage(@Param("offset") Integer offset, @Param("pageSize") Integer pageSize) throws Exception;

	int addGoods(Goods goods) throws Exception;

	int delGoodsById(Integer id) throws Exception;

	int updateOneGoods(Goods goods) throws Exception;

	Goods getGoodsById(Integer id) throws Exception;

	Integer getTotalNumber(QueryCondition condition) throws Exception;

	List<Goods> getGoodsByPage(Integer offset, Integer pageSize, QueryCondition condition) throws Exception;
}
