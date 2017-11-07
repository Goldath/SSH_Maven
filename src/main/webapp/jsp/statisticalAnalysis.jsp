<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>统计分析</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css">
<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/echarts.min.js"></script>
</head>

<body>
	<div class=container-fluid>
		<div id="echarts" style="height: 600px;" class="col-md-6"></div>
		<div id="echarts2" style="height: 600px;" class="col-md-6"></div>
	</div>
	<script type="text/javascript">
		$(function() {
			//加载图表数据
			LoadingUserAnalysis();
		});
		var myChart = echarts.init(document.getElementById('echarts'));

		function LoadingUserAnalysis() {

			$.get("${ctx}/CrudAction_loadingAnalysis.action", function(data) {
				if (data != null) {

					var typedata = new Array(data.length);
					for (var i = 0; i < data.length; i++) {
						typedata[i] = data[i].name;
					}

					myChart.setOption({

						title : {
							text : '文章类型统计',
							subtext : '2017-11-11',
							x : 'center'
						},

						tooltip : {
							trigger : 'item',
							formatter : "{a} <br/>{b} : {c} ({d}%)"
						},
						toolbox : {
							show : true, //是否显示工具栏组件。
							orient : 'horizontal', //工具栏 icon 的布局朝向，horizontal横向布局 ，vertical纵向布局
							itemSize : 15, //工具栏 icon 的大小
							feature : {
								dataView : {
									readOnly : false
								},
								saveAsImage : {}
							}
						},
						legend : {
							orient : 'vertical',
							left : 'left',
							data : typedata
						},
						series : [ {
							name : '访问来源',
							type : 'pie',
							radius : '55%',
							center : [ '50%', '60%' ],
							data : data,
							itemStyle : {
								emphasis : {
									shadowBlur : 10,
									shadowOffsetX : 0,
									shadowColor : 'rgba(0, 0, 0, 0.5)'
								}
							}
						} ]

					});
				}
			});

		}
	</script>
</body>
</html>
