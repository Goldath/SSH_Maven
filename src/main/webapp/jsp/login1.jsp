<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>登录 - 程序员管理系统</title>
<link rel="icon" type="image/x-icon" href="${ctx}/img/icn/logo.png"
	media="all">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">

<link href="${ctx}/css/pages/login/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/css/bootstrap-responsive.min.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">
<link href="${ctx}/css/fontsgoogleapis.css" rel="stylesheet" />
<link href="${ctx}/css/pages/login/style.css" rel="stylesheet"
	type="text/css">
<link href="${ctx}/css/pages/login/signin.css" rel="stylesheet"
	type="text/css">
</head>
<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="javascript:;"><i class="fa  fa-apple"></i>
					程序员管理系统 </a>

				<div class="nav-collapse">
					<ul class="nav pull-right">

						<li class=""><a href="javascript:;" class=""> 注册新账号 </a></li>

						<li class=""><a href="javascript:;" class=""> <i
								class="fa fa-mail-reply "></i> 系统官网
						</a></li>
					</ul>

				</div>
				<!--/.nav-collapse -->

			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->



	<div class="account-container">

		<div class="content clearfix">

			<form action="${ctx}/UserAction_login.action" method="post">

				<h1>用户登录</h1>

				<div class="login-fields">

					<p>请输入您的详细信息</p>

					<div class="field">
						<label for="username">Username</label> <input type="text"
							id="userName" name="userName" value="" placeholder="用户名"
							class="login username-field" />
					</div>
					<!-- /field -->

					<div class="field">
						<label for="password">Password:</label> <input type="password"
							id="password" name="password" value="" placeholder="密码"
							class="login password-field" />
					</div>
					<!-- /password -->

				</div>
				<!-- /login-fields -->

				<div class="login-actions">

					<span class="login-checkbox"> <input id="Field" name="Field"
						type="checkbox" class="field login-checkbox" value="First Choice"
						tabindex="4" /> <label class="choice" for="Field">记住密码</label>
					</span>

					<button class="button btn btn-success btn-large" type="submit">登录</button>

				</div>
				<!-- .actions -->



			</form>

		</div>
		<!-- /content -->

	</div>
	<!-- /account-container -->



	<div class="login-extra">
		<a href="javascript:;">重设密码</a>
	</div>
	<!-- /login-extra -->

	<script src="${ctx}/js/jquery-3.2.1.min.js"></script>
	<script src="${ctx}/js/bootstrap.js"></script>

</body>

</html>