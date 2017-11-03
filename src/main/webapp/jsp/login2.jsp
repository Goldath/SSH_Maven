<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录 - 程序员管理系统</title>
<link rel="icon" type="image/x-icon" href="${ctx}/img/icn/logo1.png"
	media="all">
<meta name="description"
	content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<link rel="stylesheet" href="${ctx}/css/bootstrap.css" type="text/css" />

<link rel="stylesheet" href="${ctx}/css/animate.css" type="text/css" />

<link rel="stylesheet" href="${ctx}/css/font-awesome.min.css"
	type="text/css" />

<link rel="stylesheet" href="${ctx}/css/simple-line-icons.css"
	type="text/css" />

<link rel="stylesheet" href="${ctx}/css/font.css" type="text/css" />

<link rel="stylesheet" href="${ctx}/css/app.css" type="text/css" />


<style type="text/css">
body {
	background: url(${ctx}/img/04.jpg) no-repeat center top;
	background-attachment: fixed;
	background-size: cover;
	-webkit-background-size: cover;
	-o-background-size: cover;
}
</style>
</head>
<body class="dker">

	<section id="content" class="m-t-lg wrapper-md animated fadeInDown">

	<div class="container aside-xl">

		<a class="navbar-brand block" href="index.html"><span
			class="h2 font-bold">程序员管理系统</span></a>

		<section class="m-b-lg"> <header class="wrapper text-center">

		<strong>ChengXuyuanGuangLiSystem</strong> </header> <!--projectName/namespace_action!methodName-->
		<form action="${ctx}/LoginAction_login.action" method="post">

			<div class="form-group">

				<input placeholder="请输入用户名"
					class="form-control rounded input-lg text-center no-border"
					name="userName" id="username" />

			</div>

			<div class="form-group">

				<input type="password" placeholder="请输入密码"
					class="form-control rounded input-lg text-center no-border"
					name="password" id="password" />

			</div>

			<div class="checkbox i-checks m-b">

				<label class="m-l"> <input type="checkbox" checked=""><i></i>
					同意 <a href="#">条款和政策</a>

				</label>

			</div>

			<button type="submit"
				class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded">
				<i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登录</span>
			</button>

			<div class="line line-dashed"></div>

			<p class="text-muted text-center">
				<small>Already have an account?</small>
			</p>

			<a href="signin.html"
				class="btn btn-lg btn-info btn-block btn-rounded">注册</a>

		</form>

		</section>

	</div>

	</section>

	<!-- footer -->

	<footer id="footer">

	<div class="text-center padder clearfix">

		<p>

			<small>Web app framework base on Bootstrap<br>&copy;
				2017
			</small>

		</p>

	</div>

	</footer>

	<!-- / footer -->

	<script src="${ctx}/js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap -->

	<script src="${ctx}/js/bootstrap.js"></script>

	<!-- App -->

	<script src="${ctx}/js/app.js"></script>

	<script src="${ctx}/js/slimscroll/jquery.slimscroll.min.js"></script>

	<script src="${ctx}/js/app.plugin.js"></script>

</body>
</html>