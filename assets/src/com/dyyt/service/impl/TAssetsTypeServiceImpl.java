package com.dyyt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dyyt.dao.TAssetsTypeDAO;
import com.dyyt.model.TAssetsParentType;
import com.dyyt.model.TAssetsType;
import com.dyyt.service.TAssetsTypeService;
@Service("tAssetsTypeServiceImpl")
public class TAssetsTypeServiceImpl implements TAssetsTypeService {
	@Resource
	private TAssetsTypeDAO assetsTypeDAO;
	
	public boolean addAsstesType(TAssetsType assetsTypeBean) {
		// TODO Auto-generated method stub
		return assetsTypeDAO.addAsstesType(assetsTypeBean) > 0;
	}

	public List<TAssetsType> queryAssetsType(TAssetsType assetsTypeBean) {
		// TODO Auto-generated method stub
		return assetsTypeDAO.queryAssetsTypePage(assetsTypeBean);
	}
	
	public List<TAssetsType> queryAssetsType() {
		// TODO Auto-generated method stub
		return assetsTypeDAO.queryAssetsType();
	}

	public boolean existTypeNameAdd(TAssetsType assetsTypeBean) {
		// TODO Auto-generated method stub
		return assetsTypeDAO.existTypeNameAdd(assetsTypeBean) > 0;
	}

	public boolean existTypeNameUpdate(TAssetsType assetsTypeBean) {
		// TODO Auto-generated method stub
		return assetsTypeDAO.existTypeNameUpdate(assetsTypeBean) > 0;
	}

	public TAssetsType getAssetsTypeBean(String typeId) {
		// TODO Auto-generated method stub
		return assetsTypeDAO.getAssetsTypeBean(typeId);
	}

	public boolean updateAsstesType(TAssetsType assetsTypeBean) {
		// TODO Auto-generated method stub
		return assetsTypeDAO.updateAsstesType(assetsTypeBean) > 0;
	}

	public boolean deleteAssetsType(String typeId) {
		// TODO Auto-generated method stub
		return assetsTypeDAO.deleteAssetsType(typeId) > 0;
	}

	public List<TAssetsType> getAssetsType() {
		// TODO Auto-generated method stub
		return assetsTypeDAO.getAssetsType();
	}

	public List<TAssetsParentType> getAssetsParentType() {
		// TODO Auto-generated method stub
		return assetsTypeDAO.getAssetsParentType();
	}

}
