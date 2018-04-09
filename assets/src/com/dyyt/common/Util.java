package com.dyyt.common;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;

public class Util{
	
	/**
	 * 时间对比
	 * @param DATE1
	 * @param DATE2
	 * @return
	 */
	public boolean compare_date(String DATE1, String DATE2) {
		boolean b = false;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            if (dt1.getTime() <= dt2.getTime()) {
                b=true;
            } else {
                b=false;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return b;
    }
	/**
	 * 时间对比
	 * @param DATE1
	 * @param DATE2
	 * * @param DATE3
	 * @return
	 */
	public boolean compare_date1(String DATE1, String DATE2,String DATE3) {
		boolean b = false;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            Date dt3 = df.parse(DATE3);
            if (dt1.getTime() >= dt2.getTime()&&dt1.getTime() <= dt3.getTime()) {
                b=true;
            } else {
                b=false;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return b;
    }
}
