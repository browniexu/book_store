<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>show.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/css.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/pwd.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/show.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	
  </head>
<script type="text/javascript">

</script>
  
  <body>
    <div class="div0">
    	<span>用户基本信息</span>
    </div>

	<div class="div1">
		<form action="<c:url value='/UserServlet'/>" method="post" target="_top">
			<input type="hidden" name="method" value="showMessage" readonly="readonly"/>
		<table>
			<tr>
				<td align="right">用户名:</td>
				<td><input class="input" type="text" name="username" id="username" readonly="readonly" value="${sessionScope.sessionUser.loginname}"/></td>
			</tr>
			<tr>
				<td align="right">密码:</td>
				<td><input class="input" type="text" name="password" id="newpass" readonly="readonly" value="${sessionScope.sessionUser.loginpass}"/></td>
			</tr>
			<tr>
				<td align="right">Email:</td>
				<td><input class="input" type="text" name="email" id="email" readonly="readonly" value="${sessionScope.sessionUser.email}"/></td>
			</tr>
			<%-- <tr>
				<td align="right">Email:</td>
				<td><input class="input" type="text" name="email" id="email" readonly="readonly" value="${sessionScope.sessionUser.loginpass}"/></td>
			</tr> --%>
			
		</table>
		</form>
	</div>
  </body>
</html>
