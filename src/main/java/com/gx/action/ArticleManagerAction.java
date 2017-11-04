package com.gx.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gx.po.BasicAttributes;
import com.gx.po.WebArticle;
import com.gx.service.ArticleManagerService;
import com.gx.service.CrudService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ArticleManagerAction extends ActionSupport implements ModelDriven<WebArticle> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 注解方式注入service对象
	@Autowired
	private ArticleManagerService articleManagerService;
	
	@Autowired
	private CrudService crudService;

	// 以模型驱动的方式获取界面数据
	WebArticle webArticle = new WebArticle();

	public WebArticle getModel() {
		// TODO Auto-generated method stub

		return webArticle;
	}

	// 上传的文件（变量的名称是表单里面文件上传项的name值）
	private File Images;
	// 上传文件名称，表单里面文件上传项的name值+FileName
	private String ImagesFileName;

	public File getImages() {
		return Images;
	}

	public void setImages(File images) {
		Images = images;
	}

	public String getImagesFileName() {
		return ImagesFileName;
	}

	public void setImagesFileName(String imagesFileName) {
		ImagesFileName = imagesFileName;
	}

	/**
	 * @throws IOException
	 *             上传文件操作：1.需要上传的文件 2.需要上传的文件名称 （1）在action里面的成员变量（命名规范）
	 *             （2）生成get和set方法 @Title: addWebArticle @Description:
	 *             TODO(新增文章) @param @return 设定文件 @return String 返回类型 @throws
	 */

	public String addWebArticle() throws IOException {

		// 判断是否需要上传文件
		if (Images != null) {
			
			//上传到服务器项目下
	/*		String realpath = ServletActionContext.getServletContext().getRealPath("/imgdata/");              
	            File savefile = new File(new File(realpath), ImagesFileName);  
	            if (!savefile.getParentFile().exists())  
	                savefile.getParentFile().mkdirs();  
	            FileUtils.copyFile(Images, savefile);  
	            ActionContext.getContext().put("msg", "文件上传成功");  */
	      
			
			//上传到本地磁盘
			// 在路径下创建上传的文件
			File serverFile = new File("F:\\devlop\\TomcatService\\apache-tomcat-7.0.53\\webapps\\projectImg_resources"+"/"+ImagesFileName);
			// 把上传的文件保存在路径中
			FileUtils.copyFile(Images, serverFile);
			
			if (webArticle != null) {
				webArticle.setWImages(new Date().getTime() + "_" + ImagesFileName);
				articleManagerService.insertArticle(webArticle);
				ServletActionContext.getRequest().setAttribute("msg", "新增成功。。。");
			}
		}

		return "success";
	}
	
	/**
	 * 
	* @Title: loadGraphicList 
	* @Description: TODO(加载图文列表和绑定下拉框) 
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String loadGraphicList(){
		
		List<BasicAttributes> BasicAttributesList=crudService.loadingInfo();
		List<WebArticle> articleList=articleManagerService.selectAllArticle();
	
		ActionContext.getContext().put("articleTypeList", BasicAttributesList);
		ActionContext.getContext().put("articleList", articleList);
		
		return "loadGraphicList";
	}
	
	

}
