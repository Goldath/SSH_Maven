package com.gx.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.gx.dao.UserDao;
import com.gx.po.User;

public class UserDaoImpl implements UserDao {

	// 这里使用无参构造方法得到HibernateTemlate对象
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	/**
	 * 根据id查询用户
	 */
	public User findUserById(Integer id) {
		// 方式一
		// User user=hibernateTemplate.get(User.class, id);
		// 方式二
		String hqlfindUserById = "from User where id=?";
		User user = (User) hibernateTemplate.find(hqlfindUserById, 1);
		return user;
	}

	/**
	 * 根据用户名查询用户
	 */
	public User selectUserByName(String userName) {
	
		//模糊查询
	/*	String hqlMoHuSelectUser="from User where userName like ?";
		List<User> userList= (List<User>) hibernateTemplate.find(hqlMoHuSelectUser, "%"+userName+"%");
		for (User user : userList) {
			System.out.println(user);
		}*/
		
		//   返回name属性值为test的对象
/*		String hql= "from bean.User u where u.name=? and u.password=?"   
				this.getHibernateTemplate().find(hql, new String[]{"test", "123"}); */
		
		String hqlSelectUserByName="from User where userName=?";
		
		List<User> userList= (List<User>) hibernateTemplate.find(hqlSelectUserByName,userName);
		
		if(userList.size()>0){
			return userList.get(0);
		}
		return null;
		
		
		
	}

	/**
	 * 用户登录
	 */
	public User userLogin(User user) {

		String hqlUserLogin="from User where userName=? and password=?";
		
		List<User> userList= (List<User>) hibernateTemplate.find(hqlUserLogin,user.getUserName(),user.getPassword());
		
		if(userList!=null&&userList.size()>0){
			//返回Usr对象
			return userList.get(0);
		}
		return null;
		
	}

	
	

}
