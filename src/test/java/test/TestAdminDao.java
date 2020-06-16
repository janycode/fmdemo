package test;

import com.fengmi.dao.AdminDao;
import com.fengmi.entity.Admin;
import com.fengmi.utils.MyBatisUtils;
import org.junit.Test;

import java.sql.SQLException;

public class TestAdminDao {

    @Test
    public void test() throws SQLException {
        Admin admin = new Admin(null, "admin", "admin");
        Admin loginAdmin = MyBatisUtils.getMapper(AdminDao.class).login(admin);
        System.out.println(loginAdmin);
    }

}
