package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.CrudDao;
import com.gx.po.BasicAttributes;
import com.gx.po.Page;
import com.gx.po.User;
import com.gx.service.CrudService;
@Transactional
public class CrudServiceImpl implements CrudService {

	@Autowired
	private CrudDao crudDao;

	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return crudDao.findAllUser();
	}

	public List<User> loadingUsers() {
		// TODO Auto-generated method stub
		return crudDao.loadingUsers();
	}

	public void inserUser(User user) {
		// TODO Auto-generated method stub
		crudDao.inserUser(user);
	}

	public User findUserById(int id) {
		// TODO Auto-generated method stub
		return crudDao.findUserById(id);
	}

	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		crudDao.deleteUser(user);
		
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		crudDao.updateUser(user);
		
	}

	//封装分页数据到page对象里面
	public Page selectUserByPaging(Integer currentPage) {
		//创建Page对象
		Page page=new Page();
		//当前页
		page.setCurrentPage(currentPage);
		//总记录数
		int totalCount=crudDao.findCount();
		page.setTotalCount(totalCount);
		//每页显示记录数
		int pageSize=10;
		int totalPage=0;
		//总记录数除以每页显示记录数（得到要分多少页）
		if(totalCount%pageSize==0){
			//能够整除
			totalPage=totalCount%pageSize;
		}else{
			totalPage=totalCount%pageSize+1;
		}
		page.setTotalPage(totalPage);
		//开始位置
		int begin=(currentPage-1)*pageSize;
		//每页记录的list集合
		List<User> list=crudDao.findPage(begin,pageSize);
		page.setList(list);
		
		return page;
	}

	public int findCount() {
		// TODO Auto-generated method stub
		return crudDao.findCount();
	}

	public List<User> findPage(int begin, int pageSize) {
		// TODO Auto-generated method stub
		return crudDao.findPage(begin, pageSize);
	}

	public List<User> findUserByName(String userName) {
		// TODO Auto-generated method stub
		return crudDao.findUserByName(userName);
	}

	public List<BasicAttributes> loadingInfo() {
		// TODO Auto-generated method stub
		return crudDao.loadingInfo();
	}

	public List loadingAnalysis() {
		// TODO Auto-generated method stub
		return crudDao.loadingAnalysis();
	}
}
