//package com.fengmi.dao.implbak;
//
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Map;
//
//import com.fengmi.entity.QueryCondition;
//import org.apache.commons.beanutils.BeanUtils;
//import org.apache.commons.dbutils.QueryRunner;
//import org.apache.commons.dbutils.handlers.*;
//
//import com.fengmi.dao.GoodsDao;
//import com.fengmi.entity.Goods;
//import com.fengmi.entity.GoodsType;
//import com.fengmi.utils.JDBCUtils;
//
//public class GoodsDaoImpl implements GoodsDao {
//
//    private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
//
//    @Override
//    public List<Goods> getAllGoods() throws Exception {
//        List<Goods> list = new ArrayList<Goods>();
//
//        List<Map<String, Object>> mapList = qr.query(
//                "SELECT t_goods.id, goodsName, price, imgPath, deployDate, description, typeId, typename " +
//                        "FROM t_goods,t_goodstype " +
//                        "WHERE t_goods.`typeId`=t_goodstype.`id`",
//                new MapListHandler()
//        );
//
//        for (Map<String, Object> map : mapList) {
//            Goods goods = new Goods();
//            GoodsType goodsType = new GoodsType();
//            BeanUtils.populate(goods, map);
//            BeanUtils.populate(goodsType, map);
//            goods.setGoodsType(goodsType);
//            list.add(goods);
//        }
//        return list;
//    }
//
//    /**
//     * 获取商品总数
//     * @return
//     * @throws Exception
//     */
//    @Override
//    public Integer getTotalNumber() throws Exception {
//        return qr.query(
//                "SELECT COUNT(1) FROM t_goods",
//                new ScalarHandler<Long>()
//        ).intValue();
//    }
//
//    /**
//     * 获取商品表中指定id的商品信息
//     * @return 对象数组
//     */
//    public Map<String, Object> getRowData() throws SQLException {
//        return qr.query(
//                "SELECT * FROM t_goods WHERE id=?",
//                new MapHandler(),
//                10
//        );
//    }
//
//    @Override
//    public List<Goods> getGoodsByPage(Integer offset, Integer pageSize) throws Exception {
//        List<Goods> list = new ArrayList<Goods>();
//
//        List<Map<String, Object>> mapList = qr.query(
//                "SELECT t_goods.id, goodsName, price, imgPath, deployDate, description, typeId, typename " +
//                        "FROM t_goods,t_goodstype " +
//                        "WHERE t_goods.`typeId`=t_goodstype.`id` " +
//                        "LIMIT ?,?",
//                new MapListHandler(),
//                offset,
//                pageSize
//        );
//
//        for (Map<String, Object> map : mapList) {
//            Goods goods = new Goods();
//            GoodsType goodsType = new GoodsType();
//            BeanUtils.populate(goods, map);
//            BeanUtils.populate(goodsType, map);
//            goods.setGoodsType(goodsType);
//            list.add(goods);
//        }
//        return list;
//    }
//
//    @Override
//    public int addGoods(Goods goods) throws Exception {
//        return qr.update(
//                "INSERT INTO t_goods(goodsName, price, imgPath, deployDate, description, typeId) VALUES(?,?,?,?,?,?);",
//                goods.getGoodsName(),
//                goods.getPrice(),
//                goods.getImgPath(),
//                goods.getDeployDate(),
//                goods.getDescription(),
//                goods.getTypeId());
//    }
//
//    @Override
//    public int updateOneGoods(Goods goods) throws Exception {
//        return qr.update(
//                "UPDATE t_goods SET goodsName=?, price=?, imgPath=?, deployDate=?, description=?, typeId=? WHERE id=?",
//                goods.getGoodsName(),
//                goods.getPrice(),
//                goods.getImgPath(),
//                goods.getDeployDate(),
//                goods.getDescription(),
//                goods.getTypeId(),
//                goods.getId());
//    }
//
//    /**
//     * 单表查询，封装完整的商品信息
//     * @param id 编号
//     * @return 商品信息
//     */
//    @Override
//    public Goods getGoodsByIdTest(Integer id) throws Exception {
//        Goods goods = qr.query(
//                "SELECT * FROM t_goods WHERE id=?",
//                new BeanHandler<>(Goods.class),
//                id
//        );
//        return goods;
//    }
//
//
//    /**
//     * 连表查询，封装完整的商品信息
//     * @param id 编号
//     * @return 商品信息
//     */
//    @Override
//    public Goods getGoodsById(Integer id) throws Exception {
//        Goods goods = new Goods();
//        GoodsType goodsType = new GoodsType();
//
//        Map<String, Object> map = qr.query(
//                "SELECT t_goods.id, goodsName, price, imgPath, deployDate, description, typeId, typename " +
//                        "FROM t_goods,t_goodstype " +
//                        "WHERE t_goods.`typeId`=t_goodstype.`id` AND t_goods.`id`=?",
//                new MapHandler(), // BeanHandler 无法直接封装
//                id
//        );
//
//        BeanUtils.populate(goods, map);
//        BeanUtils.populate(goodsType, map);
//        goods.setGoodsType(goodsType);
//        return goods;
//    }
//
//    @Override
//    public int delGoodsById(Integer id) throws Exception {
//        return qr.update(
//                "DELETE FROM t_goods WHERE id=?",
//                id);
//    }
//
//    @Override
//    public Integer getTotalNumber(QueryCondition condition) throws Exception {
//        return null;
//    }
//
//    @Override
//    public List<Goods> getGoodsByPage(Integer offset, Integer pageSize, QueryCondition condition) throws Exception {
//        return null;
//    }
//
//}
