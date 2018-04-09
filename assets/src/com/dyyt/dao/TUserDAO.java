package com.dyyt.dao;

import java.util.List;

import com.dyyt.model.TUser;

public interface TUserDAO {
	/** 用户登录 */
	public TUser login(TUser userBean);
	public List<TUser> queryUserPage(TUser userBean);
	public int deleteUser(String user_id);
	public int updatePwd(TUser userBean);
	public TUser selectAdmin(TUser userBean);
	public int addUser(TUser userBean);
	public int updateUser(TUser userBean);
	public int existNameAdd(TUser userBean);
}
