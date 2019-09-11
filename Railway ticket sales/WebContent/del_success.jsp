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
				location.href = 'welc_admin.jsp';
			}
		}
	</script>
	<div align="center">
		<h1>删除成功！！！</h1>
		<br> <span id="sp"> 3秒后跳转页面！！！</span><br> <a
			href="welc_admin.jsp">若没有跳转，请点击此处！！！</a>
	</div>
</body>
</html>