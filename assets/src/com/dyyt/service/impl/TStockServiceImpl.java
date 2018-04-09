package com.dyyt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dyyt.dao.TStockDAO;
import com.dyyt.model.TStock;
import com.dyyt.service.TStockService;
@Service("tStockServiceImpl")
public class TStockServiceImpl implements TStockService {
	@Resource
	private TStockDAO stockDAO;
	
	public List<TStock> queryStock(TStock stockBean) {
		// TODO Auto-generated method stub
		return stockDAO.queryStockPage(stockBean);
	}

}
