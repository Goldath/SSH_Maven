<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>404 - 程序员管理系统</title>
<link rel="icon" type="image/x-icon" href="${ctx}/img/icn/logo1.png"
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


</head>
<body>


	<div class="container">

		<div class="row">

			<div class="span12">

				<div class="error-container">
					<h1>404</h1>

					<h2>Who! bad trip man. No more pixesl for you.</h2>

					<div class="error-details">
						Sorry, an error has occured! Why not try going back to the <a
							href="javascript:;">home page</a> or perhaps try following!

					</div>
					<!-- /error-details -->

					<div class="error-actions">
						<a href="javascript:;" class="btn btn-large btn-primary"
							onclick="history.go(-1)"> <i class="fa fa-mail-reply "></i>
							&nbsp; 返回上页
						</a>



					</div>
					<!-- /error-actions -->

				</div>
				<!-- /error-container -->

			</div>
			<!-- /span12 -->

		</div>
		<!-- /row -->

	</div>
	<!-- /container -->



	<script src="${ctx}/js/jquery-3.2.1.min.js"></script>
	<script src="${ctx}/js/bootstrap.js"></script>

</body>

</html>