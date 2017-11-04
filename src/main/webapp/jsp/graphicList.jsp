<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
}

#graphicList {
	padding: 0px;
}

.table-images-content {
	width: 100%;
	border: 1px solid #e7ecf1;
	padding: 25px;
	margin-bottom: 20px;
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
}

.table-images-content-i {
	position: relative;
	display: block;
	width: 100%;
}

.content-img {
	display: block;
	width: 100%;
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
	padding-top: 10px;
	color: #333;
}

.tpl-i-font {
	font-size: 14px;
	color: #666;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: 1.6em;
	max-height: 3em;
	display: -webkit-box; /* 文本以省略号代替 */
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
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
					href="${ctx}/CrudAction_loadingMultiTableOperation.action"
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

			<div class="selectedType  col-md-3">
				<select class="form-control">
					<c:forEach items="${articleTypeList}" var="articleType">
						<option value="${articleType.basicAttributesId}">${articleType.attributeVlue}</option>
					</c:forEach>
				</select>

			</div>
			<div class="col-md-1"></div>
			<div class="search  col-md-4 text-right">
				<div class="search-group">
					<input type="text" class="search-group-input form-control">

					<button class="btn  btn-success search-group-btn">
						<i class="fa fa-search"></i>
					</button>

				</div>

			</div>
		</div>

		<div class=" row graphic-content">
			<ul id="graphicList">

				<c:forEach items="${articleList}" var="article">
					<li class="col-md-4">
						<div class="table-images-content">
							<!-- ${article.WTime} + -->
							<div class="table-images-content-i-time">${article.WTime}（
								${article.attributes.attributeVlue}）</div>
							<div class="i-title">${article.WTitle}</div>
							<a href="javascript:;" class="table-images-content-i">
								<div class="table-images-content-i-info">
									<span class="ico-touxiang"> <img class="img-circle"
										src="${ctx}/img/15830114.jpg" width="40px" height="40px"
										alt="">${article.WAuthor}
									</span>

								</div> <img class="content-img" src="${ctx}/img/04.jpg" alt="">
							</a>
							<div class="table-images-content-block">
								<div class="tpl-i-font">${article.WDescription}</div>
								<div class="tpl-i-more">
									<ul id="user-statistics">
										<li><span class="icon-rss font-blue"> 100+</span></li>
										<li><span class="icon-tasks font-suceess"> 235+</span></li>
										<li><span class="icon-github font-green"> 600+</span></li>
									</ul>
								</div>
								<div class="btn-toolbar">
									<button type="button"
										class="btn btn-xs btn-success controlerTool-btn">
										<span class="fa fa-plus"></span> 新增
									</button>
									<button type="button"
										class="btn btn-xs btn-info controlerTool-btn">
										<span class="fa fa-star-o"></span> 保存
									</button>
									<button type="button"
										class="btn btn-xs btn-warning controlerTool-btn">
										<span class=" fa fa-legal "></span> 审核
									</button>
									<button type="button"
										class="btn btn-xs btn-danger controlerTool-btn">
										<span class="fa fa-trash-o"></span> 删除
									</button>
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
</body>
</html>