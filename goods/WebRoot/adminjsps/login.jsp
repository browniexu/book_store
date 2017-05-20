<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
		<style type="text/css">
	h1{
	text-align: center;
	color: #00FF7F;
	padding-top: 0.45em;
	}
	span,p{
	margin-left: 160px;
	}
	input{
	margin-left: 10px;
	margin-top: 20px;
	}
	.main{
	margin-top:60px;
	margin-left:380px;
	background-color: #ffffff;
	height: 330px;
	width: 600px;
	border: 1px solid #66CDAA;
	}
	form{
	padding-top:20px;
	
	}
	</style>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#adminname").val()) {
				alert("管理员名称不能为空！");
				return false;
			}
			if(!$("#adminpwd").val()) {
				alert("管理员密码不能为空！");
				return false;
			}
			return true;
		}
		function clearMsg(){
		$("#msg").text("");
		}
	</script>
  </head>
  
  <body style="background-color: #f5f5f5">
  <div class="main">
  
  
<h1>管理员登录页面</h1>
<hr/>
  
<form action="<c:url value='/AdminServlet'/>" method="post" onsubmit="return checkForm()" target="_top">
	<input type="hidden" name="method" value="login"/>
	<span>管理员账户</span><input class="in" type="text" name="adminname" value="" id="adminname" onclick="clearMsg()"/><br/>
	<span>密　　　码</span><input class="in" type="password" name="adminpwd" id="adminpwd" onclick="clearMsg()"/><br/>
	<span style="margin-left: 238px"><input type="reset" value="重置" style="background-color: #FFC125;color: white;width: 80px; height: 27px"/>
	<input type="submit" value="进入" style="background-color: #FFC125;color: white;width: 80px; height: 27px"/></span>
</form>
<p id="msg" style="font-weight: 900; color: red">${msg }</p>
</div>
  </body>
</html>
