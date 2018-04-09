/**
 *Copyright：Copyright (c)  2014
 *Company：南京爱有趣科技有限公司
 *@author：杜博智、高志祥
 * 2014-06-26
 *@version  1.0
**/
package com.dyyt.common;

import java.util.ArrayList;
import java.util.List;

/**
 * 常量类
 */
public class Constant {
	//Spring 配置文件
	public final static String SPRING_XML = "classpath:springContext.xml";
	//本机WebService端口
	public final static String DK="8080";
	//fx_name 程序进程名称
	public final static String FX_R = "ReturnPlanInfo";	//返佣方案
	public final static String FX_U = "UnifyViewInfo";	//统一运营视图
	public final static String FX_L = "UserLossInfo";	//客户流失预警
	public final static String FX_T = "TradewebDetailInfo"; //监控日志
	public final static String FX_M = "MemmarginNoticeInfo";//保证金告警
	public final static String FX_RR = "ReturnPlan";//返佣方案
	/* *action_type 动作类型
	 * 1.机构 
	 * 2.居间
	 * 3.渠道组长
	 * 4.终端组长
	 * 5.渠道
	 * 6.终端
	 * 7.统一视图
	 * 8.客户流失预警
	 * 9.监控日志明细
	 * 10.返佣方案表
	 * 11.保障金告警
	 * */
	public final static int ACTION_JIGOU = 1;
	public final static int ACTION_JUJIAN = 2;
	public final static int ACTION_QDZZ = 3;
	public final static int ACTION_ZDZZ = 4;
	public final static int ACTION_QUDAO = 5;
	public final static int ACTION_ZHONGDUAN = 6;
	public final static int ACTION_TONGYI = 7;
	public final static int ACTION_KHLSYJ = 8;
	public final static int ACTION_BZJGJ = 11;
	/* *action_status 动作状态
	 * 1 待发生
	 * 2 正在发生
	 * 3 成功结束
	 * 4 过程中失败
	 * */
	public final static int ACTION_STATUS_D = 1;
	public final static int ACTION_STATUS_Z = 2;
	public final static int ACTION_STATUS_S = 3;
	public final static int ACTION_STATUS_F = 4;
	/* *员工类型
	 * 1 渠道员工(机构)
	 * 2 终端员工
	 * 3 渠道员工(居间)
	 * */
	public final static int EMPLOYEES_TYPE_JIGOU = 1;
	public final static int EMPLOYEES_TYPE_ZHONGDUAN = 2;
	public final static int EMPLOYEES_TYPE_JUJIAN = 3;
	/* *参数值
	 * 1	代客理财参数
	 * 2	套利报警参数
	 * 3	会员保证金告警比例
	 * 4	客户权益
	 * 5	对冲监控刷新频率
	 * 6	流失率预警参数值
	 * 11	信息来源
	 * 12	咨询类别
	 * 13	问题归类
	 * 14	处理结果
	 * 15	意向程度
	 * 16	跟进状态
	 * 17	资料类别
	 * 18	调研类型
	 * */
	public final static int PARAMETER_HYBZJ = 3;
	public final static int PARAMETER_KHQY  = 4;
	/* 消息通知类型
	 * 1 通知公告
	 * 2 媒体推广
	 * 3 会员服务部重要通知
	 * 4 培训信息
	 * 5 沟通记录明细
	 * 6 分支机构审批
	 * 7 资料信息审核
	 * 8 保证金告警通知 
	 * */
	public final static int MESSAGE_BZJGJ = 8;
	public final static int MESSAGE_TZGG  = 1;
	public final static int MESSAGE_MTTG  = 2;
	public final static int MESSAGE_FWTZ  = 3;
	public final static int MESSAGE_PXXX  = 4;
	public final static int MESSAGE_GTJL  = 5;
	public final static int MESSAGE_FZSP  = 6;
	public final static int MESSAGE_ZLSH  = 7;
	/* 消息通知指定网址(对应消息通知类型)*/
	public final static String HTML_BZJGJ = "";
	public final static String HTML_TZGG  = "";
	public final static String HTML_MTTG  = "";
	public final static String HTML_FWTZ  = "";
	public final static String HTML_PXXX  = "";
	public final static String HTML_GTJL  = "";
	public final static String HTML_FZSP  = "";
	public final static String HTML_ZLSH  = "";
	/* 监控日志消息类型
	 * 1 os
	 * 2 ox
	 * */
	public final static int TRADEWEB_OS =1;
	public final static int TRADEWEB_OX =2;
	/* 监控日志处理状态
	 * 1 未处理
	 * 2 处理成功
	 * 3 正在处理
	 * 4 处理失败
	 * */
	public final static int HANDLE_CLCG = 2;
	/* 服务器类型
	 * 1 交易所
	 * 2 会员
	 * */
	public final static int SERVER_JYS = 1;
	public final static int SERVER_HY  = 2;
	//add by 高志祥
	/* 日志操作模块 MOULD 
	 * 1 系统管理
	 * 2 基本设置
	 * 3 返佣方案
	 * 4  决策分析
	 * 5 财务管理
	 * 6 运营管理
	 * 7 风控管理
	 * 8 合规管理
	 * 9 会员服务
	 * */
	public final static int MOULD_1 = 1;
	public final static int MOULD_2 = 2;
	public final static int MOULD_3 = 3;
	public final static int MOULD_4 = 4;
	public final static int MOULD_5 = 5;
	public final static int MOULD_6 = 6;
	public final static int MOULD_7 = 7;
	public final static int MOULD_8 = 8;
	public final static int MOULD_9 = 9;
	/*
	 * EXCEL存放路径
	 */
	public final static String DIR = "f:/file/";
	public static String ServerIp = "";
	//end by 高志祥
	public static List Tmenu =new ArrayList();
	public static List Showmenu =new ArrayList();
	public final static int show = 21;
	public static String server_flag="";
}
