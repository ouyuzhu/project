<%@page import="java.util.Vector"%>
<%@page import="raky.train.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String user = session.getAttribute("user").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Vector<Vector<String>> res = UserDao.select(request.getParameter("start"), request.getParameter("stop"));
%>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	text-align: center;
}

.header {
	height: 100px;
	border-bottom: 1px solid #000;
	background-color: #544b4b0f;
}

.header .div1 {
	height: 50px;
	width: 210px;
	float: left;
	margin: 25px 0px 0px 10%;
	line-height: 50px;
}

.header .div1 img {
	margin-top: 0px;
	float: left;
}

.header .div1 ul {
	list-style: none;
}

.header .div1 ul li:nth-of-type(1) {
	font-size: 20px;
	line-height: 20px;
}

.header .div1 ul li:nth-of-type(2) {
	padding-top: 5px;
	font-size: 12px;
	line-height: 10px;
}

.header .div2 {
	height: 50px;
	width: 210px;
	float: left;
	line-height: 50px;
	font-size: 19px;
	margin: 19px 0px 0px -35px;
}

.header .div3 {
	width: 210px;
	height: 50px;
	float: right;
	margin: 25px 10% 0px 0px;
	line-height: 50px;
}

.content {
	height: 600px;
	overflow: hidden;
	background-color: #48cbde70;
	background-size: auto auto;
}

.content .table {
	width: 500px;
	height: 400px;
	margin: 5% auto;
}

.footer {
	height: 100px;
	background-color: #67676d;
	position: relative;
	margin: 0 auto;
}

.footer .info {
	width: 500px;
	position: absolute;
	margin-left: -250px;
	top: 10px;
	left: 50%;
}

.footer .info p {
	font-size: 16px;
	margin-bottom: 10px;
}
</style>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link rel="stylesheet" href="static/CSS/register.css">
<script src="layui/layui.js"></script>
<script src="static/JS/jquery-1.12.4.js"></script>
</head>
<body>
	<div class="header">
		<div class="div1">
			<img src="images/logo.png">
			<ul>
				<li>中国铁路12306</li>
				<li>12306 CHINA RAILWAY</li>
			</ul>
		</div>
		<div class="div2">五星好评欢迎您</div>
		<div class="div3">
			<span>欢迎用户</span> <span style="color: crimson"> <%=user%><%--登陆成功显示用户名--%></span>|<span>
				<a href="ask.jsp">注销</a>
			</span>
		</div>
	</div>
	<div class="content">
		<ul class="layui-nav">
			<li class="layui-nav-item"><a href="success.jsp">首页</a></li>
			<li class="layui-nav-item"><a href="notice.jsp">公告</a></li>
			<li class="layui-nav-item"><a href="buy.jsp">购票</a></li>
			<li class="layui-nav-item"><a href="order.jsp">我的订单</a></li>
			<li class="layui-nav-item"><a href="personal_info.jsp">个人信息</a></li>
			<li class="layui-nav-item"><a href="timetable.jsp">时刻表查询</a></li>
		</ul>
		<div class="table">
			<table border="1" align:="center" width="500px" bgcolor="white">
				<tr>
					<th>车次</th>
					<th>始发站</th>
					<th>终点站</th>
					<th>余票数</th>
					<th>发车时间</th>
					<th>到达时间</th>
					<th>价格</th>
					<th>操作</th>
				</tr>
				<%
					if (res.size() == 0) {
				%>
				<tr>
					<td colspan="8"><%="抱歉，没有查询到您需要的路线信息"%></td>
				</tr>
				<%
					} else {
				%>
				<%
					for (Vector<String> i : res) {
				%>
				<tr>
					<td><%=i.get(0)%></td>
					<td><%=i.get(1)%></td>
					<td><%=i.get(2)%></td>
					<td><%=i.get(3)%></td>
					<td><%=i.get(4)%></td>
					<td><%=i.get(5)%></td>
					<td><%=i.get(6)%></td>
					<td><button
							onclick="location.href='Buy?method=post&tickets_id=<%=i.get(0)%>&start=<%=i.get(1)%>&stop=<%=i.get(2)%>&votes=<%=i.get(3)%>&s_time=<%=i.get(4)%>&a_time=<%=i.get(5)%>&price=<%=i.get(6)%>'">购买</button></td>
				</tr>
				<%
					}
				%>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="footer">
		<div class="info">
			<p>
				<span>版权所有&copy;2019-2019</span> <span>合肥一元五星好评队<img
					src="images/star.png"
					style="width: 40px; height: 40px; position: relative; top: 0px;"></span>
				<span>安徽科技学院</span>
			</p>
			<p>
				<span>徽ICP备19970604号-3</span> <span> | </span> <span>徽ICP备证970604号</span>
			</p>
		</div>
	</div>
	<script>
		layui.use('element', function() {
			var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
</body>
</html>