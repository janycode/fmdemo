package com.fengmi.utils;

import java.text.SimpleDateFormat;

public class DateUtils {
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * String >> java.util.Date
	 * @param date
	 * @return
	 */
	public java.util.Date strToDate(String date) {
		try {
			return sdf.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * java.util.Date >> java.sql.Date
	 * @param date
	 * @return
	 */
	public java.sql.Date utilToSqlDate(java.util.Date date) {
		return new java.sql.Date(date.getTime());
	}
}
