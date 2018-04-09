package com.dyyt.service;

import java.util.List;

import com.dyyt.model.TForum;
/**
 * 用户登录
 * @author wyy
 *
 */

public interface TForumService {
	 public List<TForum> queryForum(TForum forumBean);
	 public boolean deleteForum(String forum_id);
	 public List<TForum> queryForum();
	 public boolean addForum(TForum forumBean);
}
