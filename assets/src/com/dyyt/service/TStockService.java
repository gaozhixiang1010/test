/**
 * Copyright：Copyright (c)  2016
 * Company：龙盟科技
 * @author 高志祥
 * 2016-02-22
 * @version  1.0
 */
package com.dyyt.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dyyt.model.TStock;
@Service
public interface TStockService {
	public List<TStock> queryStock(TStock stockBean);//根据条件查询固定资产库存
}
