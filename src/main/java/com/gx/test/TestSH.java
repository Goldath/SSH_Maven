package com.gx.test;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gx.dao.UserDao;

public class TestSH {
	
	@Test
	public void testUser() {
	    ApplicationContext content = new ClassPathXmlApplicationContext("bean.xml");
	    UserDao uDao = (UserDao) content.getBean("userImp");
	    System.out.println(uDao.findUserById(1));
	}

}
