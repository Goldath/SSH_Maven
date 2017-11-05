package com.gx.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import com.gx.dao.BaseDao;

public class BaseDaoImpl<T> implements BaseDao<T> {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	private Class pClass;

	public BaseDaoImpl() {
		// 得到当前运行类
		Class clazz = this.getClass();
		// 得到运行类的父类的参数化类型BaseDao<T>
		Type type = clazz.getGenericSuperclass();
		ParameterizedType ptype = (ParameterizedType) type;

		// 得到实际类型参数BaseDao<T> 的T 类型
		Type[] types = ptype.getActualTypeArguments();
		pClass = (Class) types[0];
	}

	public void add(T t) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(t);
	}

	public void update(T t) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(t);

	}

	public void delete(T t) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(t);
	}

	public T findObjectByID(int id) {
		// TODO Auto-generated method stub
		return (T) hibernateTemplate.get(pClass, id);

	}

	public List<T> findAll() {
		// TODO Auto-generated method stub
		return (List<T>) hibernateTemplate.find("from " + pClass.getSimpleName());
	}

}
