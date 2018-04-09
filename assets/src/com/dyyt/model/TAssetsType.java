/**
 * 资产类型BEAN类
 */
package com.dyyt.model;

import com.dyyt.common.PageParameter;

public class TAssetsType extends PageParameter {
	private String type_id;
	private String type_name;//资产类型名称
	private String parent_id;//资产大类ID 1.固定资产 2.低值易耗品
	private String parent_name;//资产大类名称
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String typeId) {
		type_id = typeId;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String typeName) {
		type_name = typeName;
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
	
}
