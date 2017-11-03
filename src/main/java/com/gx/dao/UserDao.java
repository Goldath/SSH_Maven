package com.gx.dao;

import java.util.List;

import com.gx.po.User;
/**
 * 
* @ClassName: UserDao 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author HuangJinShou
* @date 2017年11月1日 上午9:49:51 
* @version V1.0
 */

public interface UserDao {

	//根据用户id查找用户
	 User findUserById(Integer id);	 
	 //根据用户名查询用户
	 User selectUserByName(String userName);	 
	 //用户登录
	 User userLogin(User user);

	 
	
}
