<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>admin.jsp</title>
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
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
	width: 100%;
	border-bottom: 1px solid #ccc;
}

.header .div1 {
	height: 50px;
	width: 210px;
	float: left;
	margin-left: 10%;
	padding-top: 25px;
	position: relative;
}

.header .div1 img {
	margin-top: -5px;
	float: left;
	width: 38px;
	height: 38px;
}

.header .div1 ul {
	position: absolute;
	left: 56px;
	list-style: none;
	float: right;
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
	font-size: 19px;
	padding-top: 25px;
	margin: 3px 0px 0px -35px;
}

.blank {
	height: 120px;
	background-color: skyblue;
}

.content {
	height: 460px;
	width: 100%;
	background-color: skyblue;
}

.content .left {
	float: left;
	width: 50%;
	height: 460px;
	font-size: 20px;
	border-right: 1px solid #fff;
}

.content .right {
	text-align: right;
	float: left;
	right: 30px;
	width: 30%;
	height: 100%;
	font-size: 25px;
}

.content .right p:nth-of-type(1) input {
	width: 265px;
	height: 30px;
}

.content .right p:nth-of-type(2) input {
	width: 265px;
	height: 30px;
}

.content .right p:nth-of-type(3) input {
	width: 100px;
	height: 30px;
	font-size: 20px;
}

.content .right p:nth-of-type(3) span {
	color: #fff;
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
	</div>
	<div class="blank"></div>
	<div class="content">
		<div class="left">
			<p>管理员先生（女士）您好!欢迎您登陆12306铁路管理系统。</p>
			<p>请您务必严谨操作，铁路交通的重要信息都在您的手下。</p>
			<p>道路千万条，谨慎第一条，管理员不谨慎，交通要瘫痪！</p>
			<p>亲爱的管理员同志，感谢您的辛勤付出，您辛苦了。</p>
			<br> <br>
			<p>请在右边登陆您的管理员账号！</p>
		</div>
		<div class="right">
			<form action="admin" method="post">
				<p>
					用户名<input type="text" name="username">
				</p>
				<p>
					密码<input type="password" name="password">
				</p>
				<p>
					<input type="submit" name="submit" value="登录"><span>
						| </span><input type="reset" value="重置">
				</p>
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
</body>
</html>

