<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>多表操作</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/font-awesome.min.css">

<!-- bootstrap3日期控件css插件 begin-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/bootstrap-datetimepicker.min.css">
<!-- bootstrap3日期控件css插件end -->
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

		<ul class="nav nav-tabs nav-justified" id="featuresTab">
			<li class="active"><a href="#uploadGraphic" data-toggle="tab">图文上传</a></li>
			<li><a href="#uploadPicture" data-toggle="tab">图片上传</a></li>
			<li><a href="#uploadFile" data-toggle="tab">文件上传</a></li>
			<li><a href="#importExportExcl" data-toggle="tab">导入导出Excl</a></li>
		</ul>

		<div class="tab-content">
			<!-- fade 淡入淡出的效果 -->
			<div class="tab-pane fade  active" id="uploadGraphic">
				<!--上传图文信息-->
				<form action="${ctx}/ArticleManagerAction_addWebArticle.action"
					enctype="multipart/form-data" method="post">
					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="title" class="am-form-labe">标题 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="tpl-form-input" id="title" name="WTitle"
								placeholder="请输入标题文字">
						</div>
					</div>
					
						<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="WDescription" class="am-form-labe">描述 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="tpl-form-input" id="WDescription" name="WDescription"
								placeholder="请输入简单的描述文字">
						</div>
					</div>

					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="articleType " class="am-form-labe">文章分类 </label>
						</div>
						<div class="col-xs-8">
							<select class="form-control tpl-form-input" name="attributes.basicAttributesId"
								id="articleType">
								<c:forEach items="${articleTypeList}" var="articleType">
									<option value="${articleType.basicAttributesId}">${articleType.attributeVlue}</option>
								</c:forEach>
							</select>

						</div>
					</div>

					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="releaseTime" class="am-form-labe">发布时间 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" id="releaseTime" name="WTime"
								class="tpl-form-input" placeholder="发布时间">
						</div>
					</div>

					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="author" class="am-form-labe">作者 </label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="tpl-form-input" id="author"
								name="WAuthor" placeholder="作者">
						</div>
					</div>


					<div class="row rowtop">
						<div class="col-xs-3 text-right">
							<label for="coverImg" class="am-form-labe">封面图 </label>
						</div>
						<div class="col-xs-8">
							<div class="form-file">
								<div class="form-file-img" id="imgPreview">
									<img src="${ctx}/img/sinablogb.jpg" alt="封面图" width="100%"
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
								name="WContent" placeholder="请输入文章内容。。。"></textarea>
						</div>
					</div>

					<div class="row rowtop text-center">
						<div class="col-xs-3 text-right"></div>
						<div class="col-xs-8 text-left">
							<button type="submit" class="btn btn-info btn-lg">提交</button>
						</div>

					</div>

				</form>

			</div>

			<div class="tab-pane fade" id="uploadPicture">
				<!--  上传图片信息 -->
				<div class="imgBox  container-fluid">
					<div class="imgSelect row">
						<div class="col-md-5 imgSelect-way">
							<div id="imgPreview" style="width: 100%; height: 90px">
								<img src="" alt="" width="100%" height="100%">
							</div>
							<button type="button" class="btn btn-danger btn-sm form-control">选择图片</button>
							<input id="selectedfile" type="file" multiple="">
						</div>
						<div class="col-md-7 imgSelect-way">
							<span id="fileDragArea" class="upload_drag_area">或者将文件拖到此处</span>

						</div>
					</div>

					<div class="imgMsg">
						<div id="status_info" class="info">选中0张文件，共0B。</div>
						<div class="btns">
							<div class="btn btn-default">继续选择</div>
							<div class="btn btn-info">开始上传</div>
						</div>
					</div>
				</div>

			</div>

			<div class="tab-pane fade" id="uploadFile">
				<!--上传文件 -->
				<p>上传文件</p>
			</div>

			<div class="tab-pane fade" id="importExportExcl">
				<!-- 导入导出Excl-->
				<p>导入导出Excl</p>
			</div>


		</div>
	</div>

	<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
	<!-- bootstrap3日期控件js插件begin -->
	<script type="text/javascript"
		src="${ctx}/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<!-- bootstrap3日期控件js插件end -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#releaseTime').datetimepicker({
				language : 'zh-CN',//显示中文
				minView : "date", //设置只显示到月份          
				format : 'yyyy-mm-dd',//显示格式
				autoclose : true,//选中自动关闭    
				todayBtn : true,//显示今日按钮

			});

		});

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