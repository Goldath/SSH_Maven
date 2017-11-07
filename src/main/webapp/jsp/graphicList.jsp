<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--修复java从数据库读取时间的时候时间参数后多了一个.0 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图文列表</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/font-awesome.min.css">
<style type="text/css">
.top-content {
	padding: 15px 15px 0px 15px;
	margin-bottom: 10px;
}

.graphic-content {
	padding: 5px 15px;
	margin-bottom: 10px;
}

.controlerTool-btn {
	border-radius: 0px;
	float: left;
}

.search-group {
	border-radius: 3px;
	overflow: hidden;
	position: relative;
}

.search-group-input {
	position: relative;
	left: 0px;
	height: 33px;
	border: 0;
	border-bottom: 1px solid #c2cad8;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.search-group-input:FOCUS {
	background-color: #fefffe;
	border-color: #3bb4f2;
	outline: 0; /* 隐藏上和左右边框 */
	-webkit-box-shadow: none;
	box-shadow: none;
}

.search-group-btn {
	position: relative;
	top: -33px;
	right: 0px;
	height: 33px;
}

ul li {
	list-style: none;
	height: 480px;
	margin-bottom: 5px;
	overflow: hidden;
}

#graphicList {
	padding: 0px;
}

.table-images-content {
	width: 100%;
	height: 100%;
	border: 1px solid #e7ecf1;
	padding: 25px;
	margin-bottom: 20px;
	border: 1px solid #e7ecf1;
}

.table-images-content-i-time {
	width: 100%;
	font-size: 12px;
	color: #666;
	padding-bottom: 10px;
	border-bottom: 1px solid #e7ecf1;
	margin-bottom: 10px;
}

.i-title {
	font-size: 14px;
	padding-bottom: 10px;
	font-weight: bold;
}

.table-images-content-i {
	position: relative;
	display: block;
	width: 100%;
	height: 220px;
}

.content-img {
	display: block;
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	vertical-align: middle;
	border: 0;
}

.table-images-content-i-info {
	position: absolute;
	left: 10px;
	right: 0;
	bottom: 10px;
	z-index: 2;
}

.ico-touxiang {
	line-height: 40px;
	display: inline-block;
	font-size: 14px;
}

.table-images-content-block {
	width: 100%;
	height: 163px;
	padding-top: 10px;
	color: #333;
	position: relative;
}

.tpl-i-font {
	text-indent: 2em; /* 空两个字符的属性 */
	font-size: 14px;
	color: #666;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: 1.6em;
	/* 	max-height: 3em; */ /* 只显示3行的属性*/
	display: -webkit-box; /* 文本以省略号代替 */
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 5;
}

.tpl-i-more {
	position: absolute;
	bottom: 2px;
	width: 100%;
	height: 50px;
}

#user-statistics {
	border-top: 1px solid #e7ecf1;
	border-bottom: 1px solid #e7ecf1;
	margin-top: 10px;
	width: 100%;
	overflow: hidden;
	padding: 10px 0px;
}

#user-statistics li {
	float: left;
	text-align: center;
	width: 33.3333%;
}

.btn-toolbar {
	margin-left: -5px;
	display: block;
}

.btn-toolbar .btn {
	margin-left: 0px
}

.font-blue {
	color: #0066FF
}

.font-red {
	color: red
}

.font-suceess {
	color: #FF6600
}

.font-green {
	color: #009100
}
</style>

</head>
<body>
	<div class="container-fluid">

		<div class="top-content row">

			<div class="controlerTool col-md-4">
				<a type="button"
					href="${ctx}/CrudAction_loadingInsertArticle.action"
					class="btn btn-sm btn-success controlerTool-btn"> <span
					class="fa fa-plus"></span> 新增
				</a> <a type="button" class="btn btn-sm btn-info controlerTool-btn">
					<span class="fa fa-star-o"></span> 保存
				</a> <a type="button" class="btn btn-sm btn-warning controlerTool-btn">
					<span class=" fa fa-legal "></span> 审核
				</a> <a type="button" class="btn btn-sm btn-danger controlerTool-btn">
					<span class="fa fa-trash-o"></span> 删除
				</a>
			</div>

			<form
				action="${ctx}/ArticleManagerAction_selectArticleByMultipleConditionsCombined.action"
				method="post">
				<div class="selectedType  col-md-3">
					<select class="form-control" name="attributes.basicAttributesId">
						<c:forEach items="${articleTypeList}" var="articleType">
							<option value="${articleType.basicAttributesId}">${articleType.attributeVlue}</option>
						</c:forEach>
					</select>

				</div>
				<div class="col-md-1"></div>
				<div class="search  col-md-4 text-right">
					<div class="search-group">
						<input type="text" class="search-group-input form-control"
							name="WTitle">

						<button type="submit" class="btn  btn-success search-group-btn">
							<i class="fa fa-search"></i>
						</button>

					</div>
				</div>
			</form>

		</div>

		<div class=" row graphic-content">
			<ul id="graphicList">

				<c:forEach items="${articleList}" var="article">
					<li class="col-md-4">
						<div class="table-images-content">
							<div class="table-images-content-i-time">
								<fmt:formatDate type="time" value="${article.WTime}"
									pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
								（${article.attributes.attributeVlue}） <a href="javascript:;">查看详情</a>
								<a
									href="${ctx}/ArticleManagerAction_deleteWebArticle.action?WId=${article.WId}"
									class="pull-right font-red fa fa-trash-o"></a> <a
									href="${ctx}/ArticleManagerAction_loaddingWebArticle.action?WId=${article.WId}"
									class="pull-right font-green fa fa-edit"
									style="margin-right: 5px"></a>
							</div>
							<div class="i-title">${article.WTitle}</div>
							<a href="${ctx}/imgdata/${article.WImages}"
								class="table-images-content-i">
								<div class="table-images-content-i-info">
									<span class="ico-touxiang"> <img class="img-circle"
										src="${ctx}/img/15830114.jpg" width="40px" height="40px"
										alt="">${article.WAuthor}
									</span>

								</div> <img class="content-img"
								src="${ctx}/imgdata/${article.WImages}" alt=""> <%-- <img class="content-img" src="${ctx}/img/04.jpg" alt=""> --%>
							</a>
							<div class="table-images-content-block">
								<div class="tpl-i-font">${article.WContent}</div>
								<div class="tpl-i-more">
									<ul id="user-statistics">
										<li><span class="fa fa-eye font-blue"> 100+</span></li>
										<li><span class="fa fa-star-o font-suceess"> 235+</span></li>
										<li><span class="fa fa-thumbs-o-up font-green">
												600+</span></li>
									</ul>
								</div>

							</div>
						</div>

					</li>
				</c:forEach>

			</ul>
		</div>

	</div>
	<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
	<!-- 	<script type="text/javascript">	
	$("ul li").click(function(){
        var item = $(this).index()+1;  //获取索引下标 也从0开始
        var textword = $(this).text();  //文本内容
        alert("下标索引值为：" + item +"\n"+ "文本内容是："+textword); //  \n换行
    })
	</script> -->
</body>
</html>