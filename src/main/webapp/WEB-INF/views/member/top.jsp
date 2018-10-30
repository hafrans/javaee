<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>


</head>

<body style="background:url(${pageContext.request.contextPath}/static/images/topbg.gif) repeat-x;">

    <div  class="topleft">
    <a href="main.html" target="_parent"><img src="${pageContext.request.contextPath}/static/images/logo.png" title="系统首页" /></a>
    </div>
    <div class="topright">    
    <ul>
    <li><span><img src="${pageContext.request.contextPath}/static/images/i07.png" title="论坛"  class="helpimg" height="16" width="16"/></span><a href="#">论坛</a></li>
    <li><span><img src="${pageContext.request.contextPath}/static/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><span><img src="${pageContext.request.contextPath}/static/images/i10.png" title="注销"  class="helpimg" height="16" width="16"/></span><a href="login.html" target="_parent">注销</a></li>
    </ul>
     
    <div class="user">
    <span>欢迎
    <c:choose>
    	<c:when test="${login_entity.roleId == '1' }">
    		管理员 
    	</c:when>
    	<c:otherwise>
    		客户经理
    	</c:otherwise>
    </c:choose>
    ${sessionScope['login_entity'].name}登录！</span>
    </div>   
    </div>

</body>
</html>

