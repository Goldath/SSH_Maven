<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--引入ognl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<link rel="icon" type="image/x-icon" href="${ctx}/img/icn/logo1.png"
	media="all">
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">
<link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/js/Tabullet.js"></script>



<style>
body {
	background-color: #fafafa;
}

#table {
	text-align: center;
}

#table th {
	text-align: center;
}

.search {
	height: 40px;
	width: 300px;
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
</style>

</head>

<body>
	<div class=container-fluid>
		<div class="row">
			<div class="col-sm-4">
				<h1>SSH框架的Crud操作</h1>
			</div>
			<div class="col-sm-6">
				<a style="margin: 12px 5px"
					href="${ctx}/CrudAction_loadingTongJiFengXi.action"
					class="btn btn-primary btn-lg">统计分析</a> 
					<a style="margin: 12px 5px"
					href="javascript:;" class="btn btn-warning btn-lg">导入导出Excl</a> <a
					style="margin: 12px 5px"
					href="${ctx}/ArticleManagerAction_loadGraphicList.action"
					class="btn btn-info btn-lg">图文列表</a> <a style="margin: 12px 5px"
					href="${ctx}/CrudAction_selectUserList.action"
					class="btn btn-danger btn-lg">刷新列表</a>
			</div>
			<div class="col-sm-2">
				<h2
					style="background: linear-gradient(to right, #00C2FF, #1ab667); color: #eaf6f9; border-radius: 15px">你好，${sessionScope.currentUser.userName}</h2>
			</div>
		</div>
		<div class="row">
			<!--查询框  -->
			<div class="search  col-md-4 text-right pull-right">
				<div class="search-group">
					<input type="text" class="search-group-input form-control"
						id="search-input">
					<button class="btn  btn-success search-group-btn">
						<i class="fa fa-search" onclick="findUserByName()"></i>
					</button>

				</div>

			</div>

			<div class="col-sm-12">
				<table class="table table-hover" id="table">
					<thead>
						<tr data-tabullet-map="id">
							<th width="50" data-tabullet-map="_index"
								data-tabullet-readonly="true">序号</th>
							<th data-tabullet-map="userName">姓名</th>
							<th data-tabullet-map="password">密码</th>
							<th width="50" data-tabullet-type="edit"></th>
							<th width="50" data-tabullet-type="delete"></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>

		<!-- 分页 -->
		<nav id="pagingContainer" class="container-fluid">


		<ul class="pagination padding pull-right" style="margin: 0">
			<c:if test="${page.currentPage>1}">
				<li><a
					href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=1">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<li><a class="dispaly"
				href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=1">首页</a>
			</li>

			<li><a
				href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=1">2</a>
			</li>
			<li><a
				href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=3">3</a>
			</li>
			<li><a
				href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=4">4</a>
			</li>
			<li><a
				href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=5">5</a>
			</li>
			<li><a
				href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=6">...</a>
			</li>

			<li><a class="dispaly"
				href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=8">尾页</a>
			</li>
			<c:if test="${page.currentPage<page.totalPage}">
				<li><a class="dispaly"
					href="${ctx}/CrudAction_selectUserByPaging.action?currentPage=${page.curPage+1 }"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<li><a>${page.currentPage}/${page.totalPage}</a></li>
		</ul>
		</nav>


	</div>
	<script>
		var source;
		$(function() {
			//加载绑定数据表
			findAllUser();
		});

		//查询全部用户
		function findAllUser() {
			$.post("${ctx}/CrudAction_selectUserList.action", function(data) {
				if (data != null) {
					source = data;
					resetTabullet();
				}
			});
		} 
		
		//根据用户名模糊查询用户
		function  findUserByName(){
			var userName=$("#search-input").val();		
 		$.post("${ctx}/CrudAction_selectUserByName.action?userName="+userName+"", function(data) {
				if (data != null) {
					source = data;
					resetTabullet();
				}
			});
			
		}
		

		function resetTabullet() {
			$("#table")
					.tabullet(
							{
								data : source,
								action : function(mode, data) {
									console.dir(mode);
									if (mode === 'save') {
										//新增用户信息
										$
												.post(
														"${ctx}/CrudAction_addUser.action",
														{
															userName : data.userName,
															password : data.password
														},
														function(data) {
															if (data.result = "true") {
																alert("新增成功。。。");
																findAllUser();
															}

														});

									}
									if (mode === 'edit') {
										//修改用户信息
										for (var i = 0; i < source.length; i++) {
											if (source[i].id == data.id) {
												if (confirm("是否修改所选用户信息?")) {
													$
															.post(
																	"${ctx}/CrudAction_updateUser.action",
																	{
																		id : data.id,
																		userName : data.userName,
																		password : data.password
																	},
																	function(
																			data) {
																		if (data = "true") {
																			alert("修改成功。。。");
																			findAllUser();
																		}

																	});

												}
											}
										}
									}
									if (mode == 'delete') {
										//删除用户
										for (var i = 0; i < source.length; i++) {
											if (source[i].id == data) {
												
												
												if (confirm("是否删除所选信息?")) {
													$
															.post(
																	"${ctx}/CrudAction_deleteUser.action",
																	{
																		id : data
																	},
																	function(
																			data) {
																		if (data = "true") {
																			alert("删除成功。。。");
																			findAllUser();
																		}

																	});

												}

											}
										}
									}
								}
							});
		}
	</script>

</body>

</html>