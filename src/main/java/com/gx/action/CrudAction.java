package com.gx.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gx.po.BasicAttributes;
import com.gx.po.Page;
import com.gx.po.User;
import com.gx.service.CrudService;
import com.gx.utils.JsonUtils;
import com.gx.utils.MD5Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CrudAction extends ActionSupport {

	// 注解方式注入service对象
	@Autowired
	private CrudService crudService;

	/**
	 * 
	 * @throws IOException
	 * @Title: selectUserList @Description: TODO(查询用户列表) @param @return
	 *         设定文件 @return String 返回类型 @throws
	 */
	public String selectUserList() throws IOException {
		
		List<User> userList = crudService.findAllUser();
		String usersJson = new Gson().toJson(userList);
	/*	ServletActionContext.getRequest().setAttribute("userList", userList);*/
		// 使用reponse对象进行返回
		HttpServletResponse response = ServletActionContext.getResponse();
		// 解决响应乱码问题
		response.setContentType("application/json;charset=utf-8");
		// 如果使用response返回数据，action的方法不能有返回值
		response.getWriter().write(usersJson);

		return NONE;
	}

	private int id;
	private String userName;
	private String password;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 
	 * @throws IOException
	 * @Title: addUser @Description: TODO(新增用户) @param 设定文件 @return void
	 *         返回类型 @throws
	 */
	public void addUser() throws IOException {

		// 创建一个新用户对象
		User newUser = new User();
		newUser.setUserName(userName);
		newUser.setPassword(MD5Util.GetMD5Code(password));
		// 调用新增的方法
		crudService.inserUser(newUser);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.getWriter().print("true");

	}

	/**
	 * 
	 * @throws IOException 
	 * @Title: updateUser @Description: TODO(修改用户) @param 设定文件 @return void
	 *         返回类型 @throws
	 */
	public void updateUser() throws IOException {
		// 根据id查询到要修改的用户
		User updateUser = crudService.findUserById(id);
		updateUser.setUserName(userName);
		updateUser.setPassword(MD5Util.GetMD5Code(password));
		//调用修改的方法
		if(updateUser!=null){
			crudService.updateUser(updateUser);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.getWriter().print("true");
		}
	}

	/**
	 * 
	 * @throws IOException
	 * @Title: deleteUser @Description: TODO(删除用户) @param 设定文件 @return void
	 *         返回类型 @throws
	 */
	public void deleteUser() throws IOException {

		// 根据id查询到要删除的用户
		User deleteUser = crudService.findUserById(id);
		// 调用删除的方法
		if (deleteUser != null) {
			crudService.deleteUser(deleteUser);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.getWriter().print("true");
		}
	
	}
	//属性封装
	private Integer currentPage;
	
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @throws IOException 
	 * 
	* @Title: selectUserByPaging 
	* @Description: TODO(分页查询) 
	* @param     设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public void selectUserByPaging() throws IOException{
		
		Page page=crudService.selectUserByPaging(currentPage);
		/*//放到域对象里面
		ServletActionContext.getRequest().setAttribute("page", page);*/
		
		String userJson = new Gson().toJson(page);
		// 使用reponse对象进行返回
		HttpServletResponse response = ServletActionContext.getResponse();
		// 解决响应乱码问题
		response.setContentType("application/json;charset=utf-8");
		// 如果使用response返回数据，action的方法不能有返回值
		response.getWriter().write(userJson);
		
	}
	/**
	 * 
	* @Title: selectUserByName 
	* @Description: TODO(根据用户名模糊查询用户) 
	* @param @throws IOException    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public void selectUserByName() throws IOException{
		
		List<User> list=crudService.findUserByName(userName);
		String usersJson = new Gson().toJson(list);
		// 使用reponse对象进行返回
		HttpServletResponse response = ServletActionContext.getResponse();
		// 解决响应乱码问题
		response.setContentType("application/json;charset=utf-8");
		// 如果使用response返回数据，action的方法不能有返回值
		response.getWriter().write(usersJson);		
		
	}
	
	/**
	 * 
	* @Title: loadingloadingInsertArticle 
	* @Description: TODO(加载新增文章页面) 
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String loadingloadingInsertArticle(){
		
	List<BasicAttributes> BasicAttributesList=crudService.loadingInfo();
	HttpServletRequest request=ServletActionContext.getRequest();
	request.setAttribute("articleTypeList", BasicAttributesList);
	
		return "loadingPage";
	}
	
/**
 * 
* @Title: loadingTongJiFengXing 
* @Description: TODO(加载统计分析) 
* @param @return    设定文件 
* @return String    返回类型 
* @throws
 */
	public String loadingTongJiFengXi(){	

	
		return "TongJiFengXi";
	}
	/**
	 * @throws IOException 
	 * 
	* @Title: LoadingUserAnalysis 
	* @Description: TODO(异步加载图表数据) 
	* @param     设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public void loadingAnalysis() throws IOException{
		
		List list=crudService.loadingAnalysis();		
		String analysisJson = new Gson().toJson(list);
		// 使用reponse对象进行返回
		HttpServletResponse response = ServletActionContext.getResponse();
		// 解决响应乱码问题
		response.setContentType("application/json;charset=utf-8");
		// 如果使用response返回数据，action的方法不能有返回值
		response.getWriter().write(analysisJson);
		System.out.println(analysisJson);
	}
	
	
	

}
