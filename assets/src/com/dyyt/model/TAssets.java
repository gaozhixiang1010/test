/**
 * 固定资产BEAN类
 */
package com.dyyt.model;

import com.dyyt.common.PageParameter;

public class TAssets extends PageParameter {
	private String assets_id;
	private String assets_type_id;//资产名称id
	private String assets_type_name;//资产名称
	private String assets_desc;//资产描述
	private String assets_price;//单价
	private String assets_num;//数量
	private String buy_time;//购买时间
	private String total_price;//总价
	private String create_time;//信息填写时间
	private String begin_time;//查询起始时间
	private String end_time;//查询结束时间
	private String assets_owner;//资产归属:1.市场推广部;2.财务部;3.人力行政部;4.营销部;5.办公室;6.运营中心;7.商务中心;8.客服部;9.工程部;10.孵化器;11.公开面积;12.咖啡厅
	private String assets_owner_name;
	private String parent_id;//资产类型
	private String parent_name;//资产名称
	private String user_id;//系统操作员
	private String assets_name;//产品名称
	private String pinpai;//品牌（大麦网）
	public String getAssets_id() {
		return assets_id;
	}
	public void setAssets_id(String assetsId) {
		assets_id = assetsId;
	}
	public String getAssets_type_id() {
		return assets_type_id;
	}
	public void setAssets_type_id(String assetsTypeId) {
		assets_type_id = assetsTypeId;
	}
	public String getAssets_type_name() {
		return assets_type_name;
	}
	public void setAssets_type_name(String assetsTypeName) {
		assets_type_name = assetsTypeName;
	}
	public String getAssets_price() {
		return assets_price;
	}
	public void setAssets_price(String assetsPrice) {
		assets_price = assetsPrice;
	}
	public String getAssets_num() {
		return assets_num;
	}
	public void setAssets_num(String assetsNum) {
		assets_num = assetsNum;
	}
	public String getBuy_time() {
		return buy_time;
	}
	public void setBuy_time(String buyTime) {
		buy_time = buyTime;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String totalPrice) {
		total_price = totalPrice;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String createTime) {
		create_time = createTime;
	}
	public String getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(String beginTime) {
		begin_time = beginTime;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String endTime) {
		end_time = endTime;
	}
	public String getAssets_owner() {
		return assets_owner;
	}
	public void setAssets_owner(String assetsOwner) {
		assets_owner = assetsOwner;
	}
	public String getAssets_owner_name() {
		return assets_owner_name;
	}
	public void setAssets_owner_name(String assetsOwnerName) {
		assets_owner_name = assetsOwnerName;
	}
	public String getAssets_desc() {
		return assets_desc;
	}
	public void setAssets_desc(String assetsDesc) {
		assets_desc = assetsDesc;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parentId) {
		parent_id = parentId;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parentName) {
		parent_name = parentName;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String userId) {
		user_id = userId;
	}
	public String getAssets_name() {
		return assets_name;
	}
	public void setAssets_name(String assets_name) {
		this.assets_name = assets_name;
	}
	public String getPinpai() {
		return pinpai;
	}
	public void setPinpai(String pinpai) {
		this.pinpai = pinpai;
	}
}
