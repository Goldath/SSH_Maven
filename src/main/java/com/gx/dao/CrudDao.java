package com.gx.dao;

import java.util.List;

import com.gx.po.BasicAttributes;
import com.gx.po.Page;
import com.gx.po.User;

public interface CrudDao {

	 //查询所有用户
	 List<User> findAllUser();
	 
	 //加载用户列表
	 List<User> loadingUsers();
	 
	 //新增用户
	 void inserUser(User user);
	 
	 //根据id查询用户
	 User findUserById(int id);
	 //删除用户
	 void deleteUser(User user);
	 
	 //修改用户
	 void updateUser(User user);
	 
	 //根据用户名模糊查询用户
	 List<User> findUserByName(String userName);

	 //查询总记录数
	int findCount();

	//分页查询数据
	List<User> findPage(int begin, int pageSize);
	
	
	//加载多表操作的下拉框信息
	List<BasicAttributes> loadingInfo();
	
	//加载用户图表数据
	List loadingAnalysis();
	
}
