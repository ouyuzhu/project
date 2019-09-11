
<%@page import="raky.train.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.down {
	width: 500px;
	height: 662px;
	margin: 0 auto;
	margin-top: 20px;
}

h1 {
	font-size: 14px;
	line-height: 36px;
	text-indent: 20px;
	color: #fff;
	background-color: #6495C6;
	border: 1px solid #5B88B8;
	border-radius: 3px 3px 0 0;
	text-align: left;
	font-family: Tahoma, "宋体";
}

.main {
	border: 1px solid #000;
	height: 400px;
	padding-left: 50px;
	padding-top: 50px;
}

.list {
	width: 400px;
	height: 300px;
}

.line {
	height: 30px;
	margin-bottom: 25px;
	width: 400px;
}

.list span {
	display: inline-block;
	height: 30px;
	width: 100px;
	float: left;
	text-align: right;
}

input {
	height: 30px;
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
<%
	String user = session.getAttribute("user").toString();
	String[] info = null;
	info = UserDao.info(user);
%>
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
			<span>欢迎用户</span> <span style="color: crimson"> <%=user%></span>| <span>
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
			<li class="layui-nav-item layui-this"><a
				href="personal_info.jsp">个人信息</a></li>
			<li class="layui-nav-item"><a href="timetable.jsp">时刻表查询</a></li>
		</ul>
		<div class="down">
			<h1>账户信息</h1>
			<form action="Update" method="post" class="main">
				<div class="list">
					<div class="line">
						<span class="lable">会员名</span>
						<div class="r-txt">
							<input type="text" name="username" value="<%=info[0]%>" size="30"
								disabled="disabled">
						</div>
					</div>
					<div class="line">
						<span class="lable">密码</span>
						<div class="r-txt">
							<input type="text" name="password" value="<%=info[1]%>" size="30">
						</div>
					</div>
					<div class="line">
						<span class="lable">真实姓名</span>
						<div class="r-txt">
							<input type="text" name="truename" value="<%=info[2]%>" size="30"
								disabled="disabled">
						</div>
					</div>
					<div class="line">
						<span class="lable">身份证号</span>
						<div class="r-txt">
							<input type="text" name="id_card" value="<%=info[3]%>" size="30"
								disabled="disabled">
						</div>
					</div>
					<div class="line">
						<span class="lable">联系电话</span>
						<div class="r-txt">
							<input type="text" name="phone" value="<%=info[4]%>" size="30">
						</div>
					</div>
					<input type="submit" value="保存"> <input type="button"
						value="取消">
				</div>
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