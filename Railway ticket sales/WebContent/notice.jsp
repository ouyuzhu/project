<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String user = session.getAttribute("user").toString();
%>
</head>
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
	width: 100%;
	overflow: hidden;
	background-color: #48cbde70;
	background-size: auto auto;
	position: relative;
}

.div10 {
	width: 500px;
	height: 100px;
	overflow: hidden;
	margin: auto;
	position: relative;
	color: red;
}

@keyframes anis { 100% {
	transform: translateY(-200px)
}

}
.div20 {
	animation: anis 10s linear infinite normal;
	font-size: 25px;
	font-family: "华文行楷" ；
}

.div20:hover {
	animation-play-state: paused;
}

.Custom_UnionStyle {
	font-size: 20px;
	font-family: "楷体" ；
}

.content_body {
	width: 86%;
	position: absolute;
	left: 50%;
	margin-left: -43%;
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
			<span>欢迎用户</span> <span style="color: crimson"> <%=user%></span>| <span>
				<a href="ask.jsp">注销</a>
			</span>
		</div>
	</div>
	<div class="content">
		<ul class="layui-nav">
			<li class="layui-nav-item"><a href="success.jsp">首页</a></li>
			<li class="layui-nav-item layui-this"><a href="notice.jsp">公告</a></li>
			<li class="layui-nav-item"><a href="buy.jsp">购票</a></li>
			<li class="layui-nav-item"><a href="order.jsp">我的订单</a></li>
			<li class="layui-nav-item"><a href="personal_info.jsp">个人信息</a></li>
			<li class="layui-nav-item"><a href="timetable.jsp">时刻表查询</a></li>
		</ul>
		<div class="div10">
			<div class="div20">
				<p>各位旅客</p>
				<p>暑假来临</p>
				<p>铁路即将迎来客运高峰</p>
				<p>请广大旅客们在客流高峰期间提早出门</p>
				<p>售票厅购票取票人员较多</p>
				<p>需要排队办理</p>
				<p>并且为了维护您的人身安全</p>
				<p>对部分车次旅客需要进行二次安检</p>
				<p>进站安检时间将会延长</p>
				<p>请各位旅客提前1小时到站</p>
				<p>预留出充分的时间取票、进站、乘车</p>
				<p>以免耽误您的行程</p>
			</div>
		</div>
		<div class="content_body" id="Zoom1">
			<p class="Custom_UnionStyle" align="justify">
				2019年，国家铁路局深入贯彻落实国务院“放管服”改革和“双随机、一公开”监管改革要求，有序开展铁路专用设备行政许可企业监督检查，持续加强铁路专用设备产品质量安全监管工作。</p>
			<p class="Custom_UnionStyle" align="justify">
				1季度，各地区铁路监督管理局认真按照《国家铁路局关于印发&lt;2019年度铁路专用设备行政许可企业监督检查计划&gt;的通知》（国铁设备监函〔2019〕2号）要求，对辖区内摇号随机确定的铁路专用设备行政许可受检企业按程序、标准开展监督检查，共检查企业7家，发现问题44项，下发《铁路专用设备行政许可企业监督检查发现问题整改通知书》7份。按企业生产类别分，铁路机车车辆生产企业6家、铁路运输基础设备生产企业1家；按企业监管辖区分，上海铁路监督监管局辖区4家、广州铁路监督管理局辖区1家、成都铁路监督管理局辖区1家、西安铁路监督管理局辖区1家。设备监督管理司组织装备技术中心对北京铁路督察室辖区内1家铁路专用设备行政许可受检企业（铁路运输基础设备生产企业）开展监督检查，共发现问题4项，下发《铁路专用设备行政许可企业监督检查发现问题整改通知书》1份，监督检查情况详见附表。</p>
			<p class="Custom_UnionStyle" align="justify">
				各地区铁路监督管理局的监督检查情况已在国家铁路局政府网站“组织机构-地区监管局-公告公示”栏目公布。对监督检查发现的问题，各相关企业须按要求整改到位，并将整改情况及时反馈检查单位。国家铁路局将结合履职工作实际，适时对企业的整改情况进行复查。</p>
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