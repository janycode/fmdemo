package com.fengmi.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtils {
    private static ComboPooledDataSource dataSource;

    static {
        dataSource = new ComboPooledDataSource();
    }

    public static ComboPooledDataSource getDataSource() {
        return dataSource;
    }
}
