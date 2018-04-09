/**
 * @author 高志祥
 * 资产类型<t_assets_type>数据操作接口
 */
package com.dyyt.dao;

import java.util.List;

import com.dyyt.model.TStock;

public interface TStockDAO {
	public List<TStock> queryStockPage(TStock stockBean);//根据条件查询固定资产库存
}
