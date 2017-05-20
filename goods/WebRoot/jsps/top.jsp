<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>top</title>
	<script type="text/javascript">
	function getURL(){ 
    var curWwwPath = window.document.location.href; 
    //获取主机地址之后的目录，如： cis/website/meun.htm 
    var pathName = window.document.location.pathname; 
    var pos = curWwwPath.indexOf(pathName); //获取主机地址，如： http://localhost:8080 
    var localhostPaht = curWwwPath.substring(0, pos); //获取带"/"的项目名，如：/cis 
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1); 
    var rootPath = localhostPaht + projectName; 
    return rootPath; 
     
} 
	</script>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
		
body {
	background: #15B69A;
	margin: 0px;
	color: #ffffff;
}

a {
	text-decoration: none;
	color: #C0C0C0;
	font-weight: 900;
}

a:hover {
	text-decoration: underline;
	color: #C0C0C0;
	font-weight: 900;
}
</style>
	</head>
	<body style="background-image: url('../images/topbackground.jpg');"
		>
		<h1 style="text-align: center;">
			<div></div>
		</h1>
		<div style="font-size: 10pt; line-height: 10px;">
			<%-- 根据用户是否登录，显示不同的链接 --%>
			<c:choose>
				<c:when test="${empty sessionScope.sessionUser }">
					<div align="right" style="margin-top: 80px; margin-right: 10px;">

						<a href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">|
							会员登录 |</a>

						<a href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">
							注册会员 |</a>
					</div>
				</c:when>

				<c:otherwise>
					<div align="right" style="margin-top: 85px">
					    <a href="<c:url value='body.jsp'/>" target="body">
							 | 首页 |</a>
						<a href="<c:url value='/jsps/user/show.jsp'/>" target="body">
							会员：${sessionScope.sessionUser.loginname}</a>
						<a href="<c:url value='/CartItemServlet?method=myCart'/>"
							target="body">| 我的购物车 |</a>
						<a href="<c:url value='/OrderServlet?method=myOrders'/>"
							target="body"> 我的订单 |</a>
						<a href="<c:url value='/jsps/user/pwd.jsp'/>" target="body">
							修改密码 |</a>
						<a href="<c:url value='/UserServlet?method=quit'/>"
							target="_parent">退出 |</a>
					</div>
				</c:otherwise>
			</c:choose>



		</div>
	</body>
</html>
