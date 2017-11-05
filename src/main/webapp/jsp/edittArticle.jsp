<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改文章</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/font-awesome.min.css">
<style type="text/css">
.rowtop {
	margin-top: 15px
}

.am-form-labe {
	padding-top: 5px;
	font-size: 16px;
	color: #888;
	font-weight: inherit;
	text-align: right;
}

.tpl-form-input {
	display: block;
	width: 100%;
	padding: 6px 12px;
	border-radius: 4px;
	border: 0;
	border-bottom: 1px solid #c2cad8;
	color: #555;
	padding-left: 5px;
}

.tpl-form-input:focus {
	background-color: #fefffe;
	border-color: #3bb4f2;
	outline: 0; /* 隐藏上和左右边框 */
	-webkit-box-shadow: none;
	box-shadow: none;
}

.from-file {
	position: relative;
	overflow: hidden;
}

.form-file-img {
	width: 300px;
	height: 180px;
	margin-bottom: 10px;
}

.form-file input[type=file] {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 1;
	width: 100%;
	height: 100%;
	opacity: 0;
	cursor: pointer;
}

.tab-content>.active {
	display: inline !important;
}
/* --------------------------------------图片上传样式------------------------------ */
.imgBox {
	margin: 10px;
	padding: 8px;
	border: 1px solid #dfdfdf;
	border-radius: 5px;
	box-shadow: 0px 1px 1px #000;
}

.imgSelect {
	padding: 0px 15px;
	margin-bottom: 8px;
}

.imgSelect-way {
	position: relative;
	height: 130px;
	border: 1px dashed #ddd;
	padding: 5px;
}

.imgMsg {
	border-top: 1px solid #DADADA;
	height: 45px;
	line-height: 45px;
	padding: 0 10px;
	position: relative;
	vertical-align: middle;
	background-color: #FFFFFF;
}

.info {
	float: left;
	color: #666666;
	display: inline-block;
}

.btns {
	position: absolute;
	right: 16px;
	line-height: 30px;
	top: 6px;
}

#selectedfile {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	opacity: 0;
	cursor: pointer;
}

.upload_drag_area {
	display: inline-block;
	width: 100%;
	height: 100%;
	background: -webkit-linear-gradient(#43CBFF, #9708CC);
	/* Safari 5.1 - 6.0 */
	background: -o-linear-gradient(#43CBFF, #9708CC);
	/* Opera 11.1 - 12.0 */
	background: -moz-linear-gradient(#43CBFF, #9708CC);
	/* Firefox 3.6 - 15 */
	background: linear-gradient(#43CBFF, #9708CC); /* 标准的语法 */
	color: #fff;
	text-align: center;
	line-height: 130px;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container-fluid">

				<!--上传图文信息-->
				<form action="${ctx}/ArticleManagerAction_editWevArticle.action"
					enctype="multipart/form-data" method="post">
					<!--文章id  -->
					<input type="hidden" name="WId" value="${webArticle.WId}"/>
					<!--文章发布的日期  -->
					<input type="hidden" name="WTime" value="${webArticle.WTime}"/>
					<!--文章图片的url  -->
					<input type="hidden" name="WImages" value="${webArticle.WImages}"/>
					
					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="title" class="am-form-labe">标题 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="tpl-form-input" id="title"
								name="WTitle" value="${webArticle.WTitle}">
						</div>
					</div>

					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="WDescription" class="am-form-labe">描述 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="tpl-form-input" id="WDescription"
								name="WDescription" value="${webArticle.WDescription}">
						</div>
					</div>

					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="articleType " class="am-form-labe">文章分类 </label>
						</div>
						<div class="col-xs-8">
							<select class="form-control tpl-form-input"
								name="attributes.basicAttributesId" id="articleType">
								<c:forEach items="${articleTypeList}" var="articleType">
									<option value="${articleType.basicAttributesId}">${articleType.attributeVlue}</option>
								</c:forEach>
							</select>

						</div>
					</div>

					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="author" class="am-form-labe">作者 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="tpl-form-input" id="author"
								name="WAuthor" value="${webArticle.WAuthor}">
						</div>
					</div>


					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="coverImg" class="am-form-labe">封面图 </label>
						</div>
						<div class="col-xs-8">
							<div class="form-file">
								<div class="form-file-img" id="imgPreview">
									<img src="${ctx}/imgdata/${webArticle.WImages}" alt="封面图" width="100%"
										height="100%">
								</div>
								<button type="button" class="btn btn-danger btn-sm">添加封面图片</button>
								<input id="doc-form-file" type="file" multiple="" name="Images"
									onchange="PreviewImage(this)">
							</div>
						</div>
					</div>

					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="articleContent" class="am-form-labe">文章内容 </label>
						</div>
						<div class="col-xs-8">
							<textarea style="width: 100%" rows="5" id="articleContent"
								name="WContent">${webArticle.WContent}</textarea>
						</div>
					</div>

					<div class="row rowtop text-center">
						<div class="col-xs-3 text-right"></div>
						<div class="col-xs-8 text-left">
							<button type="submit" class="btn btn-info btn-lg">保存</button>
						</div>

					</div>

				</form>

	</div>

	<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
	<script type="text/javascript">
		//**********************  图片回显      ***************************
		function PreviewImage(imgFile) {
			var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;
			if (!pattern.test(imgFile.value)) {
				alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");
				imgFile.focus();
			} else {
				var path;
				if (document.all) //IE
				{
					imgFile.select();
					path = document.selection.createRange().text;
					document.getElementById("imgPreview").innerHTML = "";
					document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\""
							+ path + "\")"; //使用滤镜效果
				} else //FF
				{
					path = URL.createObjectURL(imgFile.files[0]);
					document.getElementById("imgPreview").innerHTML = "<img src='"
							+ path + "' width='100%' height='100%'/>";
				}
			}
		}
	</script>


</body>
</html>