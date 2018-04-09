/**
 * @author 高志祥
 * 资产类型<t_assets_type>数据操作接口
 */
package com.dyyt.dao;

import java.util.List;

import com.dyyt.model.TAssetsParentType;
import com.dyyt.model.TAssetsType;

public interface TAssetsTypeDAO {
	public List<TAssetsType> queryAssetsTypePage(TAssetsType assetsTypeBean);//查询资产类型
	public int addAsstesType(TAssetsType assetsTypeBean);//新增资产类型
	public int existTypeNameAdd(TAssetsType assetsTypeBean);//新增资产类型排重
	public int existTypeNameUpdate(TAssetsType assetsTypeBean);//修改资产类型排重
	public TAssetsType getAssetsTypeBean(String type_id);//通过ID获取资产类型
	public int updateAsstesType(TAssetsType assetsTypeBean);//修改资产类型
	public int deleteAssetsType(String type_id);//根据ID删除资产类型
	public List<TAssetsType> getAssetsType();//获取资产类型
	public List<TAssetsParentType> getAssetsParentType();//获取资产大类
	public List<TAssetsType> queryAssetsType();
}
