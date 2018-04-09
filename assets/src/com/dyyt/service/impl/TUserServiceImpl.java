package com.dyyt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dyyt.dao.TUserDAO;
import com.dyyt.model.TNotice;
import com.dyyt.model.TUser;
import com.dyyt.service.TUserService;
@Service("tUserServiceImpl")
public class TUserServiceImpl implements TUserService {
 
	@Resource
	private TUserDAO tUserDAO;
	
	public TUser login(TUser userBean) {
		// TODO Auto-generated method stub
		return tUserDAO.login(userBean);
	}
	
	public List<TUser> queryUser(TUser UserBean) {
		// TODO Auto-generated method stub
		return tUserDAO.queryUserPage(UserBean);
	}
	
	public boolean deleteUser(String user_Id) {
		// TODO Auto-generated method stub
		return tUserDAO.deleteUser(user_Id) > 0;
	}
	
	public boolean updatePwd(TUser UserBean) {
		// TODO Auto-generated method stub
		return tUserDAO.updatePwd(UserBean) > 0;
	}
	
	public TUser selectAdmin(TUser userBean) {
		// TODO Auto-generated method stub
		return tUserDAO.selectAdmin(userBean);
	}

	public boolean addUser(TUser userBean) {
		// TODO Auto-generated method stub
		return tUserDAO.addUser(userBean) > 0;
	}
	
	public boolean updateUser(TUser userBean) {
		// TODO Auto-generated method stub
		return tUserDAO.updateUser(userBean) > 0;
	}
	
	public boolean existNameAdd(TUser userBean) {
		// TODO Auto-generated method stub
		return tUserDAO.existNameAdd(userBean) > 0;
	}

}
