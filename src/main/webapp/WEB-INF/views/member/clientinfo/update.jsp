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
	
	if(form.name.value.length == 0){
		alert("请将客户名称填写完整！");
		return false;
	}
	
	if(form.ssn.value.length == 0){
		alert("请将用户身份信息填写完整！");
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
				location.href = "${pageContext.request.contextPath}/Member/ClientInfo/";
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
    <li><a href="${pageContext.request.contextPath}/Member/ClientInfo/">客户信息管理</a></li>
    <li><a href="#">修改</a></li>
    </ul>
    </div>
    
   <form action="${pageContext.request.contextPath}/Member/ClientInfo/update" method="post" onsubmit="return submitForm(this)">
    <div class="formbody">
    <div class="formtitle"><span>客户基本信息</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="key" value="${item.key }" />
    <li><label>客户姓名</label><input name="name" type="text" class="dfinput" value="${item.name }" /><i>姓名不能超过8个字符</i></li>
    <li><label>身份证号</label><input name="ssn" type="text" class="dfinput" value="${item.ssn }"/></li>
    <li><label>联系方式</label><input name="tel" type="text" class="dfinput" value="${item.tel }"/></li>
    <li><label>年收入（万元）</label><input name="salary" type="number" step="0.01" class="dfinput" value="${item.salary }"/></li>
    <li><label>资产（万元）</label><input name="balance" value="${item.balance }" type="number" value="0" step="0.01" class="dfinput" /></li>
    <li><label>负债（万元）</label><input name="debt" value="${item.debt }" type="number" value="0" step="0.01" class="dfinput" /></li>
    <li><label>所在单位</label><input name="unit" value="${item.unit }" type="text" class="dfinput" /></li>
    <li><label>家庭住址</label><input name="add" value="${item.add }" type="text" class="dfinput" /></li>
    <li><label>业务关联</label><input name="business" value="${item.business }" type="text" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
</body>

</html>
