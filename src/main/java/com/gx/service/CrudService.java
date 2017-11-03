package com.gx.service;
import java.util.List;

import com.gx.dao.CrudDao;
import com.gx.po.BasicAttributes;
import com.gx.po.Page;
import com.gx.po.User;

public interface CrudService extends CrudDao{

	//分页查询方法
	 Page selectUserByPaging(Integer currentPage);



	

}
