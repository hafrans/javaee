<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});

function submitForm(form){
	
	if(form.management.value.length == 0){
		alert("请将客户维护栏目填写完整！");
		return false;
	}
	
	if(form.product.value.length == 0){
		alert("请将产品信息栏目填写完整！");
		return false;
	}
	
	$.ajax({
		url:form.action,
		type:"POST",
		dataType:"json",
		data:$(form).serialize(),
		success:function(data,text,xhr){
			alert(data.msg);
			if(data.status == 1){
				location.href = "${pageContext.request.contextPath}/Member/WorkMgr/";
			}
		},
		error:function(xhr,text,errThrown){
			alert("网络异常，请稍后重试！");
		}
	});
	
	
	
	return false;
}

</script>


</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${pageContext.request.contextPath}/Member/WorkMgr/">工作管理</a></li>
    <li><a href="${pageContext.request.contextPath}/Member/WorkMgr/add">添加</a></li>
    </ul>
    </div>
    
    <form action="${pageContext.request.contextPath}/Member/WorkMgr/add" method="post" onsubmit="return submitForm(this)">
    <div class="formbody">
    <div class="formtitle"><span>工作记录</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="date" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>" />
    <li><label>客户维护</label><textarea name="management" cols="" rows="" class="textinput"></textarea></li>
    <li><label>产品信息</label><textarea name="product" cols="" rows="" class="textinput"></textarea></li>
    <li><label>货后管理</label><textarea name="loan" cols="" rows="" class="textinput"></textarea></li>
    <li><label>风险预警</label><textarea name="warning" cols="" rows="" class="textinput"></textarea></li>
    <li><label>发现问题</label><textarea name="issue" cols="" rows="" class="textinput"></textarea></li>
    <li><label>工作建议及感悟</label><textarea name="workProposal" cols="" rows="" class="textinput"></textarea></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
    

</body>

</html>
