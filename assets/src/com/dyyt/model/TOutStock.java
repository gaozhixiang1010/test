package com.dyyt.model;

import com.dyyt.common.PageParameter;

public class TOutStock extends PageParameter {
	private String outstock_id;
	private String assets_type_id;//资产名称ID
	private String assets_type_name;//资产名称
	private String assets_num;//数量
	private String out_time;//出库时间
	private String assets_owner;//资产归属:1.市场推广部;2.财务部;3.人力行政部;4.营销部;5.办公室;6.运营中心;7.商务中心;8.客服部;9.工程部;10.孵化器;11.公开面积;12.咖啡厅
	private String assets_owner_name;
	private String outstock_desc;//出库信息描述
	private String create_time;//信息填写时间
	private String parent_id;//资产类型
	private String parent_name;//资产名称
	private String begin_time;//查询起始时间
	private String end_time;//查询结束时间
	private String department;//使用部门
	private String charge;//负责人
	private String user_id;//系统操作员
	public String getOutstock_id() {
		return outstock_id;
	}
	public void setOutstock_id(String outstockId) {
		outstock_id = outstockId;
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
	public String getAssets_num() {
		return assets_num;
	}
	public void setAssets_num(String assetsNum) {
		assets_num = assetsNum;
	}
	public String getOut_time() {
		return out_time;
	}
	public void setOut_time(String outTime) {
		out_time = outTime;
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
	public String getOutstock_desc() {
		return outstock_desc;
	}
	public void setOutstock_desc(String outstockDesc) {
		outstock_desc = outstockDesc;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String createTime) {
		create_time = createTime;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String userId) {
		user_id = userId;
	}
	
}
