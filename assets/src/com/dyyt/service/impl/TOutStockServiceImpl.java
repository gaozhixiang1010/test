package com.dyyt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dyyt.dao.TOutStockDAO;
import com.dyyt.model.TOutStock;
import com.dyyt.model.TStock;
import com.dyyt.service.TOutStockService;
@Service("tOutStockServiceImpl")
public class TOutStockServiceImpl implements TOutStockService {
	@Resource
	private TOutStockDAO outStockDAO;

	public List<TOutStock> queryOutStock(TOutStock outStockBean) {
		// TODO Auto-generated method stub
		return outStockDAO.queryOutStockPage(outStockBean);
	}

	public boolean addOutStock(TOutStock outStockBean) {
		// TODO Auto-generated method stub
		return outStockDAO.addOutStock(outStockBean) > 0;
	}

	public int overStock(TOutStock outStockBean) {
		// TODO Auto-generated method stub
		TStock stock = outStockDAO.getStockInformation(outStockBean);
		if(stock == null) {
			return 0;
		} else {
			return Integer.parseInt(stock.getOver_num());
		}
	}

	public TOutStock getOutStockBean(String outstockId) {
		// TODO Auto-generated method stub
		return outStockDAO.getOutStockBean(outstockId);
	}

	public boolean updateOutStock(TOutStock outStockBean) {
		// TODO Auto-generated method stub
		return outStockDAO.updateOutStock(outStockBean) > 0;
	}

	public boolean deleteOutStock(String outstockId) {
		// TODO Auto-generated method stub
		return outStockDAO.deleteOutStock(outstockId) > 0;
	}

	
}
