package com.gx.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
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
			// --------------------------重新命名图片-----------------
			Date datenew = new Date();
			SimpleDateFormat simpleDateFormatnew = new SimpleDateFormat("yyyyMMddhhmmss");
			int last = ImagesFileName.lastIndexOf(".");
			String head = ImagesFileName.substring(0, last);
			String type = ImagesFileName.substring(last);
			ImagesFileName = simpleDateFormatnew.format(datenew) + type;
			System.out.println("新的文件名称是：" + ImagesFileName);
			// --------------------------重新命名图片-----------------
			// 上传到服务器项目下
			// 得到图片将要写入的路径
			String realpath = ServletActionContext.getServletContext().getRealPath("/imgdata");
			File savefile = new File(new File(realpath), ImagesFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(Images, savefile);

			/*
			 * //上传到本地磁盘 // 在路径下创建上传的文件 File serverFile = new File(
			 * "F:\\devlop\\TomcatService\\apache-tomcat-7.0.53\\webapps\\projectImg_resources"
			 * +"/"+ImagesFileName); // 把上传的文件保存在路径中 FileUtils.copyFile(Images,
			 * serverFile);
			 */

			if (webArticle != null) {
				// 设置发布时间
				webArticle.setWTime(new Date());
				// 保存上传的路径到数据库
				webArticle.setWImages(ImagesFileName);
				articleManagerService.insertArticle(webArticle);
				ServletActionContext.getRequest().setAttribute("msg", "新增成功。。。");
			}

		}

		return "insertSuccess";
	}

	/**
	 * 
	 * @Title: loadGraphicList @Description: TODO(加载图文列表和绑定下拉框) @param @return
	 *         设定文件 @return String 返回类型 @throws
	 */
	public String loadGraphicList() {
		List<BasicAttributes> BasicAttributesList = crudService.loadingInfo();
		List<WebArticle> articleList = articleManagerService.selectAllArticle();

		ActionContext.getContext().put("articleTypeList", BasicAttributesList);
		ActionContext.getContext().put("articleList", articleList);

		return "loadGraphicList";
	}

	/**
	 * 
	 * @Title: loaddingWebArticle @Description: TODO(加载修改页面) @param @return
	 * 设定文件 @return String 返回类型 @throws
	 */

	public String loaddingWebArticle() {
		// 得到点击的文章id
		int articleID = webArticle.getWId();
		// 根据id查文章
		WebArticle webArticle = articleManagerService.findArticleByID(articleID);
		ActionContext.getContext().put("webArticle", webArticle);
		List<BasicAttributes> BasicAttributesList = crudService.loadingInfo();
		ActionContext.getContext().put("articleTypeList", BasicAttributesList);

		return "loaddingWebArticle";
	}

	/**
	 * @Title: editWevArticle @Description:
	 * TODO(修改文章) @param @return @param @throws IOException 设定文件 @return String
	 * 返回类型 @throws
	 */
	public String editWevArticle() throws IOException {

		// 判断是否需要上传文件
		if (Images != null) {
			// --------------------------重新命名图片-----------------
			Date datenew = new Date();
			SimpleDateFormat simpleDateFormatnew = new SimpleDateFormat("yyyyMMddhhmmss");
			int last = ImagesFileName.lastIndexOf(".");
			String head = ImagesFileName.substring(0, last);
			String type = ImagesFileName.substring(last);
			ImagesFileName = simpleDateFormatnew.format(datenew) + type;
			System.out.println("新的文件名称是：" + ImagesFileName);
			// --------------------------重新命名图片-----------------
			// 上传到服务器项目下
			// 得到图片将要写入的路径
			String realpath = ServletActionContext.getServletContext().getRealPath("/imgdata");
			File savefile = new File(new File(realpath), ImagesFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(Images, savefile);
			// 保存上传的路径到数据库
			webArticle.setWImages(ImagesFileName);
			/*
			 * //上传到本地磁盘 // 在路径下创建上传的文件 File serverFile = new File(
			 * "F:\\devlop\\TomcatService\\apache-tomcat-7.0.53\\webapps\\projectImg_resources"
			 * +"/"+ImagesFileName); // 把上传的文件保存在路径中 FileUtils.copyFile(Images,
			 * serverFile);
			 */

		}
		if (webArticle != null) {
			// 设置修改时间
			webArticle.setEditTime(new Date());
			articleManagerService.updateArticle(webArticle);
			ServletActionContext.getRequest().setAttribute("msg", "修改成功。。。");
		}

		return "editSuccess";
	}

	/**
	 * 
	* @Title: deleteWebArticle 
	* @Description: TODO(删除文章) 
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String deleteWebArticle() {

		// 得到点击的文章id
		int articleID = webArticle.getWId();
		// 根据id查文章
		WebArticle deleteArticle = articleManagerService.findArticleByID(articleID);
		articleManagerService.deleteArticle(deleteArticle);
		ServletActionContext.getRequest().setAttribute("msg", "删除成功。。。");
		return "deleteSuccess";
	}
	
	/**
	 * 
	* @Title: selectArticleMultipleConditionsCombined 
	* @Description: TODO(多条件组合查询) 
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String selectArticleByMultipleConditionsCombined(){
		
		List<BasicAttributes> BasicAttributesList = crudService.loadingInfo();
		List<WebArticle> articleList = articleManagerService.selectArticleByMultipleConditionsCombined(webArticle);
		ActionContext.getContext().put("articleTypeList", BasicAttributesList);
		ActionContext.getContext().put("articleList", articleList);		
		return "selectSuccess";
	}

}
