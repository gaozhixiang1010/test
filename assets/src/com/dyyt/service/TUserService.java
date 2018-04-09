package com.dyyt.service;

import java.util.List;

import com.dyyt.model.TNotice;
import com.dyyt.model.TUser;
/**
 * 用户登录
 * @author wyy
 *
 */

public interface TUserService {
	/** 用户登录 */
	 public TUser login(TUser userBean);
	 public List<TUser> queryUser(TUser userBean);
	 public boolean deleteUser(String user_id);
	 public boolean updatePwd(TUser userBean);
	 public TUser selectAdmin(TUser userBean);
	 public boolean addUser(TUser userBean);
	 public boolean updateUser(TUser userBean);
	 public boolean existNameAdd(TUser userBean);
}
