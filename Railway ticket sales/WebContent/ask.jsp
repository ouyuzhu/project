<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="raky.train.dao.UserDao"%>
<%@ page import="java.util.*"%>
<%
	session.removeAttribute("user");
%>
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
		<h1>注销成功！您需要登陆后才能进行操作！！！</h1>
		<br> <span id="sp"> 3秒后跳转页面！！！</span><br> <a
			href="index.jsp">若没有跳转，请点击此处！！！</a>
	</div>
</body>
</html>