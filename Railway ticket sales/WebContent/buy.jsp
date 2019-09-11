<%@ page language="java" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String user = session.getAttribute("user").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'login.jsp' starting page</title>
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
	margin: 0 auto;
	background: url("images/bg4.png") no-repeat 0px -250px;
	background-size: cover;
	position: relative;
}

.content .left {
	width: 400px;
	height: 600px;
	float: left;
}

.content img {
	width: 400px;
	height: 600px;
}

.content .right {
	width: 400px;
	height: 600px;
	margin-left: 50px;
	float: right;
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

.form-signin-heading {
	text-align: center;
	font-size: 36px;
	font-family: "微软雅黑";
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 0px;
	margin: 80px auto 20px;
	background-color: #bddbcfa1;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
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
			<li class="layui-nav-item layui-this"><a href="buy.jsp">购票</a></li>
			<li class="layui-nav-item"><a href="order.jsp">我的订单</a></li>
			<li class="layui-nav-item"><a href="personal_info.jsp">个人信息</a></li>
			<li class="layui-nav-item"><a href="timetable.jsp">时刻表查询</a></li>
		</ul>
		<div class="max">
			<h2 style="line-height: 60px; margin-bottom: -30px;">现在您可以购票了,请输入您的出发地和目的地</h2>
		</div>
		<div class="container">
			<form name="myForm" class="form-signin" action="select.jsp">
				<h2 class="form-signin-heading">
					<font color="#48cbde70">购票系统</font>
				</h2>
				<p>
					<th>出发站</th> <span class="glyphicon glyphicon-user"
						aria-hidden="true"></span><input name="start" type="text"
						class="input-block-level">
				</p>
				<p>
					<th>终点站</th> <span class="glyphicon glyphicon-user"
						aria-hidden="true"></span><input name="stop" type="text"
						class="input-block-level">
				</p>
				<td><input type="submit" value="查询"
					style="height: 28px; width: 100px;"></td>
			</form>
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
