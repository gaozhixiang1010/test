package com.dyyt.model;

import com.dyyt.common.PageParameter;

public class TOrder extends PageParameter {
	private String order_id;
	private String assets_id;
	private String user_id;
	private String num;
	private String create_date;
	private String assets_name;
	private String user_name;
	private String tel;
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getAssets_id() {
		return assets_id;
	}
	public void setAssets_id(String assets_id) {
		this.assets_id = assets_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getAssets_name() {
		return assets_name;
	}
	public void setAssets_name(String assets_name) {
		this.assets_name = assets_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
