package test;

import com.fengmi.dao.GoodsDao;
import com.fengmi.entity.Goods;
import com.fengmi.utils.MyBatisUtils;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class TestGoodsDao {

    private GoodsDao goodsDao;

    @Before
    public void init() {
        goodsDao = MyBatisUtils.getMapper(GoodsDao.class);
    }

    @Test
    public void testGetAllGoods() throws Exception {
        List<Goods> goodsList = goodsDao.getAllGoods();
        System.out.println(goodsList);
    }

    @Test
    public void testGetTotalNumber() throws Exception {
        Integer totalNumber = goodsDao.getTotalNumber();
        System.out.println(totalNumber);
    }

    @Test
    public void testGetGoodsByPage() throws Exception {
        List<Goods> goodsByPage = goodsDao.getGoodsByPage(0, 10);
        System.out.println(goodsByPage);
    }

    @Test
    public void testDelGoodsById() throws Exception {
        int i = goodsDao.delGoodsById(141);
        MyBatisUtils.commit();
        System.out.println(i);
    }

    @Test
    public void testGetGoodsById() throws Exception {
        Goods goods = goodsDao.getGoodsById(1);
        System.out.println(goods);
    }

}
