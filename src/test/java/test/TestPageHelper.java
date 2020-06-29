package test;

import com.fengmi.dao.GoodsDao;
import com.fengmi.entity.Goods;
import com.fengmi.utils.MyBatisUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;

import java.util.List;

public class TestPageHelper {

    @Test
    public void testPageHelper() throws Exception {
        for (int i = 1; i <= 5 ; i++) {
            GoodsDao goodsDao = MyBatisUtils.getMapper(GoodsDao.class);
            // 配置分页，并检测当前线程中下一条 sql 语句，并追加 limit 参数进行查询
            PageHelper.startPage(i, 5);
            List<Goods> goodsList = goodsDao.getAllGoods();

            PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
            System.out.println("-----------------------");
            System.out.println(i + " pageInfo: " + goodsPageInfo);
        }
    }
}
