package com.gx.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gx.po.User;
import com.gx.service.UserService;
import com.gx.utils.MD5Util;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 1L;

	// 以模型驱动方式获取界面数据
	private User user = new User();;

	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	// 注解的方式注入service对象操作dao层
	@Autowired
	private UserService userService;

	// 默认执行的方法
	@Override
	public String execute() throws Exception {
		System.out.println("action.........");
		return NONE;
	}

	/**
	 * 
	 * @Title: selectUserByID @Description: TODO(根据ID查询用户) @param @param userID
	 *         设定文件 @return void 返回类型 @throws
	 */
	public void selectUserByID(int userID) {
		System.out.println("selectUserByID......");
		User realUser = userService.findUserById(userID);
		System.out.println(realUser.getUserName() + realUser.getPassword());
	}

	// 将声明的对象封装生成get和set方法
	private Map<String, Object> jsonResult;

	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}

	/**
	 * 
	 * @throws IOException
	 * @Title: login @Description: TODO(用户登录) @param @return 设定文件 @return String
	 *         返回类型 @throws
	 */
	public String login() throws IOException {
		String pathUrl = "404";
		String password1 = MD5Util.GetMD5Code(user.getPassword()).trim();
		user.setPassword(password1);
		if (user!=null&&!user.getUserName().equals("") && !password1.equals("")) {
			// 根据用户名查询用户
			User currentUser = userService.userLogin(user);
			if (currentUser != null) {
				String dbPassword = currentUser.getPassword();
				// 使用session保持登录状态
				HttpServletRequest request = ServletActionContext.getRequest();
				request.getSession().setAttribute("currentUser", currentUser);
				if (dbPassword.equals(password1)) {
					// 用户名、密码正确可以跳转页面
					System.out.println("登录成功。。。。");
					pathUrl = "LoginSucceed";
				}

			} else {
				System.out.println("登录失败。。。。");
				pathUrl = "Failure";
			}

		}

		return pathUrl;

	}

}
