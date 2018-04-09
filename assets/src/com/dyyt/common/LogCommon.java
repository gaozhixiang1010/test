/**
 *Copyright：Copyright (c)  2014
 *Company：南京爱有趣科技有限公司
 *@author：杜博智
 * 2014-06-09
 *@version  1.0
**/
package com.dyyt.common;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dyyt.model.TLog;
/**
 *<pre>日志表公用接口类</pre>
 *<b>功能描述：</b>
 *		对日志表的维护
**/
public class LogCommon
{	
	//启动日志记录接口
	private static Logger log; 
	public  static void LogRun(Class T,TLog tLog,String type)
	{
		log = LoggerFactory.getLogger(T);
		if(tLog == null)
			return ;
		if(type.equals("info"))
		{
			log.info(tLog.getDescs(),tLog.getIp(),tLog.getLogin_id(),tLog.getMember_id(),tLog.getMould());
		}
		else if(type.equals("debug"))
		{
			log.debug(tLog.getDescs(),tLog.getIp(),tLog.getLogin_id(),tLog.getMember_id(),tLog.getMould());
		}
		else if(type.equals("warn"))
		{
			log.warn(tLog.getDescs(),tLog.getIp(),tLog.getLogin_id(),tLog.getMember_id(),tLog.getMould());
		}
		else if(type.equals("error"))
		{
			log.error(tLog.getDescs(),tLog.getIp(),tLog.getLogin_id(),tLog.getMember_id(),tLog.getMould());
		}
		else
			log.info(tLog.getDescs(),tLog.getIp(),tLog.getLogin_id(),tLog.getMember_id(),tLog.getMould());
	}
			
		/*
		LogCommonD myThread = new LogCommonD(); 
		myThread.setTLog(tLog); 
		Thread thread = new Thread(myThread); 
		thread.start();
		*/
}