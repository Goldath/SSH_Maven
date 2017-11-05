<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--引入ognl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>结果显示</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">
<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
</head>

<body style="text-align: center; padding-top: 200px">
	<h1>${msg}。。。</h1>
	<hr>
	<label id="times">5秒后回到主页界面</label>
	<script type="text/javascript">
		var InterValObj;
		var curCount = 5;//当前剩余秒数
		$(document).ready(function() {

			InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次

		});

		//timer处理函数
		function SetRemainTime() {
			if (curCount == 0) {
				window.clearInterval(InterValObj);//停止计时器
				//window.location.href="jsp/login.jsp";//当前地址
				top.location = '${ctx}/ArticleManagerAction_loadGraphicList.action'; //顶部地址
			} else {
				curCount--;
				$("#times").text(curCount + "秒后回到主页界面");
			}
		}
	</script>
</body>
</html>
