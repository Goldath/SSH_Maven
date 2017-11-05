package com.gx.dao;

import java.util.List;

/**
 * 
* @ClassName: BaseDao 
* @Description: TODO(泛型类) 
* @author HuangJinShou
* @date 2017年11月6日 下午3:02:14 
* @version V1.0   
* @param <T>
 */
public interface BaseDao<T> {
	//添加
	void add(T t);
	//修改
	void update(T t);
	//删除
	void delete(T t);
	//根据id查询
	T findObjectByID(int id);
	//查询所有
	List<T> findAll();

}
