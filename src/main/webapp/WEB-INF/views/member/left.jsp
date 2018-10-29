<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>菜单</div>
    <dl class="leftmenu">
	    <dd>
	    <div class="title">
	    <span><img src="${pageContext.request.contextPath}/static/images/leftico01.png" /></span>客户经理信息管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="${pageContext.request.contextPath}/static/manager/clientMgr.html" target="rightFrame">客户经理信息综合维护</a><i></i></li>
	        <li><cite></cite><a href="${pageContext.request.contextPath}/static/manager/clientMgrImport.html" target="rightFrame">批量导入</a><i></i></li>
   			<li><cite></cite><a href="${pageContext.request.contextPath}/static/manager/clientMgrInfoOther.html"  target="rightFrame">客户经理辅助信息维护</a><i></i></li>
	        </ul>    
	    </dd>
	   <dd>
	    <div class="title">
	    <span><img src="${pageContext.request.contextPath}/static/images/leftico01.png" /></span>营销管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="${pageContext.request.contextPath}/Member/ClientInfo/index" target="rightFrame">客户信息管理</a><i></i></li>
	        <li><cite></cite><a href="${pageContext.request.contextPath}/static/manager/marketRecord.html" target="rightFrame">营销记录管理</a><i></i></li>
	        </ul>    
	    </dd>
	   <dd>
	    <div class="title">
	    <span><img src="${pageContext.request.contextPath}/static/images/leftico01.png" /></span>日常工作管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="${pageContext.request.contextPath}/static/manager/regularMeeting.html" target="rightFrame">例会管理</a><i></i></li>
	        <li><cite></cite><a href="${pageContext.request.contextPath}/Member/WorkMgr/" target="rightFrame">工作管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <dd>
	    <div class="title">
	    <span><img src="${pageContext.request.contextPath}/static/images/leftico01.png" /></span>报表管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="${pageContext.request.contextPath}/static/manager/clientMgrStat.html" target="rightFrame">报表管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <dd>
	    <div class="title">
	    <span><img src="${pageContext.request.contextPath}/static/images/leftico01.png" /></span>学习园地管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="${pageContext.request.contextPath}/static/manager/studyMgr.html" target="rightFrame">学习园地管理</a><i></i></li>
	        </ul>    
	   </dd>
	   <dd>
	    <div class="title">
	    <span><img src="${pageContext.request.contextPath}/static/images/leftico01.png" /></span>用户管理
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="${pageContext.request.contextPath}/Member/UserInfo" target="rightFrame">用户管理</a><i></i></li>
	        </ul>    
	   </dd>
    
    </dl>
    
</body>
</html>

