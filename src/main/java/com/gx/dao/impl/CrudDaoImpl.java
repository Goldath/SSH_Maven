package com.gx.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.gx.dao.CrudDao;
import com.gx.po.BasicAttributes;
import com.gx.po.Page;
import com.gx.po.User;

public class CrudDaoImpl implements CrudDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public List<User> findAllUser() {
		List<User> userList = (List<User>) hibernateTemplate.find("from User order by id desc");
		return userList;
	}

	/**
	 * 加载用户列表
	 */
	public List<User> loadingUsers() {

		List<User> userList = (List<User>) hibernateTemplate.find("from User");
		hibernateTemplate.setMaxResults(15);
		return userList;
	}

	public void inserUser(User user) {
		hibernateTemplate.save(user);

	}

	public User findUserById(int id) {
		return hibernateTemplate.get(User.class, id);
	}

	public void deleteUser(User user) {
		hibernateTemplate.delete(user);

	}

	public void updateUser(User user) {
		hibernateTemplate.update(user);

	}

	public int findCount() {
		// TODO Auto-generated method stub
		List<User> list = (List<User>) hibernateTemplate.find("select count(*) from User");
		// 从list中把值得到
		if (list != null && list.size() != 0) {
			Object obj = list.get(0);
			Long lobj = (Long) obj;
			int count = lobj.intValue();
			return count;
		}
		return 0;
	}

	/**
	 * 分页查询
	 */
	public List<User> findPage(int begin, int pageSize) {
		/*
		 * //使用底层Hibernate代码实现（了解） //1.得到sessionFactory SessionFactory
		 * sessionFactory=hibernateTemplate.getSessionFactory(); //2.得到session对象
		 * Session session=sessionFactory.getCurrentSession(); Query
		 * query=session.createQuery("from User"); query.setFirstResult(begin);
		 * query.setMaxResults(pageSize); List<User> list=query.list();
		 */

		// 第二种使用离线对象和hibernateTemplate的方法实现
		// 1.创建离线对象，设置对哪个实体进行操作
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		// 2.调用hibernateTemplate的方法实现
		List<User> list = (List<User>) hibernateTemplate.findByCriteria(criteria, begin, pageSize);

		return list;
	}

	public List<User> findUserByName(String userName) {
		// 模糊查询
		String hqlMoHuSelectUser = "from User where userName like ?";
		List<User> userList = (List<User>) hibernateTemplate.find(hqlMoHuSelectUser, "%" + userName + "%");
		return userList;
	}

	public List<BasicAttributes> loadingInfo() {

		List<BasicAttributes> BasicAttributesList = (List<BasicAttributes>) hibernateTemplate
				.find("from BasicAttributes");

		return BasicAttributesList;
	}

	/**
	 * 加载用户图表
	 */
	public List loadingAnalysis() {
		// 获取session对象
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		// 创建SqlQuery对象
		String sql = "SELECT	w.value,basic_attributes.attributeVlue as name FROM "
				+ "(SELECT Count(*) AS value,web_article.basicAttributesID FROM web_article GROUP BY web_article.basicAttributesID) AS w,	basic_attributes "
				+ "WHERE w.basicAttributesID = basic_attributes.basicAttributesID";
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		// 转换map结构
		sqlQuery.setResultTransformer(Transformers.aliasToBean(HashMap.class));
		List list = sqlQuery.list();
		return list;
	}

}
