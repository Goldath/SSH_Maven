package com.gx.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;

import com.gx.dao.UserDao;
import com.gx.po.Page;
import com.gx.po.User;
import com.gx.service.UserService;

//事务注解
@Transactional
public class UserServiceImpl implements UserService{
	
//	注解方式注入UserDao对象
	@Autowired
	private UserDao userDao;

	 public User findUserById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(id);
	}



	public User selectUserByName(String userName) {
		return userDao.selectUserByName(userName);
	}


	public User userLogin(User user) {
		// TODO Auto-generated method stub
		return userDao.userLogin(user);
	}













}
