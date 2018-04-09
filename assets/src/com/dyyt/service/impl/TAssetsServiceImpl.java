package com.dyyt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dyyt.dao.TAssetsDAO;
import com.dyyt.model.TAssets;
import com.dyyt.service.TAssetsService;
@Service("tAssetsServiceImpl")
public class TAssetsServiceImpl implements TAssetsService {
	@Resource
	private TAssetsDAO assetsDAO;
	
	public List<TAssets> queryAssets(TAssets assetsBean) {
		// TODO Auto-generated method stub
		return assetsDAO.queryAssetsPage(assetsBean);
	}

	public boolean addAsstes(TAssets assetsBean) {
		// TODO Auto-generated method stub
		return assetsDAO.addAsstes(assetsBean) > 0;
	}

	public TAssets getAssetsBean(String assetsId) {
		// TODO Auto-generated method stub
		return assetsDAO.getAssetsBean(assetsId);
	}

	public boolean updateAsstes(TAssets assetsBean) {
		// TODO Auto-generated method stub
		return assetsDAO.updateAsstes(assetsBean) > 0;
	}

	public boolean deleteAssets(String assetsId) {
		// TODO Auto-generated method stub
		return assetsDAO.deleteAssets(assetsId) > 0;
	}
	
	public List<TAssets> getAssets(TAssets assetsBean) {
		// TODO Auto-generated method stub
		return assetsDAO.queryAssets(assetsBean);
	}

}
