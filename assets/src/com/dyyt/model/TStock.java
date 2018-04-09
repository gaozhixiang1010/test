package com.dyyt.model;

import com.dyyt.common.PageParameter;

public class TStock extends PageParameter {
	private String assets_type_id;//资产名称ID
	private String assets_type_name;//资产名称
	private String parent_id;//资产类型
	private String parent_name;//资产名称
	private String total_num;//总数量
	private String over_num;//剩余数量
	private String assets_owner;//资产归属:1.市场推广部;2.财务部;3.人力行政部;4.营销部;5.办公室;6.运营中心;7.商务中心;8.客服部;9.工程部;10.孵化器;11.公开面积;12.咖啡厅
	private String assets_owner_name;
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
	public String getTotal_num() {
		return total_num;
	}
	public void setTotal_num(String totalNum) {
		total_num = totalNum;
	}
	public String getOver_num() {
		return over_num;
	}
	public void setOver_num(String overNum) {
		over_num = overNum;
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
	
}
