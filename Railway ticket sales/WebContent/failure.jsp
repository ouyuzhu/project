<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		onload = function() {
			setInterval(go, 1000);
		};
		var x = 3;
		function go() {
			x--;
			if (x > 0) {
				document.getElementById("sp").innerHTML = x + "秒后跳转页面！！！";
			} else {
				location.href = 'index.jsp';
			}
		}
	</script>
	<div align="center">
		<h1>登陆失败,请重新登录！！！</h1>
		<br> <span id="sp"> 3秒后跳转页面！！！</span><br>
		<!-- 通过 “sp” 将 script 现实在<span>中 -->
		<a href="index.jsp">若没有跳转，请点击此处！！！</a>
	</div>
</body>
</html>