/**
 *Copyright：Copyright (c)  2014
 *Company：南京爱有趣科技有限公司
 *@author：杜博智、高志祥
 * 2014-06-09
 *@version  1.0
**/
package com.dyyt.model;

import javax.servlet.http.HttpServletRequest;


/**
 *<pre>日志表参数类</pre>
**/
public class TLog {
	//序号
	private long seq;
	//登录用户ID
	private String login_id;
	//操作IP
	private String ip;
	//日志创建时间
	private String create_time;
	//操作模块
	private int mould;
	//动作类型
	private int state;
	//详细说明
	private String descs;
	//会员编号
	private String member_id;
	
	public TLog(HttpServletRequest request) {
		this.ip = request.getSession().getAttribute("client_ip")==null?"":request.getSession().getAttribute("client_ip").toString();
		this.login_id = request.getSession().getAttribute("login_id")==null?"":request.getSession().getAttribute("login_id").toString();
		this.member_id = request.getSession().getAttribute("member_id")==null?"":request.getSession().getAttribute("member_id").toString();
	}
	public TLog(String ip,String login_id,String member_id) {
		this.ip = ip;
		this.login_id = login_id;
		this.member_id = member_id;
	}
	
	public long getSeq() {
		return seq;
	}
	public void setSeq(long seq) {
		this.seq = seq;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public int getMould() {
		return mould;
	}
	public void setMould(int mould) {
		this.mould = mould;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
